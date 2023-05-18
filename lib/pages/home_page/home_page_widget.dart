import 'package:flutter/foundation.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/quiz_sets_copy_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(0.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'floatingActionButtonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 900.ms,
          duration: 1200.ms,
          begin: 0.0,
          end: 2.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed('CreateQuizSet');
          },
          backgroundColor: Color(0xFF0038FF),
          elevation: 1.0,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 24.0,
          ),
        ).animateOnPageLoad(
            animationsMap['floatingActionButtonOnPageLoadAnimation']!),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.0, kIsWeb ? 30.0 : 0, 0.0, 0.0),
            child: Text(
              'Quiz Feed',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
            ),
          ),
          actions: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('LogOut');
                    },
                    child: Container(
                      width: 40.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0x1AFFFFFF),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 6.0),
                        child: Image.asset(
                          'assets/images/user-avatar.png',
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
          centerTitle: true,
          toolbarHeight: kIsWeb ? 70.0 : null,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'My quizes',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('ShowAllQuiz');
                            },
                            child: Text(
                              'Show all',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right_sharp,
                            color: Colors.white,
                            size: 12.0,
                          ),
                        ],
                      ),
                    ],
                  ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: StreamBuilder<List<QuizSetRecord>>(
                    stream: queryQuizSetRecord(
                      queryBuilder: (quizSetRecord) => quizSetRecord
                          .where('user_id', isEqualTo: currentUserUid),
                    ),
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
                          return Padding(
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
                              child: QuizSetsCopyWidget(
                                key: Key(
                                    'Keyh1j_${listViewIndex}_of_${listViewQuizSetRecordList.length}'),
                                title: listViewQuizSetRecord.quizName!,
                                description: listViewQuizSetRecord.description!,
                                totalQuestions:
                                    listViewQuizSetRecord.totalQuestions!,
                                quizDuration:
                                    listViewQuizSetRecord.duration!.toDouble(),
                                coverImage: listViewQuizSetRecord.coverPhoto!,
                              ),
                            ),
                          );
                        },
                      ).animateOnPageLoad(
                          animationsMap['listViewOnPageLoadAnimation']!);
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
