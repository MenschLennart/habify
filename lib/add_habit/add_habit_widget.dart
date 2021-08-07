import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AddHabitWidget extends StatefulWidget {
  AddHabitWidget({Key key}) : super(key: key);

  @override
  _AddHabitWidgetState createState() => _AddHabitWidgetState();
}

class _AddHabitWidgetState extends State<AddHabitWidget> {
  DateTime datePicked = DateTime.now();
  TextEditingController textController3;
  String habitTypeValue;
  TextEditingController nameController;
  TextEditingController descriptionController;
  HabitsRecord addHabitResults;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController();
    nameController = TextEditingController();
    textController3 =
        TextEditingController(text: dateTimeFormat('M/d H:m', datePicked));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.primaryColor,
          automaticallyImplyLeading: true,
          title: Container(
            decoration: BoxDecoration(),
            child: Text(
              'Neue Angewohnheit',
              style: FlutterFlowTheme.title1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.tertiaryColor,
              ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 4,
        ),
        backgroundColor: FlutterFlowTheme.primaryColor,
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowDropDown(
                      options: ['Good', 'Bad'],
                      onChanged: (value) {
                        setState(() => habitTypeValue = value);
                      },
                      width: 150,
                      height: 50,
                      textStyle: FlutterFlowTheme.bodyText2.override(
                        fontFamily: 'Montserrat',
                        color: Color(0xFF9E9E9E),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 8,
                      margin: EdgeInsets.fromLTRB(15, 0, 5, 2),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 330,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0xFFE6E6E6),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: TextFormField(
                            controller: nameController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: FlutterFlowTheme.bodyText2.override(
                                fontFamily: 'Montserrat',
                                color: Color(0xFF8B97A2),
                                fontWeight: FontWeight.w500,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText2.override(
                              fontFamily: 'Montserrat',
                              color: Color(0xFF8B97A2),
                              fontWeight: FontWeight.w500,
                            ),
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Field is required';
                              }
                              if (val.length < 3) {
                                return 'Requires at least 3 characters.';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: 330,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0xFFE6E6E6),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(12, 5, 15, 5),
                          child: TextFormField(
                            controller: descriptionController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Beschreibung',
                              labelStyle: FlutterFlowTheme.bodyText2.override(
                                fontFamily: 'Montserrat',
                                color: Color(0xFF8B97A2),
                                fontWeight: FontWeight.w500,
                              ),
                              hintText: 'Gibt hier eine Beschreibung ein...',
                              hintStyle: FlutterFlowTheme.bodyText2.override(
                                fontFamily: 'Montserrat',
                                color: Color(0xFF8B97A2),
                                fontWeight: FontWeight.w500,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText2.override(
                              fontFamily: 'Montserrat',
                              color: Color(0xFF8B97A2),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.start,
                            maxLines: 4,
                            keyboardType: TextInputType.multiline,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Field is required';
                              }

                              return null;
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: IconButton(
                          onPressed: () async {
                            await DatePicker.showDatePicker(context,
                                showTitleActions: true, onConfirm: (date) {
                              setState(() => datePicked = date);
                            }, currentTime: DateTime.now());
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.solidCalendarAlt,
                            color: FlutterFlowTheme.primaryColor,
                            size: 30,
                          ),
                          iconSize: 30,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                          child: TextFormField(
                            controller: textController3,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Datum',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                              ),
                              hintText: '[Some hint text...]',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                            ),
                            keyboardType: TextInputType.datetime,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Field is required';
                              }

                              return null;
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0.95, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (!formKey.currentState.validate()) {
                        return;
                      }
                      final habitsCreateData = createHabitsRecordData(
                        name: nameController.text,
                        editedAt: getCurrentTimestamp,
                        description: descriptionController.text,
                        createdAt: getCurrentTimestamp,
                        dueDate: dateTimeFormat('MMMMEEEEd', datePicked),
                        user: currentUserReference,
                      );
                      final habitsRecordReference =
                          HabitsRecord.collection.doc();
                      await habitsRecordReference.set(habitsCreateData);
                      addHabitResults = HabitsRecord.getDocumentFromData(
                          habitsCreateData, habitsRecordReference);
                      Navigator.pop(context);

                      setState(() {});
                    },
                    text: 'Continue',
                    options: FFButtonOptions(
                      width: 140,
                      height: 60,
                      color: FlutterFlowTheme.primaryColor,
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      elevation: 2,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: 8,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
