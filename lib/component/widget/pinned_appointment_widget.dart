import 'dart:async';
import 'dart:ui';

import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:heureka/entity/appointment.dart';
import 'package:intl/intl.dart';
import 'package:heureka/extensions/color.dart';
import 'package:heureka/flutter_flow/flutter_flow_theme.dart';

class PinnedAppointmentWidget extends StatefulWidget {
  final Appointment appointment;

  PinnedAppointmentWidget({
    Key? key,
    required this.appointment,
  }) : super(key: key);

  @override
  _PinnedAppointmentWidgetState createState() =>
      _PinnedAppointmentWidgetState();
}

class _PinnedAppointmentWidgetState extends State<PinnedAppointmentWidget> {
  Timer? _timer;
  String? _appointmentTimeDuration;
  DateTime? _appointmentDateTime;
  Icon? _icon;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _appointmentDateTime = widget.appointment.createdAt;
    _updateAppointmentDuration();
    _timer = new Timer.periodic(
        Duration(minutes: 1), (Timer timer) => _updateAppointmentDuration());
  }

  String _appointmentTimeToDuration(
      DateTime appointmentDateTime, DurationTersity tersity) {
    Duration difference = DateTime.now().difference(appointmentDateTime);
    return printDuration(aMinute * difference.inMinutes, tersity: tersity);
  }

  void _updateAppointmentDuration() {
    setState(() {
      _appointmentTimeDuration = _appointmentTimeToDuration(
          _appointmentDateTime!, DurationTersity.hour);
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
                              widget.appointment.title!,
                              style: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              _appointmentTimeDuration!,
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Manrope',
                                color: FlutterFlowTheme.primaryColor.darken(5),
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              DateFormat.yMMMMd()
                                  .format(widget.appointment.createdAt!),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Manrope',
                              ),
                            ),
                            Text(
                              widget.appointment.createdAt!
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
