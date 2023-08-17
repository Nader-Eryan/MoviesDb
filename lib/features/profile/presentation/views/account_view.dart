// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/core/utils/constants.dart';
import 'package:whats_for_tonight/core/utils/functions/custom_arrow_back_app_bar.dart';
import 'package:whats_for_tonight/core/utils/functions/custom_snackbar.dart';
import 'package:whats_for_tonight/core/utils/styles.dart';
import 'package:whats_for_tonight/features/profile/presentation/views/widgets/custom_button.dart';

import '../../../../generated/l10n.dart';
import 'widgets/account_text_field_border.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isObscure = true, isLogin = true, loggedIn = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        loggedIn = false;
      } else {
        loggedIn = true;
      }
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: customArrowBackAppBar(context),
      body: !loggedIn
          ? FormBuilder(
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
                              focusedErrorBorder: enabledBorder(context),
                              labelText: S.of(context).Email),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: S.of(context).TheFieldCannotBeEmpty),
                            FormBuilderValidators.email(
                                errorText: S
                                    .of(context)
                                    .TheFieldRequiresAValidEmailAddress),
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
                            focusedErrorBorder: enabledBorder(context),
                            labelText: S.of(context).Password,
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
                            FormBuilderValidators.required(
                                errorText: S.of(context).TheFieldCannotBeEmpty),
                            FormBuilderValidators.minLength(8,
                                errorText: S
                                    .of(context)
                                    .ValueMustHaveALengthGreaterThanOrEqualTo8),
                          ]),
                        ),
                        isLogin
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      S.of(context).ForgotPassword,
                                      style: Styles.textStyleMedium16.copyWith(
                                          color: Colors.amber.shade600),
                                    ),
                                  )
                                ],
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
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
                                    focusedErrorBorder: enabledBorder(context),
                                    labelText: S.of(context).ConfirmPasword,
                                  ),
                                  obscureText: isObscure,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.equal(
                                        _passwordController.text,
                                        errorText: S
                                            .of(context)
                                            .TheValueMustBeEqualToThePassword),
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
                                Colors.amber,
                                isLogin
                                    ? S.of(context).SignIn
                                    : S.of(context).Register,
                                () async {
                                  // Validate and save the form values
                                  // _formKey.currentState?.save();
                                  setState(() {});

                                  if (_formKey.currentState?.validate() ==
                                      true) {
                                    if (!isLogin) {
                                      await registerUser(context);
                                    } else {
                                      await signInUser(context);
                                    }
                                  }
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
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 18),
                              child: Text(
                                S.of(context).OrUseSocialMedial,
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
                              child: customButton(Colors.grey.withOpacity(0.7),
                                  S.of(context).SignInWithGoogle, () {},
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
                              child: customButton(Colors.grey.withOpacity(0.7),
                                  S.of(context).SignInWithApple, () {},
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
                                ? S.of(context).DontHaveAnAccount
                                : S.of(context).AlreadyHaveAnAccount,
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
            )
          : Center(
              child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 200.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      'Already signed in',
                      style: Styles.textStyleBold18,
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    customButton(kActiveIcon, 'Sign out', () async {
                      await FirebaseAuth.instance.signOut();
                      customSnackBar(context, 'Signed out');
                    })
                  ],
                ),
              ),
            )),
    ));
  }

  Future<void> signInUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      _passwordController.clear();
      customSnackBar(context, 'Signed in successfully. Enjoy!');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        customSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        customSnackBar(context, 'Wrong password provided for that user.');
      }
    }
  }

  Future<void> registerUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      _passwordController.clear();
      _confirmPasswordController.clear();
      customSnackBar(context, 'Registered successfully. Enjoy!');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        customSnackBar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        customSnackBar(context, 'The account already exists for that email.');
      }
    } catch (e) {
      customSnackBar(context, e);
    }
  }
}
