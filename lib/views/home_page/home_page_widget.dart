import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:habify/backend/services/backendless/backendless.dart';
import 'package:habify/entities/habit.dart';
import 'package:habify/views/add_habit/add_habit_widget.dart';
import 'package:habify/components/widgets/pinned_habit_widget_widget.dart';
import 'package:habify/flutter_flow/flutter_flow_theme.dart';
import 'package:habify/extensions/color.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<Map?>? _habits;
  bool _isLoading = true;

  Future<List<Map?>?> createHabitList() async {
    String? objectId = BackendlessService.repository.getCurrentUser()?.objectId;
    List<Map?>? habits = await BackendlessService.repository
        .queryWhere("ownerId = '$objectId'", "Habit");

    return habits;
  }

  updateHabits() async {
    _isLoading = true;
    _habits = await createHabitList();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    updateHabits();
  }

  createPinnedHabits() {
    // Customize what your widget looks like when it's loading.
    if (_isLoading == true) {
      return Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: SpinKitDoubleBounce(
            color: FlutterFlowTheme.primaryColor,
            size: 50,
          ),
        ),
      );
    }

    if (_habits!.isEmpty) {
      return Center(
        child: Text('Nothing found.'),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(_habits!.length, (index) {
        return PinnedHabitWidget(habit: Habit.fromJSON(_habits![index]!));
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Übersicht',
          style: FlutterFlowTheme.title2.override(
            fontFamily: 'Montserrat',
            color: Color(0xFFF0F0F0),
          ),
        ),
        actions: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.person,
                          color: Color(0x73000000),
                          size: 24,
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.settings,
                          color: Color(0x73000000),
                          size: 24,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 8,
        child: IconButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddHabitWidget(),
              ),
            );

            if (result == true) updateHabits();
          },
          icon: Icon(
            Icons.add,
            color: Colors.white,
            size: 28,
          ),
          iconSize: 28,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                color: FlutterFlowTheme.backgroundColor,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            createPinnedHabits(),
                            Divider(
                                height: 35,
                                thickness: 1,
                                indent: 50,
                                endIndent: 50,
                                color:
                                    FlutterFlowTheme.backgroundColor.darken(5)),
                            Expanded(
                              child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: []),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
