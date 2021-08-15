import 'package:flutter/material.dart';
import 'package:habify/entities/habit.dart';
import 'package:habify/flutter_flow/flutter_flow_theme.dart';
import 'package:habify/extensions/color.dart';

class HabitPageWidget extends StatefulWidget {
  const HabitPageWidget({Key? key, required this.habit}) : super(key: key);
  final Habit habit;

  @override
  _HabitPageWidgetState createState() => _HabitPageWidgetState();
}

class _HabitPageWidgetState extends State<HabitPageWidget> {
  Color _backgroundColor = FlutterFlowTheme.primaryColor.lighten(95);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        title: Text(widget.habit.title!),
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
                  child: Text(widget.habit.description!),
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
