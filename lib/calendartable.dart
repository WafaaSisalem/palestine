// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'colorhelper.dart';
import 'util.dart';

class TableBasicsExample extends StatefulWidget {
  @override
  _TableBasicsExampleState createState() => _TableBasicsExampleState();
}

class _TableBasicsExampleState extends State<TableBasicsExample> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TableCalendar - Basics'),
      ),
      body: TableCalendar(
        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          todayDecoration: BoxDecoration(
              color: ColorHelper.orangeF7,
              borderRadius: BorderRadius.circular(4),
              shape: BoxShape.rectangle),
        ),
        firstDay: kFirstDay,
        lastDay: kLastDay,
        focusedDay: _focusedDay,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          leftChevronIcon: Container(
            width: 19,
            height: 19,
            decoration: BoxDecoration(
                color: ColorHelper.green0C,
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.arrow_back_ios,
              size: 13,
              color: Colors.white,
            ),
          ),
          rightChevronIcon: Container(
            width: 19,
            height: 19,
            decoration: BoxDecoration(
                color: ColorHelper.green0C,
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 13,
              color: Colors.white,
            ),
          ),
        ),
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.

          // Using `isSameDay` is recommended to disregard
          // the time-part of compared DateTime objects.
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
