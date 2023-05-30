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

class ShowAllQuizModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isTitleNotEmpty = false;

  bool isDurationNotEmpty = false;

  bool showFullList = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<QuizSetRecord> simpleSearchResults1 = [];
  List<QuizSetRecord> simpleSearchResults2 = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController?.dispose();
  }

  /// Additional helper methods are added here.

}
