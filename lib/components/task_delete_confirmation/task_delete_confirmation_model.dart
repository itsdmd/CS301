import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'task_delete_confirmation_widget.dart' show TaskDeleteConfirmationWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskDeleteConfirmationModel
    extends FlutterFlowModel<TaskDeleteConfirmationWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in convertComponent widget.
  List<TasksRecord>? subtasks;
  // Stores action output result for [Backend Call - Read Document] action in convertComponent widget.
  TasksRecord? taskRef;
  // Stores action output result for [Backend Call - Read Document] action in convertComponent widget.
  TasksRecord? thisTask;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
