import 'package:flutter/material.dart';

abstract class ProfileRepo {
  Future<void> signInWithGoogle();
  Future<void> signInUser(BuildContext context, String email, String password);
  Future<void> registerUser(
      BuildContext context, String email, String password);
  Future<void> signInWithFacebook();
  Future<void> resetPassword({required String email});
}
