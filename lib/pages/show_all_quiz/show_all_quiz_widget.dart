import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/all_quiz_banner_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
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

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ShowAllQuiz'});
    _model.textController ??= TextEditingController();
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
              logFirebaseEvent('SHOW_ALL_QUIZ_arrow_back_rounded_ICN_ON_');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'All quiz',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                        child: Icon(
                          Icons.search_rounded,
                          color: Color(0xFFACB9C4),
                          size: 24.0,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF95A1AC),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'SHOW_ALL_QUIZ_PAGE_SEARCH_BTN_ON_TAP');
                            logFirebaseEvent('Button_simple_search');
                            await queryQuizSetRecordOnce()
                                .then(
                                  (records) => _model.simpleSearchResults1 =
                                      TextSearch(
                                    records
                                        .map(
                                          (record) => TextSearchItem(record, [
                                            record.quizName!,
                                            record.description!,
                                            record.userId!
                                          ]),
                                        )
                                        .toList(),
                                  )
                                          .search(_model.textController.text)
                                          .map((r) => r.object)
                                          .take(1000)
                                          .toList(),
                                )
                                .onError(
                                    (_, __) => _model.simpleSearchResults1 = [])
                                .whenComplete(() => setState(() {}));

                            logFirebaseEvent('Button_update_widget_state');
                            setState(() {
                              _model.showFullList = false;
                            });
                          },
                          text: 'Search',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        buttonSize: 40.0,
                        fillColor: Colors.transparent,
                        icon: Icon(
                          Icons.cancel_outlined,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'SHOW_ALL_QUIZ_cancel_outlined_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_clear_text_fields');
                          setState(() {
                            _model.textController?.clear();
                          });
                          logFirebaseEvent('IconButton_update_widget_state');
                          setState(() {
                            _model.showFullList = true;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (_model.showFullList)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 12.0, 20.0, 0.0),
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                        logFirebaseEvent(
                                            'SHOW_ALL_QUIZ_Container_dpdsqo1m_ON_TAP');
                                        logFirebaseEvent(
                                            'AllQuizBanner_navigate_to');

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

                                        logFirebaseEvent(
                                            'AllQuizBanner_update_app_state');
                                        setState(() {
                                          FFAppState().score = 0;
                                        });
                                      },
                                      child: AllQuizBannerWidget(
                                        key: Key(
                                            'Keydpd_${listViewIndex}_of_${listViewQuizSetRecordList.length}'),
                                        title: listViewQuizSetRecord.quizName,
                                        description:
                                            listViewQuizSetRecord.description,
                                        totalQuestions: listViewQuizSetRecord
                                            .totalQuestions,
                                        quizDuration: listViewQuizSetRecord
                                            .duration
                                            .toDouble(),
                                        coverImage:
                                            listViewQuizSetRecord.coverPhoto,
                                        quizIds:
                                            listViewQuizSetRecord.reference.id,
                                        canDelete: (listViewQuizSetRecord
                                                            .userId !=
                                                        null &&
                                                    listViewQuizSetRecord
                                                            .userId !=
                                                        '') &&
                                                (listViewQuizSetRecord.userId ==
                                                    currentUserUid)
                                            ? true
                                            : false,
                                        onDelete: () async {
                                          logFirebaseEvent(
                                              'SHOW_ALL_QUIZ_Container_dpdsqo1m_CALLBAC');
                                          logFirebaseEvent(
                                              'AllQuizBanner_backend_call');
                                          await listViewQuizSetRecord.reference
                                              .delete();
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      if (!_model.showFullList)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 12.0, 20.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final catNames =
                                  _model.simpleSearchResults1.toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: catNames.length,
                                itemBuilder: (context, catNamesIndex) {
                                  final catNamesItem = catNames[catNamesIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'SHOW_ALL_QUIZ_Container_ufeto0os_ON_TAP');
                                        logFirebaseEvent(
                                            'AllQuizBanner_navigate_to');

                                        context.pushNamed(
                                          'QuizPage',
                                          queryParams: {
                                            'quizSetRer': serializeParam(
                                              catNamesItem.reference,
                                              ParamType.DocumentReference,
                                            ),
                                            'quizDuration': serializeParam(
                                              catNamesItem.duration,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );

                                        logFirebaseEvent(
                                            'AllQuizBanner_update_app_state');
                                        setState(() {
                                          FFAppState().score = 0;
                                        });
                                      },
                                      child: AllQuizBannerWidget(
                                        key: Key(
                                            'Keyufe_${catNamesIndex}_of_${catNames.length}'),
                                        title: catNamesItem.quizName,
                                        description: catNamesItem.description,
                                        totalQuestions:
                                            catNamesItem.totalQuestions,
                                        quizDuration:
                                            catNamesItem.duration.toDouble(),
                                        coverImage: catNamesItem.coverPhoto,
                                        quizIds: catNamesItem.reference.id,
                                        canDelete:
                                            (catNamesItem.userId != null &&
                                                        catNamesItem.userId !=
                                                            '') &&
                                                    (catNamesItem.userId ==
                                                        currentUserUid)
                                                ? true
                                                : false,
                                        onDelete: () async {
                                          logFirebaseEvent(
                                              'SHOW_ALL_QUIZ_Container_ufeto0os_CALLBAC');
                                          logFirebaseEvent(
                                              'AllQuizBanner_backend_call');
                                          await catNamesItem.reference.delete();
                                          logFirebaseEvent(
                                              'AllQuizBanner_simple_search');
                                          await queryQuizSetRecordOnce()
                                              .then(
                                                (records) => _model
                                                        .simpleSearchResults2 =
                                                    TextSearch(
                                                  records
                                                      .map(
                                                        (record) =>
                                                            TextSearchItem(
                                                                record, [
                                                          record.quizName!,
                                                          record.description!,
                                                          record.userId!
                                                        ]),
                                                      )
                                                      .toList(),
                                                )
                                                        .search(_model
                                                            .textController
                                                            .text)
                                                        .map((r) => r.object)
                                                        .toList(),
                                              )
                                              .onError((_, __) => _model
                                                  .simpleSearchResults2 = [])
                                              .whenComplete(
                                                  () => setState(() {}));

                                          logFirebaseEvent(
                                              'AllQuizBanner_update_widget_state');
                                          setState(() {
                                            _model.showFullList = false;
                                          });
                                        },
                                      ),
                                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}
