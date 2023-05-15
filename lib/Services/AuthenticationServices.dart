import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationServices {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<CreateAccountResult> createNewUser(
      {required String email, required String password}) async {
    try {
      CreateAccountResult res;
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        res = CreateAccountResult(
            success: true,
            uid: result.user!.uid.toString(),
            message: 'Account has been created');
      } else {
        res = CreateAccountResult(
            success: false, message: 'Creation of the account has failed');
      }
      return res;
    } catch (e) {
      CreateAccountResult res;
      res = CreateAccountResult(
          success: false,
          message: 'Failed to create your account \n' + e.toString());

      return res;
    }
  }

  Future<CreateAccountResult> addPatInfoToDB({
    required String uid,
    required String fName,
    required String lName,
    required String email,
    required String password,
    required String birth,
    required String weight,
    required String blood,
    required String gender,
    required String phone,
    required String doctorUid,
  }) async {
    var user = FirebaseFirestore.instance.collection('Patients');

    final json = {
      'First name': fName,
      'Last name': lName,
      'Email': email,
      'Password': password,
      'Date of birth': birth,
      'Weight': weight,
      'Blood': blood,
      'Gender': gender,
      'Phone': phone,
      'User id': uid,
      'Doctor id': doctorUid,
    };
    CreateAccountResult res;
    bool result = false;
    String message = '';
    try {
      await user.doc(uid).set(json).then(
        (value) {
          result = true;
          message = 'Patient Data added successfully';
          // return res = CreateAccountResult(
          //     success: true, uid: 'Data added successfully');
        },
      ).catchError(
        (error) {
          result = false;
          message = 'Error occurred while storing patient data';
          // return res =
          //     CreateAccountResult(success: false, uid: 'Error occurred');
        },
      );
      return CreateAccountResult(success: result, message: message);
      // if (result) {
      //   return CreateAccountResult(
      //       success: true, uid: 'Data added successfully');
      // } else {
      //   return CreateAccountResult(
      //       success: true, uid: 'Data added successfully');
      // }
    } catch (e) {
      return res = CreateAccountResult(
          success: false,
          message: 'failed to store patient data \n' + e.toString());
    }
  }

  Future<CreateAccountResult> addPatToMeasurements({
    required String patUid,
  }) async {
    CreateAccountResult res;
    bool state = false;
    String message = '';
    var user = FirebaseFirestore.instance.collection('Measurements');
    try {
      await user.doc(patUid).set({'Glucose': FieldValue.arrayUnion([])}).then(
        (value) async {
          await user
              .doc(patUid)
              .update({'Temperature': FieldValue.arrayUnion([])}).then(
            (value) async {
              await user
                  .doc(patUid)
                  .update({'Heart beat': FieldValue.arrayUnion([])}).then(
                (value) async {
                  await user.doc(patUid).update(
                      {'Blood pressure': FieldValue.arrayUnion([])}).then(
                    (value) {
                      state = true;
                      message = 'Measurements has been added successfully';
                      // return res = CreateAccountResult(
                      //     success: true, uid: 'Data added successfully');
                    },
                  ).catchError(
                    (onError) {
                      state = false;
                      message = 'Error occured while adding measurement \n' +
                          onError.toString();
                      // return res = CreateAccountResult(
                      //     success: false,
                      //     uid: 'Data added successfully' + onError.toString());
                    },
                  );
                },
              ).catchError((onError) {
                state = false;
                message = 'Error occured while adding measurement \n' +
                    onError.toString();
              });
            },
          ).catchError((onError) {
            state = false;
            message = 'Error occured while adding measurement \n' +
                onError.toString();
          });
        },
      ).catchError((onError) {
        state = false;
        message =
            'Error occured while adding measurement \n' + onError.toString();
      });

      return res = CreateAccountResult(success: state, message: message);
    } catch (e) {
      return res = CreateAccountResult(
          success: false,
          message: 'Error occured while adding measurement \n' + e.toString());
    }
  }

  Future<CreateAccountResult> addDocInfoToDB({
    required String uid,
    required String fullName,
    required String email,
    required String password,
    required String gender,
    required String speciality,
    required String hosName,
    required String hosAddress,
  }) async {
    CreateAccountResult res;
    var user = FirebaseFirestore.instance.collection('Doctors');

    final json = {
      'Full name': fullName,
      'Email': email,
      'Password': password,
      'Gender': gender,
      'Speciality': speciality,
      'HosName': hosName,
      'HosAddress': hosAddress,
      'IDs': FieldValue.arrayUnion([])
    };
    try {
      await user.doc(uid).set(json);
      // await user.doc(uid).collection('Patients List').doc('IDs').set(
      //   {'IDs': FieldValue.arrayUnion([])},
      // );
      return res = CreateAccountResult(
          success: true, message: 'Data added successfully');
    } catch (e) {
      return res = CreateAccountResult(success: false, message: e.toString());
    }
  }

  Future<CreateAccountResult> addPatToDoc({
    required String patUid,
    required String docUid,
  }) async {
    CreateAccountResult res;
    bool state = false;
    String message = '';
    var user = FirebaseFirestore.instance.collection('Doctors').doc(docUid);
    try {
      await user.update({
        'IDs': FieldValue.arrayUnion([patUid]),
      }).then(
        (value) {
          state = true;
          message = 'Patient has been added to doctor';
        },
      ).catchError(
        (onError) {
          state = false;
          message ='Error occurred while adding patient to doctor \n'+ onError.toString();
        },
      );
      return res = CreateAccountResult(success: state, message: message);
    } catch (e) {
      return res = CreateAccountResult(success: false, message: 'Error occurred while adding patient to doctor \n'+e.toString());
    }
  }

  Future<CreateAccountResult> signIn(
      {required String email, required String password}) async {
    CreateAccountResult res;

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        log('user uid :' + user.uid.toString());
        // return user.uid.toString();
        return res = CreateAccountResult(success: true, message: 'Logged in successfully' ,uid:user.uid.toString() );

      } else
        return res = CreateAccountResult(success: false, message: 'Logged in was not successful');
    } catch (e) {
      log(e.toString());
      return res = CreateAccountResult(success: false, message: 'Logged in was not successful'+ e.toString());

    }
  }

}

class CreateAccountResult {
  CreateAccountResult({
    this.uid = '',
    required this.success,
    this.message = '',
  });
  final String uid, message;
  final bool success;
}

class AddDataToFireStore {
  AddDataToFireStore({
    required this.success,
    required this.error,
  });
  final String error;
  final bool success;
}
