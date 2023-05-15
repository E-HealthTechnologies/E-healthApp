import 'package:flutter/material.dart';

class DoctorOrPatientScreen extends StatefulWidget {
  const DoctorOrPatientScreen({Key? key}) : super(key: key);

  @override
  State<DoctorOrPatientScreen> createState() => _DoctorOrPatientScreenState();
}

class _DoctorOrPatientScreenState extends State<DoctorOrPatientScreen> {
  BottomNavigationBarItem getItem() {
    return BottomNavigationBarItem(
      icon: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        height: 56,
        width: 56,
        child: const Icon(Icons.favorite),
      ),
      label: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/pat/signIn');
              },
              child: Text('Patient'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/doc/signUp');
              },
              child: Text('Doctor'),
            ),
          ],
        ),
      ),
    );
  }
}
