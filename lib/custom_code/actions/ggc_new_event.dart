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

import 'package:googleapis/calendar/v3.dart' as calendarApi;
import 'package:googleapis_auth/auth_io.dart' as authApi;

Future<void> ggcNewEvent(String title, DateTime startTime, DateTime endTime,
    String calendarId) async {
  final event = calendarApi.Event();

  event.summary = title;
  event.start = calendarApi.EventDateTime();
  event.start?.dateTime = DateTime.parse(startTime.toIso8601String());
  event.end = calendarApi.EventDateTime();
  event.end?.dateTime = DateTime.parse(endTime.toIso8601String());

  final httpClient =
      await authApi.clientViaApplicationDefaultCredentials(scopes: [
    "https://www.googleapis.com/auth/calendar.events",
  ]);
  final calendar = calendarApi.CalendarApi(httpClient);

  try {
    await calendar.events.insert(event, calendarId);
    print('Event created successfully!');
  } on calendarApi.ApiRequestError catch (error) {
    print('Error creating event: $error');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
