import 'dart:async';
import 'package:duration/duration.dart';

import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class PinnedHabitWidgetWidget extends StatefulWidget {
  PinnedHabitWidgetWidget({
    Key key,
    this.habitRecord,
  }) : super(key: key);

  final HabitsRecord habitRecord;

  @override
  _PinnedHabitWidgetWidgetState createState() =>
      _PinnedHabitWidgetWidgetState();
}

class _PinnedHabitWidgetWidgetState extends State<PinnedHabitWidgetWidget> {
  Timer _timer;
  String _habitTimeDuration;
  DateTime _habitDateTime;

  String _habitTimeToDuration(DateTime habitDateTime, DurationTersity tersity) {
    Duration difference = DateTime.now().difference(habitDateTime);
    return printDuration(aMinute * difference.inMinutes, tersity: tersity);
  }

  @override
  void initState() {
    _habitDateTime = widget.habitRecord.createdAt;
    _updateHabitDuration();
    _timer = new Timer.periodic(
        Duration(minutes: 1), (Timer timer) => _updateHabitDuration());
    super.initState();
  }

  void _updateHabitDuration() {
    setState(() {
      _habitTimeDuration =
          _habitTimeToDuration(_habitDateTime, DurationTersity.hour);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: AutoSizeText(
                      widget.habitRecord.name,
                      style: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    _habitTimeDuration,
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Manrope',
                    ),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    widget.habitRecord.createdAt.toString(),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Manrope',
                    ),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    widget.habitRecord.createdAt
                        .difference(DateTime.now())
                        .inMinutes
                        .toString(),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Manrope',
                    ),
                  )
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.transparent, Color(0x32000000)],
                            stops: [0.65, 0.65],
                            begin: Alignment(1, 0),
                            end: Alignment(-1, 0),
                          ),
                          borderRadius: BorderRadius.circular(2),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Color(0x73000000),
                            width: 1,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
