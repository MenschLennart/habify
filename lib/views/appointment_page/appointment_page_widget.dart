import 'package:flutter/material.dart';
import 'package:heureka/entity/appointment.dart';
import 'package:heureka/flutter_flow/flutter_flow_theme.dart';
import 'package:heureka/extensions/color.dart';

class AppointmentPageWidget extends StatefulWidget {
  const AppointmentPageWidget({Key? key, required this.appointment})
      : super(key: key);
  final Appointment appointment;

  @override
  _AppointmentPageWidgetState createState() => _AppointmentPageWidgetState();
}

class _AppointmentPageWidgetState extends State<AppointmentPageWidget> {
  Color _backgroundColor = FlutterFlowTheme.primaryColor.lighten(95);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        title: Text(widget.appointment.title!),
        automaticallyImplyLeading: true,
        centerTitle: true,
      ),
      backgroundColor: FlutterFlowTheme.backgroundColor,
      body: SafeArea(
        child: Container(
          color: _backgroundColor,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Text(widget.appointment.description!),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Type: '),
                      Text('Not yet implemented'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
