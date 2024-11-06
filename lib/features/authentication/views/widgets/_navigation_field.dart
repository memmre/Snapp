part of 'package:snapp/features/authentication/views/pages/sign_in_page.dart';

class _NavigationField extends StatelessWidget {
  const _NavigationField();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: NavigatorButton(
            icon: Icon(Icons.person_add_rounded),
            title: Text(ApplicationStrings.createAccount),
            page: SignUpPage(),
          ),
        ),
        Expanded(
          child: NavigatorButton(
            icon: Icon(Icons.lock_reset),
            title: Text(ApplicationStrings.resetPassword),
            page: Scaffold(),
          ),
        ),
      ],
    );
  }
}
