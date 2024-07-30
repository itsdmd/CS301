import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/account_delete_confirmation/account_delete_confirmation_widget.dart';
import '/components/language_selector/language_selector_widget.dart';
import '/components/profile_pic_options/profile_pic_options_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'settings_widget.dart' show SettingsWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  Local state fields for this page.

  String? initImgUrl;

  String? curImgUrl;

  String? tempImgUrl;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DarkModeToggle widget.
  bool? darkModeToggleValue;
  // Stores action output result for [Custom Action - getGglAccessToken] action in Container widget.
  String? accessToken;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
