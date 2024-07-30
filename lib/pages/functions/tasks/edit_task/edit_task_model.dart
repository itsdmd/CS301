import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/components/task_delete_confirmation/task_delete_confirmation_widget.dart';
import '/components/task_options/task_options_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_task_widget.dart' show EditTaskWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditTaskModel extends FlutterFlowModel<EditTaskWidget> {
  ///  Local state fields for this page.

  TaskUrgency? urgency = TaskUrgency.P3;

  List<DocumentReference> tags = [];
  void addToTags(DocumentReference item) => tags.add(item);
  void removeFromTags(DocumentReference item) => tags.remove(item);
  void removeAtIndexFromTags(int index) => tags.removeAt(index);
  void insertAtIndexInTags(int index, DocumentReference item) =>
      tags.insert(index, item);
  void updateTagsAtIndex(int index, Function(DocumentReference) updateFn) =>
      tags[index] = updateFn(tags[index]);

  bool dueTimeSet = true;

  String? initImgUrl;

  String? curImgUrl;

  String? tempImgUrl;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in EditTask widget.
  TasksRecord? taskRead;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for task widget.
  FocusNode? taskFocusNode;
  TextEditingController? taskTextController;
  String? Function(BuildContext, String?)? taskTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for Checkbox widget.
  Map<TasksRecord, bool> checkboxValueMap1 = {};
  List<TasksRecord> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.
  Map<TagsRecord, bool> checkboxValueMap2 = {};
  List<TagsRecord> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for UrgencyPicker widget.
  String? urgencyPickerValue;
  FormFieldController<String>? urgencyPickerValueController;
  // State field(s) for switchGCalSync widget.
  bool? switchGCalSyncValue;
  // Stores action output result for [Custom Action - taskToGCalEvent] action in UpdateBtn widget.
  dynamic? taskToEvent1;
  // Stores action output result for [Custom Action - addEventToGCal] action in UpdateBtn widget.
  String? updatedEventId1;
  // Stores action output result for [Custom Action - delEventFromGCal] action in UpdateBtn widget.
  bool? gcalDelStatus1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    taskFocusNode?.dispose();
    taskTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
