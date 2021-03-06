import 'package:heureka/entity/appointment.dart';

import 'package:heureka/flutter_flow/flutter_flow_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:heureka/extensions/color.dart';

class AppointmentOverviewWidget extends StatefulWidget {
  final List<Appointment> appointmentList;

  AppointmentOverviewWidget({Key? key, required this.appointmentList})
      : super(key: key);

  @override
  _AppointmentOverviewWidgetState createState() =>
      _AppointmentOverviewWidgetState();
}

class _AppointmentOverviewWidgetState extends State<AppointmentOverviewWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: FlutterFlowTheme.backgroundColor.darken(7),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    'Deine Termine',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    'All deine Termine',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.primaryColor.darken(50),
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Row(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(widget.appointmentList.length,
                              (index) {
                            final appointment = widget.appointmentList[index];
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(),
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          'https://picsum.photos/seed/723/600',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: ListView(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        ListTile(
                                          title: Text(
                                            appointment.title!,
                                            style: FlutterFlowTheme.title3
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: FlutterFlowTheme
                                                  .tertiaryColor,
                                            ),
                                          ),
                                          subtitle: Text(
                                            appointment.description!,
                                            style: FlutterFlowTheme.subtitle2
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios,
                                            color:
                                                FlutterFlowTheme.tertiaryColor,
                                            size: 20,
                                          ),
                                          tileColor: Color(0xFFF5F5F5),
                                          dense: false,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            );
                          }),
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
    );
  }
}
