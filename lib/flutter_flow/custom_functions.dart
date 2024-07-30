import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

bool dateIsToday(DateTime dateTime) {
  DateTime now = DateTime.now();
  return dateTime.year == now.year &&
      dateTime.month == now.month &&
      dateTime.day == now.day;
}

DateTime todayMidnight() {
  DateTime now = DateTime.now();
  return DateTime(now.year, now.month, now.day, 23, 59, 59);
}

bool stringIsSubstring(
  String needle,
  String haystack,
) {
  return haystack.toLowerCase().contains(needle.toLowerCase());
}

bool tagListsHaveIntersection(
  List<DocumentReference> target,
  List<DocumentReference> ref,
) {
  if (ref.isEmpty) {
    return true;
  }

  final set1 = target.toSet();
  final set2 = ref.toSet();

  // Check if the intersection of the sets is not empty
  return set1.intersection(set2).isNotEmpty;
}

bool dateIsBetweenDates(
  DateTime targetDate,
  DateTime? fromDate,
  DateTime? toDate,
) {
  if (fromDate == null && toDate == null) {
    return true; // Both from and to are null, consider as in between
  } else if (fromDate == null) {
    // fromDate is null, check if targetDate is before or equal to toDate
    return targetDate.isBefore(toDate!) || targetDate.isAtSameMomentAs(toDate);
  } else if (toDate == null) {
    // toDate is null, check if targetDate is fromDate or after
    return targetDate.isAfter(fromDate) ||
        targetDate.isAtSameMomentAs(fromDate);
  } else {
    // Both from and to provided, check if targetDate is within range (inclusive)
    return fromDate.isBefore(targetDate) && targetDate.isBefore(toDate) ||
        targetDate.isAtSameMomentAs(fromDate) ||
        targetDate.isAtSameMomentAs(toDate);
  }
}

bool stringIsAlphaOnly(String input) {
  if (input.length == 0) {
    return false;
  }
  if (input.length > 15) {
    return false;
  }
  final numRegex = RegExp(r'[0-9]+');
  if (numRegex.hasMatch(input)) {
    return false;
  }
  final specialChars = [
    '!',
    '@',
    '#',
    '\$',
    '%',
    '^',
    '&',
    '*',
    '(',
    ')',
    '_',
    '+',
    '=',
    '{',
    '}',
    '[',
    ']',
    '\\',
    '|',
    ';',
    ':',
    '"',
    ',',
    '<',
    '.',
    '>',
    '/',
    '?'
  ];
  for (var char in input.split('')) {
    if (specialChars.contains(char)) {
      return false;
    }
  }
  return true;
}

DateTime? addTime(
  DateTime time,
  int addHour,
) {
  return time.add(Duration(hours: addHour));
}

String? getCalEventId(dynamic eventObj) {
  // return the value of field "id" of input argument as string
  if (eventObj != null && eventObj['id'] != null) {
    print("retrieved id: " + eventObj['id'].toString());
    return eventObj['id'].toString();
  }
  return null;
}
