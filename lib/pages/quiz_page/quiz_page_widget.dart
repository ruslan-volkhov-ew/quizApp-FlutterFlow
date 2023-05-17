import '/backend/backend.dart';
import '/components/quiz_option_widget.dart';
import '/components/transparent_loader_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'quiz_page_model.dart';
export 'quiz_page_model.dart';

class QuizPageWidget extends StatefulWidget {
  const QuizPageWidget({
    Key? key,
    required this.quizSetRer,
    required this.quizDuration,
  }) : super(key: key);

  final DocumentReference? quizSetRer;
  final int? quizDuration;

  @override
  _QuizPageWidgetState createState() => _QuizPageWidgetState();
}

class _QuizPageWidgetState extends State<QuizPageWidget> {
  late QuizPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  int get pageViewCurrentIndex => _model.pageViewController != null &&
          _model.pageViewController!.hasClients &&
          _model.pageViewController!.page != null
      ? _model.pageViewController!.page!.round()
      : 0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          _model.timerController.onExecute.add(StopWatchExecute.start);
        },
        startImmediately: true,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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

    return FutureBuilder<int>(
      future: queryQuizRecordCount(
        queryBuilder: (quizRecord) =>
            quizRecord.where('quiz_set', isEqualTo: widget.quizSetRer),
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
        int quizPageCount = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFF1A1A2F),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Q',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: valueOrDefault<String>(
                                (_model.pageNavigate + 1).toString(),
                                '0',
                              ),
                              style: TextStyle(),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 36.0,
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                                borderRadius: BorderRadius.circular(24.0),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 0.0, 0.0, 0.0),
                                      child: FlutterFlowTimer(
                                        initialTime:
                                            widget.quizDuration! * 1000 * 60,
                                        getDisplayTime: (value) =>
                                            StopWatchTimer.getDisplayTime(
                                          value,
                                          hours: false,
                                          milliSecond: false,
                                        ),
                                        timer: _model.timerController,
                                        updateStateInterval:
                                            Duration(milliseconds: 1000),
                                        onChanged:
                                            (value, displayTime, shouldUpdate) {
                                          _model.timerMilliseconds = value;
                                          _model.timerValue = displayTime;
                                          if (shouldUpdate) setState(() {});
                                        },
                                        onEnded: () async {
                                          context.goNamed(
                                            'ScorePage',
                                            queryParams: {
                                              'scoreAchieved': serializeParam(
                                                FFAppState().score,
                                                ParamType.int,
                                              ),
                                              'totalQuestions': serializeParam(
                                                quizPageCount,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );

                                          FFAppState().update(() {
                                            FFAppState().completedQuestions = 0;
                                          });
                                        },
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 96.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0x1AFFFFFF),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          LinearPercentIndicator(
                            percent: valueOrDefault<double>(
                              FFAppState().completedQuestions / quizPageCount,
                              0.0,
                            ),
                            lineHeight: 9.0,
                            animation: true,
                            progressColor: FlutterFlowTheme.of(context).primary,
                            backgroundColor: Color(0x33FDF7F7),
                            barRadius: Radius.circular(0.0),
                            padding: EdgeInsets.zero,
                          ),
                          Expanded(
                            child: StreamBuilder<List<QuizRecord>>(
                              stream: queryQuizRecord(
                                queryBuilder: (quizRecord) => quizRecord.where(
                                    'quiz_set',
                                    isEqualTo: widget.quizSetRer),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                  );
                                }
                                List<QuizRecord> pageViewQuizRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  height: 500.0,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 50.0),
                                    child: PageView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      controller: _model.pageViewController ??=
                                          PageController(
                                              initialPage: min(
                                                  0,
                                                  pageViewQuizRecordList
                                                          .length -
                                                      1)),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: pageViewQuizRecordList.length,
                                      itemBuilder: (context, pageViewIndex) {
                                        final pageViewQuizRecord =
                                            pageViewQuizRecordList[
                                                pageViewIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 24.0, 20.0, 0.0),
                                              child: Text(
                                                pageViewQuizRecord.question!,
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 24.0, 20.0, 0.0),
                                              child: ListView(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 12.0),
                                                    child: StreamBuilder<
                                                        List<QuestionARecord>>(
                                                      stream:
                                                          queryQuestionARecord(
                                                        parent:
                                                            pageViewQuizRecord
                                                                .reference,
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child:
                                                                TransparentLoaderWidget(),
                                                          );
                                                        }
                                                        List<QuestionARecord>
                                                            quizOptionQuestionARecordList =
                                                            snapshot.data!;
                                                        // Return an empty Container when the item does not exist.
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }
                                                        final quizOptionQuestionARecord =
                                                            quizOptionQuestionARecordList
                                                                    .isNotEmpty
                                                                ? quizOptionQuestionARecordList
                                                                    .first
                                                                : null;
                                                        return QuizOptionWidget(
                                                          key: Key(
                                                              'Key7ms_${pageViewIndex}_of_${pageViewQuizRecordList.length}'),
                                                          questionNum: 'A',
                                                          questionName:
                                                              quizOptionQuestionARecord!
                                                                  .question!,
                                                          isTrue:
                                                              quizOptionQuestionARecord!
                                                                  .isTrue!,
                                                          isActive: _model
                                                              .isButtonsActive,
                                                          onTap: () async {
                                                            setState(() {
                                                              _model.isButtonsActive =
                                                                  false;
                                                            });
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 12.0),
                                                    child: StreamBuilder<
                                                        List<QuestionBRecord>>(
                                                      stream:
                                                          queryQuestionBRecord(
                                                        parent:
                                                            pageViewQuizRecord
                                                                .reference,
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child:
                                                                TransparentLoaderWidget(),
                                                          );
                                                        }
                                                        List<QuestionBRecord>
                                                            quizOptionQuestionBRecordList =
                                                            snapshot.data!;
                                                        // Return an empty Container when the item does not exist.
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }
                                                        final quizOptionQuestionBRecord =
                                                            quizOptionQuestionBRecordList
                                                                    .isNotEmpty
                                                                ? quizOptionQuestionBRecordList
                                                                    .first
                                                                : null;
                                                        return QuizOptionWidget(
                                                          key: Key(
                                                              'Keyhno_${pageViewIndex}_of_${pageViewQuizRecordList.length}'),
                                                          questionNum: 'B',
                                                          questionName:
                                                              quizOptionQuestionBRecord!
                                                                  .question!,
                                                          isTrue:
                                                              quizOptionQuestionBRecord!
                                                                  .isTrue!,
                                                          isActive: _model
                                                              .isButtonsActive,
                                                          onTap: () async {
                                                            setState(() {
                                                              _model.isButtonsActive =
                                                                  false;
                                                            });
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 12.0),
                                                    child: StreamBuilder<
                                                        List<QuestionCRecord>>(
                                                      stream:
                                                          queryQuestionCRecord(
                                                        parent:
                                                            pageViewQuizRecord
                                                                .reference,
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child:
                                                                TransparentLoaderWidget(),
                                                          );
                                                        }
                                                        List<QuestionCRecord>
                                                            quizOptionQuestionCRecordList =
                                                            snapshot.data!;
                                                        // Return an empty Container when the item does not exist.
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }
                                                        final quizOptionQuestionCRecord =
                                                            quizOptionQuestionCRecordList
                                                                    .isNotEmpty
                                                                ? quizOptionQuestionCRecordList
                                                                    .first
                                                                : null;
                                                        return QuizOptionWidget(
                                                          key: Key(
                                                              'Keyuqv_${pageViewIndex}_of_${pageViewQuizRecordList.length}'),
                                                          questionNum: 'C',
                                                          questionName:
                                                              quizOptionQuestionCRecord!
                                                                  .question!,
                                                          isTrue:
                                                              quizOptionQuestionCRecord!
                                                                  .isTrue!,
                                                          isActive: _model
                                                              .isButtonsActive,
                                                          onTap: () async {
                                                            setState(() {
                                                              _model.isButtonsActive =
                                                                  false;
                                                            });
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 12.0),
                                                    child: StreamBuilder<
                                                        List<QuestionDRecord>>(
                                                      stream:
                                                          queryQuestionDRecord(
                                                        parent:
                                                            pageViewQuizRecord
                                                                .reference,
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<QuestionDRecord>
                                                            quizOptionQuestionDRecordList =
                                                            snapshot.data!;
                                                        // Return an empty Container when the item does not exist.
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }
                                                        final quizOptionQuestionDRecord =
                                                            quizOptionQuestionDRecordList
                                                                    .isNotEmpty
                                                                ? quizOptionQuestionDRecordList
                                                                    .first
                                                                : null;
                                                        return QuizOptionWidget(
                                                          key: Key(
                                                              'Keyqe6_${pageViewIndex}_of_${pageViewQuizRecordList.length}'),
                                                          questionNum: 'D',
                                                          questionName:
                                                              quizOptionQuestionDRecord!
                                                                  .question!,
                                                          isTrue:
                                                              quizOptionQuestionDRecord!
                                                                  .isTrue!,
                                                          isActive: _model
                                                              .isButtonsActive,
                                                          onTap: () async {
                                                            setState(() {
                                                              _model.isButtonsActive =
                                                                  false;
                                                            });
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 24.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (true == false)
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Visibility(
                                      visible:
                                          FFAppState().completedQuestions > 0,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 16.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 12.0,
                                          borderWidth: 1.0,
                                          buttonSize: 60.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          icon: Icon(
                                            Icons.keyboard_arrow_left,
                                            color: Colors.white,
                                            size: 30.0,
                                          ),
                                          onPressed: () async {
                                            await _model.pageViewController
                                                ?.previousPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                            setState(() {
                                              _model.pageNavigate =
                                                  _model.pageNavigate + -1;
                                              _model.isButtonsActive = true;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                if ((FFAppState().completedQuestions >= 0) &&
                                    (FFAppState().completedQuestions <
                                        quizPageCount))
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                          if (quizPageCount !=
                                              _model.pageNavigate) {
                                            setState(() {
                                              _model.pageNavigate =
                                                  _model.pageNavigate + 1;
                                            });
                                          }
                                          setState(() {
                                            _model.isButtonsActive = true;
                                          });
                                        },
                                        text: 'Next',
                                        options: FFButtonOptions(
                                          width: 130.0,
                                          height: 60.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (FFAppState().completedQuestions ==
                                    quizPageCount)
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.goNamed(
                                          'ScorePage',
                                          queryParams: {
                                            'scoreAchieved': serializeParam(
                                              FFAppState().score,
                                              ParamType.int,
                                            ),
                                            'totalQuestions': serializeParam(
                                              quizPageCount,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );

                                        FFAppState().update(() {
                                          FFAppState().completedQuestions = 0;
                                        });
                                      },
                                      text: 'Complete',
                                      options: FFButtonOptions(
                                        width: 130.0,
                                        height: 60.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                wrapWithModel(
                                  model: _model.transparentLoaderModel,
                                  updateCallback: () => setState(() {}),
                                  child: TransparentLoaderWidget(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
