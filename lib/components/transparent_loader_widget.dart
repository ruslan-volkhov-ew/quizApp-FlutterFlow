import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'transparent_loader_model.dart';
export 'transparent_loader_model.dart';

class TransparentLoaderWidget extends StatefulWidget {
  const TransparentLoaderWidget({Key? key}) : super(key: key);

  @override
  _TransparentLoaderWidgetState createState() =>
      _TransparentLoaderWidgetState();
}

class _TransparentLoaderWidgetState extends State<TransparentLoaderWidget> {
  late TransparentLoaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransparentLoaderModel());
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
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
    );
  }
}
