import '/backend/backend.dart';
import '/components/footer/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'vote_widget.dart' show VoteWidget;
import 'package:flutter/material.dart';

class VoteModel extends FlutterFlowModel<VoteWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Slider widget.
  double? sliderValue1;
  // State field(s) for Slider widget.
  double? sliderValue2;
  // State field(s) for Slider widget.
  double? sliderValue3;
  // State field(s) for Slider widget.
  double? sliderValue4;
  // State field(s) for Slider widget.
  double? sliderValue5;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '記入... is required';
    }

    if (val.length < 10) {
      return '10文字以上は記入してください';
    }

    return null;
  }

  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? formOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ScoresRecord? alreadyAssessed;
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    footerModel.dispose();
  }
}
