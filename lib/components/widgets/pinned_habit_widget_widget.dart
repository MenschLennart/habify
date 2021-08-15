import 'dart:async';
import 'dart:ui';

import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:habify/entities/habit.dart';
import 'package:intl/intl.dart';

import 'package:habify/extensions/color.dart';
import 'package:habify/flutter_flow/flutter_flow_theme.dart';

class PinnedHabitWidget extends StatefulWidget {
  final Habit habit;

  PinnedHabitWidget({
    Key? key,
    required this.habit,
  }) : super(key: key);

  @override
  _PinnedHabitWidgetState createState() => _PinnedHabitWidgetState();
}

class _PinnedHabitWidgetState extends State<PinnedHabitWidget> {
  Timer? _timer;
  String? _habitTimeDuration;
  DateTime? _habitDateTime;
  Map? _iconData;
  Icon? _icon;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _habitDateTime = widget.habit.created;
    _iconData = widget.habit.icon;
    _updateHabitDuration();
    _timer = new Timer.periodic(
        Duration(minutes: 1), (Timer timer) => _updateHabitDuration());
    widget.habit.icon == null
        ? _icon = Icon(Icons.ac_unit)
        : _icon = Icon(IconData(_iconData?["codePoint"],
            fontFamily: _iconData?["fontFamily"],
            fontPackage: _iconData?["fontPackage"]));
  }

  String _habitTimeToDuration(DateTime habitDateTime, DurationTersity tersity) {
    Duration difference = DateTime.now().difference(habitDateTime);
    return printDuration(aMinute * difference.inMinutes, tersity: tersity);
  }

  void _updateHabitDuration() {
    setState(() {
      _habitTimeDuration =
          _habitTimeToDuration(_habitDateTime!, DurationTersity.hour);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.backgroundColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: FlutterFlowTheme.backgroundColor.darken(5),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(_icon?.icon,
                                color: FlutterFlowTheme.primaryColor),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.habit.title!,
                              style: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              _habitTimeDuration!,
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Manrope',
                                color: FlutterFlowTheme.primaryColor.darken(5),
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              DateFormat.yMMMMd().format(widget.habit.created!),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Manrope',
                              ),
                            ),
                            Text(
                              widget.habit.created!
                                  .difference(DateTime.now())
                                  .inMinutes
                                  .toString(),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Manrope',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}