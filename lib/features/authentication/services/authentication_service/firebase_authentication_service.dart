import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:snapp/core/constants/exceptions.dart';
import 'package:snapp/features/authentication/models/sign_up_model.dart';
import 'package:snapp/features/authentication/models/snapp_user.dart';
import 'package:snapp/features/authentication/services/authentication_service/authentication_service.dart';

class FirebaseAuthenticationService implements AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _userCollection = 'users';

  @override
  Future<SnappUser> signIn(String identifier, String password) async {
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: identifier,
        password: password,
      );

      final DocumentSnapshot snapshot = await _firestore
          .collection(_userCollection)
          .doc(credential.user!.uid)
          .get();

      return SnappUser.fromMap(snapshot.data() as Map<String, dynamic>);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw Exceptions.invalidCredentialError;
      } else if (e.code == 'network-request-failed') {
        throw Exceptions.networkError;
      } else {
        debugPrint(
          'FirebaseAuthException at '
          'FirebaseAuthenticationService.signIn: $e',
        );
        throw Exceptions.unknownError;
      }
    } catch (e) {
      debugPrint('FirebaseAuthenticationService.signIn: $e');
      throw Exceptions.unknownError;
    }
  }

  @override
  Future<void> signUp(SignUpModel model) async {
    try {
      final usernameSnapshot = await _firestore
          .collection(_userCollection)
          .where('username', isEqualTo: model.username)
          .get();

      if (usernameSnapshot.docs.isNotEmpty) throw Exceptions.usernameInUseError;

      final credential = await _auth.createUserWithEmailAndPassword(
        email: model.emailAddress,
        password: model.password,
      );

      Map<String, dynamic> map = {
        'id': credential.user!.uid,
        'first_name': model.firstName,
        'last_name': model.lastName,
        'email_address': model.emailAddress,
        'username': model.username,
        'image_url': null,
        'about': null,
        'created_at': FieldValue.serverTimestamp(),
      };

      await _firestore
          .collection(_userCollection)
          .doc(credential.user!.uid)
          .set(map);
    } on CustomException catch (e) {
      if (e.code == 'username-in-use') {
        rethrow;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exceptions.emailAddressInUseError;
      } else if (e.code == 'network-request-failed') {
        throw Exceptions.networkError;
      } else {
        debugPrint(
          'FirebaseAuthException at '
          'FirebaseAuthenticationService.signUp: $e',
        );
        throw Exceptions.unknownError;
      }
    } catch (e) {
      debugPrint('FirebaseAuthenticationService.signUp: $e');
      throw Exceptions.unknownError;
    }
  }
}
