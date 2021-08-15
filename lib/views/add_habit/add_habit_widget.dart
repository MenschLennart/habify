import 'package:habify/components/widgets/add_habit_form_widget.dart';
import 'package:habify/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class AddHabitWidget extends StatefulWidget {
  AddHabitWidget({Key? key}) : super(key: key);

  @override
  _AddHabitWidgetState createState() => _AddHabitWidgetState();
}

class _AddHabitWidgetState extends State<AddHabitWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: Container(
          decoration: BoxDecoration(),
          child: Text(
            'Neue Angewohnheit',
            style: FlutterFlowTheme.title1.override(
              fontFamily: 'Montserrat',
              color: Color(0xE5FFFFFF),
            ),
          ),
        ),
        actions: [],
        centerTitle: true,
      ),
      body: AddHabitFormWidget(),
      backgroundColor: FlutterFlowTheme.backgroundColor,
    );
  }
}
