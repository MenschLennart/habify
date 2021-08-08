import '../add_habit/add_habit_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

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
        backgroundColor: FlutterFlowTheme.secondaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Dashboard',
          style: FlutterFlowTheme.title2.override(
            fontFamily: 'Poppins',
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
      backgroundColor: FlutterFlowTheme.secondaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: Color(0x7EEE60C8),
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
            color: FlutterFlowTheme.tertiaryColor,
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
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.primaryColor,
                      FlutterFlowTheme.secondaryColor
                    ],
                    stops: [0, 1],
                    begin: Alignment(0, 1),
                    end: Alignment(0, -1),
                  ),
                ),
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
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    child: Container(
                                      width: 200,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: Color(0x27000000),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Color(0x32000000),
                                        ),
                                      ),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        child:
                                            StreamBuilder<List<HabitsRecord>>(
                                          stream: queryHabitsRecord(
                                            queryBuilder: (habitsRecord) =>
                                                habitsRecord
                                                    .where(
                                                        'user',
                                                        isEqualTo:
                                                            currentUserReference)
                                                    .orderBy('created_at',
                                                        descending: true),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child: SpinKitDoubleBounce(
                                                    color: FlutterFlowTheme
                                                        .primaryColor,
                                                    size: 50,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<HabitsRecord>
                                                columnHabitsRecordList =
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
                                            final columnHabitsRecord =
                                                columnHabitsRecordList.first;
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      columnHabitsRecord.name,
                                                      style: FlutterFlowTheme
                                                          .subtitle2
                                                          .override(
                                                        fontFamily: 'Poppins',
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    child: Container(
                                      width: 200,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: Color(0x27000000),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Color(0x32000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Divider(
                              height: 35,
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                              color: Color(0xFFAC2C8A),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0x27000000),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Color(0x32000000),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 10, 10, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Deine Habits',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme
                                                        .title3
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      color: FlutterFlowTheme
                                                          .tertiaryColor,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 10, 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'All deine laufenden Habits',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme
                                                        .subtitle2
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0x51000000),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 10, 10, 10),
                                                  child: StreamBuilder<
                                                      List<HabitsRecord>>(
                                                    stream: queryHabitsRecord(
                                                      queryBuilder: (habitsRecord) =>
                                                          habitsRecord.where(
                                                              'user',
                                                              isEqualTo:
                                                                  currentUserReference),
                                                      limit: 4,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50,
                                                            height: 50,
                                                            child:
                                                                SpinKitDoubleBounce(
                                                              color: FlutterFlowTheme
                                                                  .primaryColor,
                                                              size: 50,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<HabitsRecord>
                                                          columnHabitsRecordList =
                                                          snapshot.data;
                                                      // Customize what your widget looks like with no query results.
                                                      if (snapshot
                                                          .data.isEmpty) {
                                                        return Container(
                                                          height: 100,
                                                          child: Center(
                                                            child: Text(
                                                                'No results.'),
                                                          ),
                                                        );
                                                      }
                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              columnHabitsRecordList
                                                                  .length,
                                                              (columnIndex) {
                                                            final columnHabitsRecord =
                                                                columnHabitsRecordList[
                                                                    columnIndex];
                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  width: 50,
                                                                  height: 50,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Container(
                                                                    width: 120,
                                                                    height: 120,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      imageUrl:
                                                                          'https://picsum.photos/seed/723/600',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 3,
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        ListView(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      children: [
                                                                        ListTile(
                                                                          title:
                                                                              Text(
                                                                            columnHabitsRecord.name,
                                                                            style:
                                                                                FlutterFlowTheme.title3.override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.tertiaryColor,
                                                                            ),
                                                                          ),
                                                                          subtitle:
                                                                              Text(
                                                                            columnHabitsRecord.description,
                                                                            style:
                                                                                FlutterFlowTheme.subtitle2.override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFFD9D9D9),
                                                                            ),
                                                                          ),
                                                                          trailing:
                                                                              Icon(
                                                                            Icons.arrow_forward_ios,
                                                                            color:
                                                                                FlutterFlowTheme.tertiaryColor,
                                                                            size:
                                                                                20,
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              false,
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            );
                                                          }),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
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
