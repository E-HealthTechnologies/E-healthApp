import 'package:cloud_firestore/cloud_firestore.dart';

class PatientDataModel {
  final String? id;
  final String email,
      fName,
      lName,
      gender,
      blood,
      dateOfBirth,
      phone,
      weight,
      password;

  PatientDataModel({
    this.id,
      this.email='',
      this.password='',
      this.fName='',
      this.lName='',
      this.gender='',
      this.blood='',
      this.dateOfBirth='',
      this.phone='',
      this.weight='',
  });

  toJson() {
    return {
      'First name': fName,
      'Last name': lName,
      'Email': email,
      'Password': password,
      'Gender': gender,
      'Blood': bool,
      'Date of birth': dateOfBirth,
      'Phone': phone,
      'Weight': weight,
    };
  }

  factory PatientDataModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    // print(doc.id);
    return PatientDataModel(
      id: doc.id,
      email: data['Email'],
      password: data['Password'],
      fName: data['First name'],
      lName: data['Last name'],
      gender: data['Gender'],
      blood: data['Blood'],
      dateOfBirth: data['Date of birth'],
      phone: data['Phone'],
      weight: data['Weight'],
    );
  }

  factory PatientDataModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return PatientDataModel(
      id: document.id,
      email: data['Email'],
      password: data['Password'],
      fName: data['First name'],
      lName: data['Last name'],
      gender: data['Gender'],
      blood: data['Password'],
      dateOfBirth: data['Date of birth'],
      phone: data['Phone'],
      weight: data['Weight'],
    );
  }
}

Future<PatientDataModel> getPatientData({required String uid}) async {
  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('Patients');
  final DocumentSnapshot snapshot = await usersRef.doc(uid).get();
  return PatientDataModel.fromFirestore(snapshot);
}
