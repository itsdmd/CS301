import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  Local state fields for this page.

  bool changePwdSuccess = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for CurrentPwd widget.
  FocusNode? currentPwdFocusNode;
  TextEditingController? currentPwdTextController;
  late bool currentPwdVisibility;
  String? Function(BuildContext, String?)? currentPwdTextControllerValidator;
  String? _currentPwdTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8k38i0c2' /* Field is required */,
      );
    }

    if (val.length > 1000) {
      return FFLocalizations.of(context).getText(
        '39gycc0q' /* Password is too long */,
      );
    }

    return null;
  }

  // State field(s) for NewPwd widget.
  FocusNode? newPwdFocusNode;
  TextEditingController? newPwdTextController;
  late bool newPwdVisibility;
  String? Function(BuildContext, String?)? newPwdTextControllerValidator;
  String? _newPwdTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5anco60e' /* Field is required */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        '1brd7ukk' /* Password must contains 6 or mo... */,
      );
    }
    if (val.length > 1000) {
      return FFLocalizations.of(context).getText(
        'hnfb4mtx' /* Password is too long */,
      );
    }

    return null;
  }

  // State field(s) for ConfirmNewPwd widget.
  FocusNode? confirmNewPwdFocusNode;
  TextEditingController? confirmNewPwdTextController;
  late bool confirmNewPwdVisibility;
  String? Function(BuildContext, String?)? confirmNewPwdTextControllerValidator;
  String? _confirmNewPwdTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'weyll860' /* Field is required */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'oewg2j9z' /* Password must contains 6 or mo... */,
      );
    }
    if (val.length > 1000) {
      return FFLocalizations.of(context).getText(
        'z46v3bwx' /* Password is too long */,
      );
    }

    return null;
  }

  // Stores action output result for [Custom Action - changePassword] action in UpdateBtn widget.
  bool? changPwdStatus;

  @override
  void initState(BuildContext context) {
    currentPwdVisibility = false;
    currentPwdTextControllerValidator = _currentPwdTextControllerValidator;
    newPwdVisibility = false;
    newPwdTextControllerValidator = _newPwdTextControllerValidator;
    confirmNewPwdVisibility = false;
    confirmNewPwdTextControllerValidator =
        _confirmNewPwdTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    currentPwdFocusNode?.dispose();
    currentPwdTextController?.dispose();

    newPwdFocusNode?.dispose();
    newPwdTextController?.dispose();

    confirmNewPwdFocusNode?.dispose();
    confirmNewPwdTextController?.dispose();
  }
}
