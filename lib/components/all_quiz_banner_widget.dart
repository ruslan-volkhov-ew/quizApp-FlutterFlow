import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_quiz_banner_model.dart';
export 'all_quiz_banner_model.dart';

class AllQuizBannerWidget extends StatefulWidget {
  const AllQuizBannerWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.totalQuestions,
    required this.quizDuration,
    required this.coverImage,
    bool? canDelete,
    required this.quizIds,
    required this.onDelete,
  })  : this.canDelete = canDelete ?? false,
        super(key: key);

  final String? title;
  final String? description;
  final int? totalQuestions;
  final double? quizDuration;
  final String? coverImage;
  final bool canDelete;
  final String? quizIds;
  final Future<dynamic> Function()? onDelete;

  @override
  _AllQuizBannerWidgetState createState() => _AllQuizBannerWidgetState();
}

class _AllQuizBannerWidgetState extends State<AllQuizBannerWidget> {
  late AllQuizBannerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllQuizBannerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 130.0,
      decoration: BoxDecoration(
        color: Color(0x1AFFFFFF),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (widget.coverImage != '')
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
              child: Container(
                width: 70.0,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x33FFFFFF),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      widget.coverImage!,
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.contain,
                      errorBuilder: (context, exception, stackTrace) {
                        return Image.asset(
                          'assets/images/no-image-icon-device.png',
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          if (widget.coverImage == '')
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
              child: Container(
                width: 70.0,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x33FFFFFF),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      'assets/images/no-image-icon-device.png',
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title!,
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                        child: Text(
                          widget.description!,
                          maxLines: 2,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.equalizer_sharp,
                        color: Colors.white,
                        size: 16.0,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: valueOrDefault<String>(
                                  widget.totalQuestions?.toString(),
                                  '0',
                                ),
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: ' questions',
                                style: TextStyle(),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Icon(
                          Icons.timer_sharp,
                          color: Colors.white,
                          size: 16.0,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: valueOrDefault<String>(
                                  formatNumber(
                                    widget.quizDuration,
                                    formatType: FormatType.custom,
                                    format: '###',
                                    locale: 'en_US',
                                  ),
                                  '0',
                                ),
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: ' Min',
                                style: TextStyle(),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.canDelete == true)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (widget.canDelete) {
                      await widget.onDelete?.call();
                    }
                  },
                  child: Container(
                    width: 62.0,
                    height: 42.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF0038FF),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(12.0),
                      ),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Icon(
                      Icons.delete_outline_outlined,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
              Container(
                width: 62.0,
                height: 42.0,
                decoration: BoxDecoration(
                  color: Color(0xFF0038FF),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(12.0),
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
