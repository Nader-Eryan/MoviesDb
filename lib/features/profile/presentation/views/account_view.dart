import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/core/utils/functions/custom_arrow_back_app_bar.dart';
import 'package:whats_for_tonight/core/utils/styles.dart';
import 'package:whats_for_tonight/features/profile/presentation/views/widgets/custom_button.dart';

import 'widgets/account_text_field_border.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isObscure = true, isLogin = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: customArrowBackAppBar(context),
      body: FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SizedBox(
            height: 700.h,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  FormBuilderTextField(
                    name: 'email',
                    controller: _emailController,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.2),
                        filled: true,
                        prefixIcon: const Icon(FontAwesomeIcons.envelope),
                        focusedBorder: focusBorder(),
                        enabledBorder: enabledBorder(context),
                        errorBorder: enabledBorder(context),
                        labelText: 'Email'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'password',
                    controller: _passwordController,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.withOpacity(0.2),
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.lock_outlined,
                        size: 32,
                      ),
                      focusedBorder: focusBorder(),
                      enabledBorder: enabledBorder(context),
                      errorBorder: enabledBorder(context),
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        icon: isObscure
                            ? const Icon(FontAwesomeIcons.eye)
                            : const Icon(FontAwesomeIcons.eyeSlash),
                      ),
                    ),
                    obscureText: isObscure,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(8),
                    ]),
                  ),
                  isLogin
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot password?',
                                style: Styles.textStyleMedium16
                                    .copyWith(color: Colors.amber.shade600),
                              ),
                            )
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: FormBuilderTextField(
                            controller: _confirmPasswordController,
                            name: 'confirm password',
                            decoration: InputDecoration(
                              fillColor: Colors.grey.withOpacity(0.2),
                              filled: true,
                              prefixIcon: const Icon(
                                Icons.lock_outlined,
                                size: 32,
                              ),
                              focusedBorder: focusBorder(),
                              enabledBorder: enabledBorder(context),
                              errorBorder: enabledBorder(context),
                              labelText: 'Confirm password',
                            ),
                            obscureText: isObscure,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.equal(
                                  _passwordController.text,
                                  errorText:
                                      'This value must be equal to the password'),
                            ]),
                          ),
                        ),
                  SizedBox(
                    height: isLogin ? 60 : 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: customButton(
                          _formKey,
                          Colors.amber,
                          isLogin ? 'Sign In' : 'Register',
                          () {
                            // Validate and save the form values
                            _formKey.currentState?.save();
                            print(_formKey.currentState?.validate().toString());
                            // On another side, can access all field values without saving form with instantValues
                            //print(_formKey.currentState?.validate().toString());
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8.0, vertical: 18),
                        child: Text(
                          'Or use social media',
                          style: Styles.textStyleMedium16,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: customButton(
                            _formKey,
                            Colors.grey.withOpacity(0.7),
                            'Sign In with Google',
                            () {},
                            imgUrl: 'assets/images/google.png'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: customButton(
                            _formKey,
                            Colors.grey.withOpacity(0.7),
                            'Sign In with Apple',
                            () {},
                            imgUrl: 'assets/images/apple.png'),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    child: Text(
                      isLogin
                          ? 'Don\'t have an account?'
                          : 'Already have an account?',
                      style: Styles.textStyleMedium16
                          .copyWith(color: Colors.amber.shade600),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
