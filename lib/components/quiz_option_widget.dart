import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_option_model.dart';
export 'quiz_option_model.dart';

class QuizOptionWidget extends StatefulWidget {
  const QuizOptionWidget({
    Key? key,
    required this.questionNum,
    required this.questionName,
    required this.isTrue,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  final String? questionNum;
  final String? questionName;
  final bool? isTrue;
  final bool? isActive;
  final Future<dynamic> Function()? onTap;

  @override
  _QuizOptionWidgetState createState() => _QuizOptionWidgetState();
}

class _QuizOptionWidgetState extends State<QuizOptionWidget> {
  late QuizOptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizOptionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (widget.isActive!) {
          if (widget.isTrue!) {
            if (_model.isAnswered != null) {
              setState(() {
                _model.isAnswered = null;
              });
              setState(() {
                FFAppState().completedQuestions =
                    FFAppState().completedQuestions + -1;
              });
              setState(() {
                FFAppState().score = FFAppState().score + -1;
              });
            } else {
              setState(() {
                _model.isAnswered = true;
              });
              setState(() {
                FFAppState().completedQuestions =
                    FFAppState().completedQuestions + 1;
              });
              setState(() {
                FFAppState().score = FFAppState().score + 1;
              });
            }
          } else {
            if (_model.isAnswered != null) {
              setState(() {
                _model.isAnswered = null;
              });
              setState(() {
                FFAppState().completedQuestions =
                    FFAppState().completedQuestions + -1;
              });
            } else {
              setState(() {
                _model.isAnswered = false;
              });
              setState(() {
                FFAppState().completedQuestions =
                    FFAppState().completedQuestions + 1;
              });
            }
          }
        }
        await widget.onTap?.call();
      },
      child: Container(
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            () {
              if (_model.isAnswered == true) {
                return Color(0x334B39EF);
              } else if (_model.isAnswered == false) {
                return Color(0x32FF0000);
              } else {
                return Colors.transparent;
              }
            }(),
            Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: valueOrDefault<Color>(
              () {
                if (_model.isAnswered == true) {
                  return Color(0xFF4B39EF);
                } else if (_model.isAnswered == false) {
                  return Color(0xFFFF0000);
                } else {
                  return Colors.white;
                }
              }(),
              Colors.white,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 36.0,
                height: 36.0,
                decoration: BoxDecoration(
                  color: valueOrDefault<Color>(
                    () {
                      if (_model.isAnswered == true) {
                        return Color(0xFF4B39EF);
                      } else if (_model.isAnswered == false) {
                        return Color(0xFFFF0000);
                      } else {
                        return Colors.transparent;
                      }
                    }(),
                    Colors.transparent,
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: valueOrDefault<Color>(
                      () {
                        if (_model.isAnswered == true) {
                          return Color(0xFF4B39EF);
                        } else if (_model.isAnswered == false) {
                          return Color(0xFFFF0000);
                        } else {
                          return Colors.white;
                        }
                      }(),
                      Colors.white,
                    ),
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    widget.questionNum!,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                child: Text(
                  widget.questionName!,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
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
