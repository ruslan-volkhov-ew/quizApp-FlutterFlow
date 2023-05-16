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

class QuizPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int pageNavigate = 0;

  bool isButtonsActive = true;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // State field(s) for Timer widget.
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  StopWatchTimer timerController =
      StopWatchTimer(mode: StopWatchMode.countDown);

  // State field(s) for PageView widget.
  PageController? pageViewController;
  // Model for TransparentLoader component.
  late TransparentLoaderModel transparentLoaderModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    transparentLoaderModel =
        createModel(context, () => TransparentLoaderModel());
  }

  void dispose() {
    instantTimer?.cancel();
    timerController.dispose();
    transparentLoaderModel.dispose();
  }

  /// Additional helper methods are added here.

}
