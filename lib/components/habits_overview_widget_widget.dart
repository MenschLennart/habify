import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../extensions/color.dart';

class HabitsOverviewWidgetWidget extends StatefulWidget {
  HabitsOverviewWidgetWidget({Key key}) : super(key: key);

  @override
  _HabitsOverviewWidgetWidgetState createState() =>
      _HabitsOverviewWidgetWidgetState();
}

class _HabitsOverviewWidgetWidgetState
    extends State<HabitsOverviewWidgetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: FlutterFlowTheme.backgroundColor.darken(7),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    'Deine Habits',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    'All deine laufenden Habits',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.primaryColor.darken(50),
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
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
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: StreamBuilder<List<HabitsRecord>>(
                    stream: queryHabitsRecord(
                      queryBuilder: (habitsRecord) => habitsRecord.where('user',
                          isEqualTo: currentUserReference),
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
                      List<HabitsRecord> columnHabitsRecordList = snapshot.data;
                      // Customize what your widget looks like with no query results.
                      if (snapshot.data.isEmpty) {
                        return Container(
                          height: 100,
                          child: Center(
                            child: Text('No results.'),
                          ),
                        );
                      }
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(columnHabitsRecordList.length,
                              (columnIndex) {
                            final columnHabitsRecord =
                                columnHabitsRecordList[columnIndex];
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(),
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          'https://picsum.photos/seed/723/600',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: ListView(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        ListTile(
                                          title: Text(
                                            columnHabitsRecord.name,
                                            style: FlutterFlowTheme.title3
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: FlutterFlowTheme
                                                  .tertiaryColor,
                                            ),
                                          ),
                                          subtitle: Text(
                                            columnHabitsRecord.description,
                                            style: FlutterFlowTheme.subtitle2
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios,
                                            color:
                                                FlutterFlowTheme.tertiaryColor,
                                            size: 20,
                                          ),
                                          tileColor: Color(0xFFF5F5F5),
                                          dense: false,
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
    );
  }
}
