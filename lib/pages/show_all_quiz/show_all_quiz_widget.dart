import 'package:flutter/foundation.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/all_quiz_banner_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'show_all_quiz_model.dart';
export 'show_all_quiz_model.dart';

class ShowAllQuizWidget extends StatefulWidget {
  const ShowAllQuizWidget({Key? key}) : super(key: key);

  @override
  _ShowAllQuizWidgetState createState() => _ShowAllQuizWidgetState();
}

class _ShowAllQuizWidgetState extends State<ShowAllQuizWidget> {
  late ShowAllQuizModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowAllQuizModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF1A1A2F),
        appBar: AppBar(
          backgroundColor: Color(0x344B39EF),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.0, kIsWeb ? 30.0 : 0, 0.0, 0.0),
            child: Text(
              'All quiz',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          toolbarHeight: kIsWeb ? 70.0 : null,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'You can delete only your quiz with ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                      ),
                      Container(
                        width: 35.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF0038FF),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                        child: Icon(
                          Icons.delete_outlined,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                      Text(
                        ' sign',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                  child: StreamBuilder<List<QuizSetRecord>>(
                    stream: queryQuizSetRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        );
                      }
                      List<QuizSetRecord> listViewQuizSetRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewQuizSetRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewQuizSetRecord =
                              listViewQuizSetRecordList[listViewIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'QuizPage',
                                      queryParams: {
                                        'quizSetRer': serializeParam(
                                          listViewQuizSetRecord.reference,
                                          ParamType.DocumentReference,
                                        ),
                                        'quizDuration': serializeParam(
                                          listViewQuizSetRecord.duration,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );

                                    setState(() {
                                      FFAppState().score = 0;
                                    });
                                  },
                                  child: AllQuizBannerWidget(
                                    key: Key(
                                        'Keydpd_${listViewIndex}_of_${listViewQuizSetRecordList.length}'),
                                    title: listViewQuizSetRecord.quizName!,
                                    description:
                                        listViewQuizSetRecord.description!,
                                    totalQuestions:
                                        listViewQuizSetRecord.totalQuestions!,
                                    quizDuration: listViewQuizSetRecord
                                        .duration!
                                        .toDouble(),
                                    coverImage:
                                        listViewQuizSetRecord.coverPhoto!,
                                    quizIds: listViewQuizSetRecord.reference.id,
                                    canDelete: (listViewQuizSetRecord.userId !=
                                                    null &&
                                                listViewQuizSetRecord.userId !=
                                                    '') &&
                                            (listViewQuizSetRecord.userId ==
                                                currentUserUid)
                                        ? true
                                        : false,
                                    onDelete: () async {
                                      await listViewQuizSetRecord.reference
                                          .delete();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
