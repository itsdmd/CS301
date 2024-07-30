// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;

Future<bool> delEventFromGCal(
  String accessToken,
  String eventId,
) async {
  // Add your function code here!
  final headers = {'Authorization': 'Bearer $accessToken'};

  final response = await http.delete(
      Uri.parse(
          'https://www.googleapis.com/calendar/v3/calendars/primary/events/$eventId'),
      headers: headers);

  if (response.statusCode == 200) {
    print('Event deleted from Google Calendar successfully:\n${response.body}');
    return true;
  } else {
    print(
        'Event deleted from Google Calendar unsuccessfully:\n${response.body}');
    return false;
  }
}
