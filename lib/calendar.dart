import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import 'package:palestine/colorhelper.dart';
import 'package:palestine/dummy_data.dart';

import 'event_card_widget.dart';
import 'event_model.dart';

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime currentDate = DateTime.now();
  String currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime targetDateTime = DateTime.now();

  //map of events
  // EventList<Event> markedDateMap = EventList<Event>(
  //   events: {
  //     DateTime(2023, 3, 10): [
  //       Event(
  //           date: DateTime(2023, 3, 10),
  //           title: 'Event 1',
  //           dot: dotDecoration()),
  //       Event(
  //           date: DateTime(2023, 3, 10),
  //           title: 'Event 44',
  //           dot: dotDecoration()),
  //     ],
  //     DateTime(2023, 3, 15): [
  //       Event(
  //           date: DateTime(2023, 3, 15),
  //           title: 'Event 1',
  //           dot: dotDecoration()),
  //     ],
  //     DateTime(2023, 3, 20): [
  //       Event(
  //           date: DateTime(2023, 3, 20),
  //           title: 'Event 1',
  //           dot: dotDecoration()),
  //     ],
  //   },
  // );
  EventList<Event> markedDateMap = EventList<Event>(events: {});
  List<EventModel> selectedDayEvents = DummyData.events
      .where((event) => event.date.isSameDate(DateTime.now()) == true)
      .toList();
  @override
  void initState() {
    List<EventModel> events = DummyData.events;
    events.forEach((event) {
      markedDateMap.add(
        event.date,
        Event(date: event.date, dot: dotDecoration(), id: event.id),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final calendarCarouselNoHeader = CalendarCarousel<Event>(
      // height: 365,
      // width: 320,
      height: 355,
      width: 300,
      onDayPressed: (date, events) {
        currentDate = date;
        setSelectedDayEvents(events);
        setState(() {});
        //you can print event[0].title or something like that
      },

      daysHaveCircularBorder:
          true, //if you want the selected day to be a circle make this true
      todayBorderColor: Colors.transparent,
      weekdayTextStyle: buildDayTextStyle(),
      showOnlyCurrentMonthDate:
          true, //if you want to display the last month dates in the calendar in grey color set this to false

      weekendTextStyle: buildDayTextStyle(),
      weekFormat:
          false, //if you want to display only a week not all weeks (a month), set this to true
      markedDatesMap: markedDateMap,
      targetDateTime: targetDateTime,
      daysTextStyle: buildDayTextStyle(),
      showHeader: false,

      selectedDayButtonColor: ColorHelper.orangeF7,
      selectedDayBorderColor: Colors.transparent,
      todayButtonColor: Colors.transparent,
      todayTextStyle: buildDayTextStyle(),
      selectedDayTextStyle: const TextStyle(color: Colors.white, fontSize: 15),
      minSelectedDate: currentDate.subtract(const Duration(days: 360)),
      maxSelectedDate: currentDate.add(const Duration(days: 360)),
      selectedDateTime: currentDate,
      onCalendarChanged: (DateTime date) {
        setState(() {
          targetDateTime = date;
          currentMonth = DateFormat.yMMM().format(
              targetDateTime); //if you want the month withou the year instead of yMMM put MMMM
        });
      },
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(36, 25, 25, 17),
              child: buildCalendarHeader(),
            ),
            buildCalendarBody(calendarCarouselNoHeader),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: buildLocalAttendingWidget(),
            ),
            const SizedBox(
              height: 35,
            ),
            buildDateWidget(),
            buildListOfEventsWidget()
          ],
        ),
      ),
    );
  }

  Expanded buildListOfEventsWidget() {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.fromLTRB(35, 16, 37, 30),
          child: selectedDayEvents.isEmpty
              ? const Center(
                  child: Text('NO events in this day!'),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    // 'Tue, 17 may, 2032'
                    //('EEEE, d MMMM, y')
                    //Thursday, 2 March, 2023
                    //'EEE, d MMM, y'

                    return EventCardWidget(
                      event: selectedDayEvents[index],
                    );
                  }),
                  separatorBuilder: ((context, index) {
                    return const SizedBox(height: 11);
                  }),
                  itemCount: selectedDayEvents.length)),
    );
  }

  Padding buildDateWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 35),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          DateFormat('EEEE, d MMMM, y').format(currentDate),
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Row buildLocalAttendingWidget() {
    return Row(
      children: [buildLeftSideLAWidget(), buildRightSideLAWidget()],
    );
  }

  Expanded buildRightSideLAWidget() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            color: ColorHelper.greyF9FB,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        height: 39,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Attending',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }

  Expanded buildLeftSideLAWidget() {
    return Expanded(
      child: Container(
        height: 39,
        decoration: const BoxDecoration(
            color: ColorHelper.greyF4,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.check,
              size: 12,
            ),
            SizedBox(
              width: 11,
            ),
            Text(
              'Local',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }

  Container buildCalendarBody(
      CalendarCarousel<Event> calendarCarouselNoHeader) {
    return Container(
      height: 275,
      padding: const EdgeInsets.fromLTRB(17, 17, 17, 22),
      decoration: BoxDecoration(
          color: ColorHelper.greyF9, borderRadius: BorderRadius.circular(26)),
      child: calendarCarouselNoHeader,
    );
  }

  Row buildCalendarHeader() {
    return Row(
      children: [
        Expanded(
            child: Text(
          currentMonth,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        )),
        buildHeaderButton(
            onTap: () {
              setState(() {
                targetDateTime =
                    DateTime(targetDateTime.year, targetDateTime.month - 1);
                currentMonth = DateFormat.yMMM().format(targetDateTime);
              });
            },
            icon: Icons.arrow_back_ios),
        const SizedBox(
          width: 16,
        ),
        buildHeaderButton(
            onTap: () {
              setState(() {
                targetDateTime =
                    DateTime(targetDateTime.year, targetDateTime.month + 1);
                currentMonth = DateFormat.yMMM().format(targetDateTime);
              });
            },
            icon: Icons.arrow_forward_ios)
      ],
    );
  }

  GestureDetector buildHeaderButton(
      {required VoidCallback onTap, required IconData icon}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
            color: ColorHelper.green0C, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Icon(
            icon,
            size: 13,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void setSelectedDayEvents(List<Event> events) {
    selectedDayEvents = events.map((event) => getEventById(event.id)).toList();
  }
}

TextStyle buildDayTextStyle() {
  return const TextStyle(color: Colors.black, fontSize: 15);
}

dotDecoration() {
  return Container(
    decoration: const BoxDecoration(
        color: ColorHelper.orangeF7, shape: BoxShape.circle),
    height: 4.0,
    width: 4.0,
  );
}

EventModel getEventById(id) {
  final event = DummyData.events.where((event) => event.id == id).toList();
  return event[0];
}
