import 'package:heureka/component/widget/book_appointment_widget.dart';
import 'package:heureka/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class BookAppointmentPage extends StatefulWidget {
  BookAppointmentPage({Key? key}) : super(key: key);

  @override
  _BookAppointmentPageState createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
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
      body: BookAppointmentWidget(),
      backgroundColor: FlutterFlowTheme.backgroundColor,
    );
  }
}
