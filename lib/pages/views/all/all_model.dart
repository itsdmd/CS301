import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/task_delete_confirmation/task_delete_confirmation_widget.dart';
import '/components/task_options/task_options_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'all_widget.dart' show AllWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllModel extends FlutterFlowModel<AllWidget> {
  ///  Local state fields for this page.

  String? filterTitle;

  bool showFiltersAndSortBtns = false;

  List<DocumentReference> filterTags = [];
  void addToFilterTags(DocumentReference item) => filterTags.add(item);
  void removeFromFilterTags(DocumentReference item) => filterTags.remove(item);
  void removeAtIndexFromFilterTags(int index) => filterTags.removeAt(index);
  void insertAtIndexInFilterTags(int index, DocumentReference item) =>
      filterTags.insert(index, item);
  void updateFilterTagsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      filterTags[index] = updateFn(filterTags[index]);

  bool showFilters = false;

  bool showSort = false;

  DateTime? fromDate;

  DateTime? toDate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SearchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;
  // State field(s) for Checkbox widget.
  Map<TagsRecord, bool> checkboxValueMap1 = {};
  List<TagsRecord> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for Checkbox widget.
  Map<TasksRecord, bool> checkboxValueMap2 = {};
  List<TasksRecord> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();
  }
}
