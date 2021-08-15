import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:habify/entities/secret.dart';
import 'package:habify/backend/services/backendless/backendless.dart';
import 'package:habify/views/home_page/home_page_widget.dart';
import 'package:habify/views/login_register/login_register_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'package:habify/views/profile_page/profile_page_widget.dart';

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

  static const String SERVER_URL = "https://eu-api.backendless.com";
  static const String APPLICATION_ID = "DC3BB34C-C5BF-3900-FFD2-B1AE7EACDA00";
  static const String ANDROID_API_KEY = "B81495FA-49EB-4BE5-A1E2-8E2D53290E7B";
  static const String IOS_API_KEY = "AE4A0D94-F471-42F0-B6D1-1F8D2FE38ABF";

  @override
  void initState() {
    super.initState();

    BackendSecret secret = BackendSecret()
      ..applicationId = APPLICATION_ID
      ..androidAppSecret = ANDROID_API_KEY
      ..iosAppSecret = IOS_API_KEY
      ..customUrl = SERVER_URL;

    BackendlessService.initialize(backendSecret: secret);
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
      title: 'Habify',
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
