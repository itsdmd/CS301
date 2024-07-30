import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'task_filter_options_widget.dart' show TaskFilterOptionsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskFilterOptionsModel extends FlutterFlowModel<TaskFilterOptionsWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> selectedTags = [];
  void addToSelectedTags(DocumentReference item) => selectedTags.add(item);
  void removeFromSelectedTags(DocumentReference item) =>
      selectedTags.remove(item);
  void removeAtIndexFromSelectedTags(int index) => selectedTags.removeAt(index);
  void insertAtIndexInSelectedTags(int index, DocumentReference item) =>
      selectedTags.insert(index, item);
  void updateSelectedTagsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      selectedTags[index] = updateFn(selectedTags[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  Map<TagsRecord, bool> checkboxValueMap = {};
  List<TagsRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
