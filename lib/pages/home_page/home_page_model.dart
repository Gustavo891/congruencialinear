import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for numeroA widget.
  FocusNode? numeroAFocusNode;
  TextEditingController? numeroATextController;
  String? Function(BuildContext, String?)? numeroATextControllerValidator;
  // State field(s) for numeroB widget.
  FocusNode? numeroBFocusNode;
  TextEditingController? numeroBTextController;
  String? Function(BuildContext, String?)? numeroBTextControllerValidator;
  // State field(s) for numeroM widget.
  FocusNode? numeroMFocusNode;
  TextEditingController? numeroMTextController;
  String? Function(BuildContext, String?)? numeroMTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    numeroAFocusNode?.dispose();
    numeroATextController?.dispose();

    numeroBFocusNode?.dispose();
    numeroBTextController?.dispose();

    numeroMFocusNode?.dispose();
    numeroMTextController?.dispose();
  }
}
