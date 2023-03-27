import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PatLoginScreen extends StatefulWidget {
  const PatLoginScreen({Key? key}) : super(key: key);

  @override
  State<PatLoginScreen> createState() => _PatLoginScreenState();
}

class _PatLoginScreenState extends State<PatLoginScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    log(fem.toString());
    double ffem = fem * 0.97;
    log(ffem.toString());

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(28 * fem, 131 * fem, 29 * fem, 29 * fem),
        decoration: BoxDecoration(
          color: Color(0xfff5f5f5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'LOGO',
                  style: TextStyle(
                    fontSize: 80 * ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.2175 * ffem / fem,
                    color: Color(0xff3f51b5),
                  ),
                ),
                SizedBox(height: 40 * fem),
                Text(
                  'Log in to Account',
                  style: TextStyle(
                    fontSize: 25 * ffem,
                    fontWeight: FontWeight.w600,
                    height: 1.2175 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                ),
                SizedBox(height: 40 * fem),
                CostumeTextField(
                  fem: fem,
                  hintText: 'Email',
                  prefixIcon: Icon(FontAwesomeIcons.envelope),
                ),
                SizedBox(height: 15 * fem),
                CostumeTextField(
                  fem: fem,
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline),
                  password: GestureDetector(
                    onTap: (() {
                      log('message');
                      //      BlocProvider.of<AuthBloc>(context).add(
                      //      PasswordVisibiltyChangeEvent(
                      //      !context.read<AuthBloc>().state.passwordVisible));
                    }),
                    child: Icon(FontAwesomeIcons.eye),
                  ),
                  hide: true,
                ),
                SizedBox(height: 2 * fem),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 7 * fem),
                    Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity:
                      VisualDensity(horizontal: -4, vertical: -4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0 * fem),
                      ),
                      side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(
                            width: 2.0,
                            color: Color.fromARGB(100, 33, 150, 243)),
                      ),
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    SizedBox(width: 5 * fem),
                    Text(
                      'Remember me',
                      style: TextStyle(
                        fontSize: 13 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2175 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20 * fem),
                BlueButton(
                  fem: fem,
                  ffem: ffem,
                  title: 'Sign In',
                  onPressed: () {
                    log('message');
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account? ',
                  style: TextStyle(
                    fontSize: 20 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2175 * ffem / fem,
                    color: Color(0xffaaaaaa),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/pat/signUp');
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.2175 * ffem / fem,
                      color: Color(0xff2196f3),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BlueButton extends StatelessWidget {
  const BlueButton({
    required this.fem,
    required this.ffem,
    required this.onPressed,
    required this.title,
  });
  final double fem;
  final double ffem;
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // onPressed: (){},
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff3f51b5),
        minimumSize: Size(330 * fem, 50 * fem),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50 * fem),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16 * ffem,
            fontWeight: FontWeight.w600,
            height: 1.2175 * ffem / fem,
            color: Color(0xffffffff),
          ),
        ),
      ),
    );
  }
}

class CostumeTextField extends StatelessWidget {
  const CostumeTextField({
    required this.fem,
    required this.hintText,
    required this.prefixIcon,
    this.password = null,
    this.hide = false,
  });

  final double fem;
  final String hintText;
  final Widget prefixIcon;
  final Widget? password;
  final bool hide;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 3 * fem, 0 * fem),
      width: 330 * fem,
      height: 50 * fem,
      child: TextField(
        obscureText: hide,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(60, 204, 204, 204),
          disabledBorder: InputBorder.none,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide:
            BorderSide(color: Color.fromARGB(100, 33, 150, 243), width: 2),
          ),
          // prefixIcon:
          //     ImageIcon(AssetImage('assets/icons/email.png')),
          hintText: hintText,
          hintStyle:
          TextStyle(color: Colors.black.withAlpha(100), fontSize: 20),
          prefixIcon: prefixIcon,
          suffixIcon: password,
        ),
      ),
    );
  }
}