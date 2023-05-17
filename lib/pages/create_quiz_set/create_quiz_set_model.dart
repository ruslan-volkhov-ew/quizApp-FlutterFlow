import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/quiz_sets_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateQuizSetModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isTitleNotEmpty = false;

  bool isDurationNotEmpty = false;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TitleTextField widget.
  TextEditingController? titleTextFieldController;
  String? Function(BuildContext, String?)? titleTextFieldControllerValidator;
  // State field(s) for DescriptionTextField widget.
  TextEditingController? descriptionTextFieldController;
  String? Function(BuildContext, String?)?
      descriptionTextFieldControllerValidator;
  // State field(s) for DurationTextField widget.
  TextEditingController? durationTextFieldController;
  String? Function(BuildContext, String?)? durationTextFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    titleTextFieldController?.dispose();
    descriptionTextFieldController?.dispose();
    durationTextFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
