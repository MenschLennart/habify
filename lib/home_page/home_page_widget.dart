import '../add_habit/add_habit_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/habits_overview_widget_widget.dart';
import '../components/pinned_habit_widget_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../extensions/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddHabitWidget(),
              ),
            );
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
                            StreamBuilder<List<HabitsRecord>>(
                              stream: queryHabitsRecord(
                                queryBuilder: (habitsRecord) => habitsRecord
                                    .where('user',
                                        isEqualTo: currentUserReference)
                                    .where('pinned', isEqualTo: true),
                                limit: 4,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
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
                                List<HabitsRecord> rowHabitsRecordList =
                                    snapshot.data;
                                // Customize what your widget looks like with no query results.
                                if (snapshot.data.isEmpty) {
                                  return Container(
                                    height: 100,
                                    child: Center(
                                      child: Text('No results.'),
                                    ),
                                  );
                                }
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(
                                      rowHabitsRecordList.length, (rowIndex) {
                                    final rowHabitsRecord =
                                        rowHabitsRecordList[rowIndex];
                                    return PinnedHabitWidgetWidget(
                                      habitRecord: rowHabitsRecord,
                                    );
                                  }),
                                );
                              },
                            ),
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
                                children: [
                                  Expanded(
                                    child: HabitsOverviewWidgetWidget(),
                                  )
                                ],
                              ),
                            )
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
