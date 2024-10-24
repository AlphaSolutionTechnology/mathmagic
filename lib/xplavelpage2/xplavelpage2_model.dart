import '/components/xp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'xplavelpage2_widget.dart' show Xplavelpage2Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Xplavelpage2Model extends FlutterFlowModel<Xplavelpage2Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for XP component.
  late XpModel xpModel;

  @override
  void initState(BuildContext context) {
    xpModel = createModel(context, () => XpModel());
  }

  @override
  void dispose() {
    xpModel.dispose();
  }
}
