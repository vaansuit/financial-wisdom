import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financial_app/src/repositories/auth_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../models/user_model.dart';

class AuthRepositoryImpl extends AuthRepository {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static Reference storage = FirebaseStorage.instance.ref();

  @override
  Future<UserModel?> signinWithEmailAndPassword(
      String email, String password) async {
    try {
      auth.UserCredential result = await auth.FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await firestore.collection('users').doc(result.user?.uid ?? '').get();
      UserModel? user;
      if (documentSnapshot.exists) {
        user = UserModel.fromJson(documentSnapshot.data() ?? {});
      }
      return user;
    } on auth.FirebaseAuthException catch (exception, s) {
      debugPrint('$exception$s');
      switch ((exception).code) {
        case 'invalid-email':
          throw AuthException('Email address is malformed.');
        case 'wrong-password':
          throw AuthException('Wrong password.');
        case 'user-not-found':
          throw AuthException(
              'No user corresponding to the given email address.');
        case 'user-disabled':
          throw AuthException('This user has been disabled.');
        case 'too-many-requests':
          throw AuthException('Too many attempts to sign in as this user.');
        default:
          throw AuthException('Unexpected firebase error, Please try again.');
      }
    } catch (e, s) {
      debugPrint('$e$s');
      throw AuthException('Login failed, Please try again.');
    }
  }

  static Future<String?> createNewUser(UserModel user) async => await firestore
      .collection('users')
      .doc(user.userID)
      .set(user.toJson())
      .then((value) => null, onError: (e) => e);

  static signUpWithEmailAndPassword({
    required String emailAddress,
    required String password,
    required String userName,
  }) async {
    try {
      auth.UserCredential result =
          await auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      UserModel user = UserModel(
        email: emailAddress,
        userName: userName,
        userID: result.user?.uid ?? '',
      );
      String? errorMessage = await createNewUser(user);
      if (errorMessage == null) {
        return user;
      } else {
        return 'Couldn\'t sign up for firebase, Please try again.';
      }
    } on auth.FirebaseAuthException catch (error) {
      debugPrint('$error${error.stackTrace}');
      String message = 'Couldn\'t sign up';
      switch (error.code) {
        case 'email-already-in-use':
          message = 'Email already in use, Please pick another email!';
          break;
        case 'invalid-email':
          message = 'Enter valid e-mail';
          break;
        case 'operation-not-allowed':
          message = 'Email/password accounts are not enabled';
          break;
        case 'weak-password':
          message = 'Password must be more than 5 characters';
          break;
        case 'too-many-requests':
          message = 'Too many requests, Please try again later.';
          break;
      }
      return message;
    } catch (e, s) {
      debugPrint('FireStoreUtils.signUpWithEmailAndPassword $e $s');
      return 'Couldn\'t sign up';
    }
  }

  static logout() async {
    await auth.FirebaseAuth.instance.signOut();
  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);
}
