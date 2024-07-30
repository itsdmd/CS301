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

Future<String> addEventToGCal(
  String accessToken,
  dynamic jsonEvent,
) async {
  // Add your function code here!
  final headers = {
    'Authorization': 'Bearer $accessToken',
    'Content-Type': 'application/json'
  };

  final response = await http.post(
      Uri.parse(
          'https://www.googleapis.com/calendar/v3/calendars/primary/events'),
      headers: headers,
      body: jsonEncode(jsonEvent));

  if (response.statusCode == 200) {
    print('Event inserted to Google Calendar successfully:\n${response.body}');
    final dynamic decoded = jsonDecode(response.body);
    final mapped = decoded as Map;

    print('event id:' + mapped['id']);
    return mapped['id']!;
  } else {
    print(
        'Event inserted to Google Calendar unsuccessfully:\n${response.body}');
    return "";
  }
}
