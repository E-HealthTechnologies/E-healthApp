import 'dart:developer';

import 'package:e_health/Presentation/Home/Drawer%20Page/drawerPage.dart';
import 'package:e_health/Presentation/Home/Patient/DashBoard/bloc/pat_dash_board_bloc.dart';
import 'package:e_health/Presentation/Home/Patient/DashBoard/patient_dashboard_screen.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/patient_measuring_screen.dart';
import 'package:e_health/Presentation/Home/Patient/Screens/patient_history_screen.dart';
import 'package:e_health/Presentation/Home/Patient/bloc/patient_home_bloc.dart';
import 'package:e_health/Presentation/Widgets/handshake_diag/handshake_diag_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';

class PatHomeScreen extends StatefulWidget {
  // PatHomeScreen({required this.uid});
  // final String uid;
  PatHomeScreen();

  @override
  State<PatHomeScreen> createState() => _PatHomeScreenState();
}

class _PatHomeScreenState extends State<PatHomeScreen> {
  final User? user = FirebaseAuth.instance.currentUser;
  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('users');

  late PatHomeBloc _patHomeBloc;
  late PatDashBoardBloc _patDashBoardBloc;

  final _pageController = PageController();
  late List<Widget> _pages;

  List<TabItem> items = [
    TabItem(
      icon: Icons.home_outlined,
      title: 'Home',
    ),
    TabItem(
      icon: Icons.favorite_border,
      title: 'Measure',
    ),
    TabItem(
      icon: Icons.history,
      title: 'History',
    ),
  ];

  void initState() {
    super.initState();
    log(user!.uid);
    _patHomeBloc = PatHomeBloc();
    _patDashBoardBloc = PatDashBoardBloc();

    _pages = [
      PatDashScreen(),
      PatMeasuringScreen(),
      PatHistoryScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double counter = 0;

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _patHomeBloc),
        BlocProvider.value(value: _patDashBoardBloc),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<PatHomeBloc, PatHomeState>(
            listener: (context, state) async {
              if (state.page != -1) {
                _pageController.animateToPage(state.page,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              }
            },
          ),
          BlocListener<PatDashBoardBloc, PatDashBoardState>(
            listener: (context, state) async {},
          ),
        ],
        child: BlocBuilder<PatHomeBloc, PatHomeState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Color(0xfff5f5f5),
                iconTheme: IconThemeData(color: Colors.black),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.notifications,
                    ),
                    onPressed: () async {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.sensors,
                    ),
                    onPressed: () {
                      HandshakeDiag.showDiag(context);
                    },
                  ),
                ],
              ),
              body: PageView(
                controller: _pageController,
                children: _pages,
                physics: NeverScrollableScrollPhysics(),
              ),
              bottomNavigationBar: Container(
                child: BottomBarSalomon(
                  items: items,
                  color: Colors.blue,
                  // backgroundColor: Colors.white,
                  backgroundColor: Color(0xfff5f5f5),
                  colorSelected: Colors.white,
                  backgroundSelected: Colors.blue,
                  borderRadius: BorderRadius.circular(0),
                  indexSelected: state.page,
                  onTap: (index) =>
                      _patHomeBloc.add(PatCreateEvent(page: index)),
                ),
              ),
              drawer: DrawerPage(),
            );
          },
        ),
      ),
    );
  }
}
