part of 'package:snapp/features/authentication/views/pages/sign_up_page.dart';

class _SignUpForm extends ConsumerStatefulWidget {
  const _SignUpForm();

  @override
  ConsumerState<_SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<_SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SignUpModel model = ref.watch(signUpProvider);
    SignUpViewModel viewModel = ref.watch(signUpProvider.notifier);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: ApplicationStrings.firstName,
                    prefixIcon: Icon(Icons.person),
                  ),
                  onChanged: viewModel.onFirstNameChanged,
                  validator: TextValidator.validateName,
                ),
              ),
              SizedBox(width: context.mediumValue),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: ApplicationStrings.lastName,
                    prefixIcon: Icon(Icons.person),
                  ),
                  onChanged: viewModel.onLastNameChanged,
                  validator: TextValidator.validateName,
                ),
              ),
            ],
          ),
          SizedBox(height: context.mediumValue),
          TextFormField(
            decoration: InputDecoration(
              hintText: ApplicationStrings.emailAddress,
              prefixIcon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: viewModel.onEmailAddressChanged,
            validator: TextValidator.validateEmailAddress,
          ),
          SizedBox(height: context.mediumValue),
          TextFormField(
            decoration: InputDecoration(
              hintText: ApplicationStrings.username,
              prefixIcon: Icon(Icons.alternate_email_rounded),
            ),
            onChanged: viewModel.onUsernameChanged,
            validator: TextValidator.validateUsername,
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
            validator: TextValidator.validatePassword,
          ),
          SizedBox(height: context.mediumValue),
          TextFormField(
            decoration: InputDecoration(
              hintText: ApplicationStrings.confirmationPassword,
              prefixIcon: Icon(Icons.lock),
              suffixIcon: CheckboxIconButton(
                activeIcon: Icon(Icons.visibility),
                inactiveIcon: Icon(Icons.visibility_off),
                value: model.obscureConfirmationPassword,
                onChanged: viewModel.setConfirmationPasswordObscurity,
              ),
            ),
            obscureText: model.obscureConfirmationPassword,
            onChanged: viewModel.onConfirmationPasswordChanged,
            validator: TextValidator.validateText,
          ),
          SizedBox(height: context.mediumValue),
          Center(
            child: ElevatedButton(
              onPressed: () => viewModel.onSignUpButtonPressed(
                context: context,
                key: _formKey,
                ref: ref,
              ),
              child: Text(ApplicationStrings.signUp),
            ),
          ),
        ],
      ),
    );
  }
}
