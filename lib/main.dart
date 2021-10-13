import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:heureka/backend/services/parse/secret.dart';
import 'package:heureka/backend/services/parse/parse.dart';
import 'package:heureka/views/home_page/home_page_widget.dart';
import 'package:heureka/views/login_register/login_register_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'package:heureka/views/profile_page/profile_page_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  BackendlessUser? currentUser;
  bool isLoggedIn = false;

  static const String SERVER_URL = "https://parseapi.back4app.com";
  static const String APPLICATION_ID =
      "uMvFO6ra6JRIY5GykntBMfY2YhwDS59Ygo1KZo4w";
  static const String CLIENT_KEY = "rwaJvYaxJl6y0rrcFD82dHPfTa9JPbQTHGHfh3Vy";

  @override
  void initState() {
    super.initState();

    ParseSecret secret = ParseSecret()
      ..applicationId = APPLICATION_ID
      ..customUrl = SERVER_URL
      ..keyClientKey = CLIENT_KEY;

    ParseService.initialize(backendSecret: secret);
    Backendless.userService.getCurrentUser().then((value) {
      if (value != null) {
        isLoggedIn = true;
        currentUser = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HEUREKA',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: isLoggedIn == true ? NavBarPage() : LoginRegisterWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  final String? initialPage;

  NavBarPage({Key? key, this.initialPage}) : super(key: key);

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'HomePage';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomePage': HomePageWidget(),
      'ProfilePage': ProfilePageWidget(),
    };
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              color: FlutterFlowTheme.tertiaryColor,
              size: 32,
            ),
            activeIcon: Icon(
              Icons.home_rounded,
              color: Color(0x73000000),
              size: 32,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: FlutterFlowTheme.tertiaryColor,
              size: 32,
            ),
            activeIcon: Icon(
              Icons.person,
              color: Color(0x73000000),
              size: 32,
            ),
            label: 'Profile',
          )
        ],
        backgroundColor: FlutterFlowTheme.primaryColor,
        currentIndex: tabs.keys.toList().indexOf(_currentPage),
        selectedItemColor: FlutterFlowTheme.primaryColor,
        unselectedItemColor: FlutterFlowTheme.secondaryColor,
        onTap: (i) => setState(() {
          _currentPage = tabs.keys.toList()[i];
        }),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
