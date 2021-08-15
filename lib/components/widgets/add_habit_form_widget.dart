import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:habify/backend/services/backendless/backendless.dart';
import 'package:habify/entities/habit.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

import 'package:habify/flutter_flow/flutter_flow_drop_down_template.dart';
import 'package:habify/flutter_flow/flutter_flow_theme.dart';
import 'package:habify/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habify/extensions/color.dart';

class AddHabitFormWidget extends StatefulWidget {
  AddHabitFormWidget({Key? key}) : super(key: key);
  @override
  _AddHabitFormWidgetState createState() => _AddHabitFormWidgetState();
}

class _AddHabitFormWidgetState extends State<AddHabitFormWidget> {
  DateTime datePicked = DateTime.now();
  Icon? _selectedIcon;
  String? habitTypeValue;
  TextEditingController? nameController = TextEditingController();
  TextEditingController? descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Map? _icon;

  Color _inputFieldColor = FlutterFlowTheme.primaryColor.lighten(95);
  Color _inputFieldBorderColor = FlutterFlowTheme.primaryColor.lighten(90);
  Color _inputFieldTextColor = FlutterFlowTheme.inputTextColor;

  _pickIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(context,
        iconPackMode: IconPack.fontAwesomeIcons,
        iconColor: FlutterFlowTheme.primaryColor,
        title: Text('Icon auswählen...'),
        searchHintText: 'Suchen...',
        noResultsText: 'Leider nichts gefunden...',
        closeChild: Icon(
          FaIcon(FontAwesomeIcons.timesCircle).icon,
          color: FlutterFlowTheme.primaryColor,
        ));
    setState(() {
      _selectedIcon = Icon(icon);
      _icon = {
        "codePoint": _selectedIcon?.icon!.codePoint,
        "fontFamily": _selectedIcon?.icon!.fontFamily,
        "fontPackage": _selectedIcon?.icon!.fontPackage,
      };
    });
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('de_DE', null);
    _selectedIcon = Icon(
        FaIcon(FontAwesomeIcons.accusoft, color: FlutterFlowTheme.primaryColor)
            .icon);
    _icon = {
      "codePoint": _selectedIcon?.icon!.codePoint,
      "fontFamily": _selectedIcon?.icon!.fontFamily,
      "fontPackage": _selectedIcon?.icon!.fontPackage,
    };
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
                color: FlutterFlowTheme.backgroundColor,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 10, 0),
                                          decoration: BoxDecoration(),
                                          child: FlutterFlowDropDown(
                                            initialOption: 'Good',
                                            options: ['Good', 'Bad'],
                                            onChanged: (value) {
                                              setState(
                                                  () => habitTypeValue = value);
                                            },
                                            width: 150,
                                            height: 50,
                                            textStyle: FlutterFlowTheme
                                                .bodyText2
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: _inputFieldTextColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            fillColor: _inputFieldColor,
                                            elevation: 2,
                                            borderColor: _inputFieldBorderColor,
                                            borderWidth: 0,
                                            borderRadius: 8,
                                            margin: EdgeInsets.fromLTRB(
                                                15, 0, 5, 2),
                                            hidesUnderline: true,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 100,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: _inputFieldColor,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: _inputFieldBorderColor,
                                              width: 1,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              AnimatedSwitcher(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                child: IconButton(
                                                  onPressed: () async =>
                                                      await _pickIcon(),
                                                  icon: _selectedIcon!,
                                                  iconSize: 32,
                                                  color: FlutterFlowTheme
                                                      .primaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
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
                                  color: _inputFieldColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: _inputFieldBorderColor,
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
                                        color: _inputFieldTextColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: _inputFieldBorderColor,
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: _inputFieldBorderColor,
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
                                      color: _inputFieldTextColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    inputFormatters: [
                                      new LengthLimitingTextInputFormatter(21)
                                    ],
                                    validator: (val) {
                                      if (val!.isEmpty) {
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
                                  color: _inputFieldColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: _inputFieldBorderColor,
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
                                        color: _inputFieldTextColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      hintText:
                                          'Gibt hier eine Beschreibung ein...',
                                      hintStyle:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Montserrat',
                                        color: _inputFieldTextColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: _inputFieldTextColor,
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
                                      color: _inputFieldTextColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    textAlign: TextAlign.start,
                                    inputFormatters: [
                                      new LengthLimitingTextInputFormatter(150)
                                    ],
                                    maxLines: 4,
                                    keyboardType: TextInputType.multiline,
                                    validator: (val) {
                                      if (val!.isEmpty) {
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
                            color: _inputFieldColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: _inputFieldBorderColor,
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
                                    color: FlutterFlowTheme.primaryColor,
                                    size: 32,
                                  ),
                                  iconSize: 32,
                                ),
                              ),
                              Text(
                                DateFormat.yMMMMd('de_DE').format(datePicked),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Manrope',
                                  color: _inputFieldTextColor,
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
                                  Navigator.pop(context, false);
                                },
                                text: 'Cancel',
                                options: FFButtonOptions(
                                  width: 140,
                                  height: 60,
                                  color: _inputFieldColor,
                                  textStyle:
                                      FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: _inputFieldTextColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  elevation: 2,
                                  borderSide: BorderSide(
                                    color: _inputFieldBorderColor,
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
                                  if (!formKey.currentState!.validate()) {
                                    return;
                                  }

                                  _icon = {
                                    "codePoint": _selectedIcon?.icon?.codePoint,
                                    "fontFamily":
                                        _selectedIcon?.icon?.fontFamily,
                                    "fontPackage":
                                        _selectedIcon?.icon?.fontPackage,
                                  };

                                  Habit createdHabit = Habit();
                                  createdHabit
                                    ..description = descriptionController?.text
                                    ..icon = _icon
                                    ..pinned = false
                                    ..title = nameController?.text;
                                  BackendlessService.repository
                                      .insert(createdHabit.toMap(), "Habit");
                                  Navigator.pop(context, true);
                                },
                                text: 'Erstellen',
                                icon: Icon(
                                  Icons.add_circle_sharp,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 140,
                                  height: 60,
                                  color: FlutterFlowTheme.primaryColor,
                                  textStyle:
                                      FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: _inputFieldTextColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  elevation: 2,
                                  borderSide: BorderSide(
                                    color: _inputFieldBorderColor,
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
