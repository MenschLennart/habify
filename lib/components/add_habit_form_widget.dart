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

class AddHabitFormWidget extends StatefulWidget {
  AddHabitFormWidget({Key key}) : super(key: key);

  @override
  _AddHabitFormWidgetState createState() => _AddHabitFormWidgetState();
}

class _AddHabitFormWidgetState extends State<AddHabitFormWidget> {
  DateTime datePicked = DateTime.now();
  String habitTypeValue;
  TextEditingController nameController;
  TextEditingController descriptionController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.secondaryColor,
                      FlutterFlowTheme.primaryColor
                    ],
                    stops: [0, 0.7],
                    begin: Alignment(0, -1),
                    end: Alignment(0, 1),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 2,
                              child: FlutterFlowDropDown(
                                initialOption: 'Good',
                                options: ['Good', 'Bad'],
                                onChanged: (value) {
                                  setState(() => habitTypeValue = value);
                                },
                                width: 150,
                                height: 50,
                                textStyle: FlutterFlowTheme.bodyText2.override(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFFEFEFEF),
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                                fillColor: Color(0x26FFFFFF),
                                elevation: 2,
                                borderColor: Color(0x59FFFFFF),
                                borderWidth: 0,
                                borderRadius: 8,
                                margin: EdgeInsets.fromLTRB(15, 0, 5, 2),
                                hidesUnderline: true,
                              ),
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
                                  color: Color(0x26FFFFFF),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Color(0x59FFFFFF),
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                  child: TextFormField(
                                    controller: nameController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Name',
                                      labelStyle:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFFEFEFEF),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
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
                                      color: Color(0xFFEFEFEF),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
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
                                  color: Color(0x26FFFFFF),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Color(0x59FFFFFF),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(12, 5, 15, 5),
                                  child: TextFormField(
                                    controller: descriptionController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Beschreibung',
                                      labelStyle:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFFEFEFEF),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      hintText:
                                          'Gibt hier eine Beschreibung ein...',
                                      hintStyle:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFFEFEFEF),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
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
                                      color: Color(0xFFEFEFEF),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
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
                            color: Color(0x26FFFFFF),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0x59FFFFFF),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                                child: IconButton(
                                  onPressed: () async {
                                    await DatePicker.showDatePicker(context,
                                        showTitleActions: true,
                                        onConfirm: (date) {
                                      setState(() => datePicked = date);
                                    }, currentTime: DateTime.now());
                                  },
                                  icon: FaIcon(
                                    FontAwesomeIcons.solidCalendarAlt,
                                    color: Color(0xFFEFEFEF),
                                    size: 30,
                                  ),
                                  iconSize: 30,
                                ),
                              ),
                              Text(
                                dateTimeFormat('MMMMEEEEd', datePicked),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Manrope',
                                  color: FlutterFlowTheme.tertiaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Align(
                            alignment: Alignment(0.95, 0),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                text: 'Cancel',
                                options: FFButtonOptions(
                                  width: 140,
                                  height: 60,
                                  color: Color(0x26FFFFFF),
                                  textStyle:
                                      FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFFEFEFEF),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  elevation: 2,
                                  borderSide: BorderSide(
                                    color: Color(0x59FFFFFF),
                                    width: 1,
                                  ),
                                  borderRadius: 8,
                                ),
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
                                  final habitsCreateData =
                                      createHabitsRecordData(
                                    name: nameController.text,
                                    editedAt: getCurrentTimestamp,
                                    description: descriptionController.text,
                                    createdAt: getCurrentTimestamp,
                                    dueDate:
                                        dateTimeFormat('MMMMEEEEd', datePicked),
                                    user: currentUserReference,
                                    type: habitTypeValue,
                                  );
                                  await HabitsRecord.collection
                                      .doc()
                                      .set(habitsCreateData);
                                  Navigator.pop(context);
                                },
                                text: 'Erstellen',
                                icon: Icon(
                                  Icons.add_circle_sharp,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 140,
                                  height: 60,
                                  color: Color(0xFFEFEFEF),
                                  textStyle:
                                      FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.secondaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  elevation: 2,
                                  borderSide: BorderSide(
                                    color: Color(0x59FFFFFF),
                                    width: 1,
                                  ),
                                  borderRadius: 8,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
