import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorDataModel {
  final String? id;
  final String email,
      fullName,
      gender,
      hosAddress,
      hosName,
      password,
      speciality;

  DoctorDataModel(
      {this.id,
      required this.email,
      required this.fullName,
      required this.gender,
      required this.hosAddress,
      required this.hosName,
      required this.password,
      required this.speciality});

  toJson() {
    return {
      'Full name': fullName,
      'Email': email,
      'Password': password,
      'Gender': gender,
      'Speciality': speciality,
      'HosName': hosName,
      'HosAddress': hosAddress,
    };
  }

  factory DoctorDataModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    // print(doc.id);
    return DoctorDataModel(
      id: doc.id,
      email: data['Email'],
      fullName: data['Full name'],
      gender: data['Gender'],
      hosAddress: data['HosAddress'],
      hosName: data['HosName'],
      password: data['Password'],
      speciality: data['Speciality'],
    );
  }

  factory DoctorDataModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return DoctorDataModel(
      id: document.id,
      email: data['Email'],
      fullName: data['Full name'],
      gender: data['Gender'],
      hosAddress: data['HosAddress'],
      hosName: data['HosName'],
      password: data['Password'],
      speciality: data['Speciality'],
    );
  }

}

  Future<List<DoctorDataModel>> getDoctorsData() async {
  final CollectionReference usersRef = FirebaseFirestore.instance.collection('Doctors');
  final QuerySnapshot snapshot = await usersRef.get();
  return snapshot.docs.map((doc) => DoctorDataModel.fromFirestore(doc)).toList();
}
