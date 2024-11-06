part of 'package:snapp/features/authentication/views/pages/sign_in_page.dart';

class _SignInForm extends ConsumerStatefulWidget {
  const _SignInForm();

  @override
  ConsumerState<_SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<_SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SignInModel model = ref.watch(signInProvider);
    SignInViewModel viewModel = ref.watch(signInProvider.notifier);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: ApplicationStrings.emailAddress,
              prefixIcon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: viewModel.onIdentifierChanged,
            validator: TextValidator.validateText,
          ),
          SizedBox(height: context.mediumValue),
          TextFormField(
            decoration: InputDecoration(
              hintText: ApplicationStrings.password,
              prefixIcon: Icon(Icons.lock),
              suffixIcon: CheckboxIconButton(
                activeIcon: Icon(Icons.visibility),
                inactiveIcon: Icon(Icons.visibility_off),
                value: model.obscurePassword,
                onChanged: viewModel.setPasswordObscurity,
              ),
            ),
            obscureText: model.obscurePassword,
            onChanged: viewModel.onPasswordChanged,
            validator: TextValidator.validateText,
          ),
          SizedBox(height: context.mediumValue),
          Row(
            children: [
              Expanded(
                child: CustomCheckboxListTile(
                  title: Text(ApplicationStrings.rememberMe),
                  value: model.saveSession,
                  onChanged: viewModel.setSaveSession,
                ),
              ),
              SizedBox(width: context.mediumValue),
              ElevatedButton(
                onPressed: () => viewModel.onSignInButtonPressed(
                  context: context,
                  key: _formKey,
                  ref: ref,
                ),
                child: Text(ApplicationStrings.signIn),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
