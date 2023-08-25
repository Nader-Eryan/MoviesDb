import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:whats_for_tonight/core/utils/service_locator.dart';
import 'package:whats_for_tonight/features/profile/data/repos/profile_repo.dart';

import '../../../../core/utils/functions/custom_snackbar.dart';
import '../../../../generated/l10n.dart';

class ProfileRepoImpl implements ProfileRepo {
  @override
  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await getIt.get<FirebaseAuth>().signInWithCredential(credential);
  }

  @override
  Future<void> signInUser(
      BuildContext context, String email, String password) async {
    try {
      await getIt
          .get<FirebaseAuth>()
          .signInWithEmailAndPassword(email: email, password: password);
      // customSnackBar(context, S.of(context).SignedInSuccessfullyEnjoy);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        customSnackBar(context, S.of(context).NoUserFoundForThatEmail);
      } else if (e.code == 'wrong-password') {
        customSnackBar(context, S.of(context).WrongPasswordProvidedForThatUser);
      }
    }
  }

  @override
  Future<void> registerUser(
      BuildContext context, String email, String password) async {
    try {
      await getIt.get<FirebaseAuth>().createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
      // customSnackBar(context, S.of(context).RegisteredSuccessfullyEnjoy);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        customSnackBar(context, S.of(context).ThePasswordProvidedIsTooWeak);
      } else if (e.code == 'email-already-in-use') {
        customSnackBar(
            context, S.of(context).TheAccountAlreadyExistsForThatEmail);
      }
    } catch (e) {
      customSnackBar(context, e);
    }
  }

  @override
  Future<void> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    if (loginResult.accessToken != null) {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      // Once signed in, return the UserCredential
      getIt.get<FirebaseAuth>().signInWithCredential(facebookAuthCredential);
    }
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await getIt.get<FirebaseAuth>().sendPasswordResetEmail(email: email);
  }
}
