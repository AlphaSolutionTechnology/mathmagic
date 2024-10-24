import '/auth/firebase_auth/auth_util.dart';
import '/components/select_persona_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'select_persona_page_widget.dart' show SelectPersonaPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectPersonaPageModel extends FlutterFlowModel<SelectPersonaPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for selectPersona component.
  late SelectPersonaModel selectPersonaModel;

  @override
  void initState(BuildContext context) {
    selectPersonaModel = createModel(context, () => SelectPersonaModel());
  }

  @override
  void dispose() {
    selectPersonaModel.dispose();
  }
}
