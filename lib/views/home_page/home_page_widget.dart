import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:heureka/component/widget/book_appointment_widget.dart';
import 'package:heureka/entity/appointment.dart';
import 'package:heureka/model/home_model.dart';
import 'package:heureka/component/widget/pinned_appointment_widget.dart';
import 'package:heureka/flutter_flow/flutter_flow_theme.dart';
import 'package:heureka/extensions/color.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final homePageModel = HomeModel();

  List<Appointment?> _appointments = <Appointment>[];
  bool _isLoading = true;

  fetchAppointments() async {
    _isLoading = true;
    _appointments.addAll(await homePageModel.fetchAppointments());
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAppointments();
  }

  createPinnedAppointments() {
    // Customize what your widget looks like when it's loading.
    if (_isLoading == true) {
      return Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: SpinKitDoubleBounce(
            color: FlutterFlowTheme.primaryColor,
            size: 50,
          ),
        ),
      );
    }

    if (_appointments.isEmpty) {
      return Center(
        child: Text('Nothing found.'),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(_appointments.length, (index) {
        return PinnedAppointmentWidget(
            appointment: _appointments[index] as Appointment);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Übersicht',
          style: FlutterFlowTheme.title2.override(
            fontFamily: 'Montserrat',
            color: Color(0xFFF0F0F0),
          ),
        ),
        actions: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.person,
                          color: Color(0x73000000),
                          size: 24,
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.settings,
                          color: Color(0x73000000),
                          size: 24,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 8,
        child: IconButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookAppointmentWidget(),
              ),
            );

            if (result == true) fetchAppointments();
          },
          icon: Icon(
            Icons.add,
            color: Colors.white,
            size: 28,
          ),
          iconSize: 28,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                color: FlutterFlowTheme.backgroundColor,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            createPinnedAppointments(),
                            Divider(
                                height: 35,
                                thickness: 1,
                                indent: 50,
                                endIndent: 50,
                                color:
                                    FlutterFlowTheme.backgroundColor.darken(5)),
                            Expanded(
                              child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: []),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
