import 'package:flutter/material.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:palestine/colorhelper.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = DateFormat.MMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();
//  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];
  // static Widget _eventIcon = new Container(
  //   decoration: new BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.all(Radius.circular(1000)),
  //       border: Border.all(color: Colors.blue, width: 2.0)),
  //   child: new Icon(
  //     Icons.person,
  //     color: Colors.amber,
  //   ),
  // );

  // EventList<Event> _markedDateMap = new EventList<Event>(
  //   events: {
  //     new DateTime(2019, 2, 10): [
  //       new Event(
  //         date: new DateTime(2019, 2, 10),
  //         title: 'Event 1',
  //         icon: _eventIcon,
  //         dot: Container(
  //           margin: EdgeInsets.symmetric(horizontal: 1.0),
  //           color: Colors.red,
  //           height: 5.0,
  //           width: 5.0,
  //         ),
  //       ),
  //       new Event(
  //         date: new DateTime(2019, 2, 10),
  //         title: 'Event 2',
  //         icon: _eventIcon,
  //       ),
  //       new Event(
  //         date: new DateTime(2019, 2, 10),
  //         title: 'Event 3',
  //         icon: _eventIcon,
  //       ),
  //     ],
  //   },
  // );

  // @override
  // void initState() {
  //   /// Add more events to _markedDateMap EventList
  //   _markedDateMap.add(
  //       new DateTime(2019, 2, 25),
  //       new Event(
  //         date: new DateTime(2019, 2, 25),
  //         title: 'Event 5',
  //         icon: _eventIcon,
  //       ));

  //   _markedDateMap.add(
  //       new DateTime(2019, 2, 10),
  //       new Event(
  //         date: new DateTime(2019, 2, 10),
  //         title: 'Event 4',
  //         icon: _eventIcon,
  //       ));

  //   _markedDateMap.addAll(new DateTime(2019, 2, 11), [
  //     new Event(
  //       date: new DateTime(2019, 2, 11),
  //       title: 'Event 1',
  //       icon: _eventIcon,
  //     ),
  //     new Event(
  //       date: new DateTime(2019, 2, 11),
  //       title: 'Event 2',
  //       icon: _eventIcon,
  //     ),
  //     new Event(
  //       date: new DateTime(2019, 2, 11),
  //       title: 'Event 3',
  //       icon: _eventIcon,
  //     ),
  //   ]);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    /// Example Calendar Carousel without header and custom prev & next button
    final _calendarCarouselNoHeader = CalendarCarousel<Event>(
      // onDayPressed: (date, events) {
      //   this.setState(() => _currentDate2 = date);
      //   events.forEach((event) => print(event.title));
      // },
      daysHaveCircularBorder: false,
      height: 365,
      width: 320,
      weekDayPadding: EdgeInsets.all(3),
      todayButtonColor: const Color(0xffF7BF66),
      todayBorderColor: Colors.transparent,
      weekdayTextStyle: TextStyle(color: Colors.black, fontSize: 15),
      showOnlyCurrentMonthDate: true,
      weekendTextStyle: TextStyle(
        color: Colors.black,
      ),
      weekFormat: false,
//      firstDayOfWeek: 4,
      // markedDatesMap: _markedDateMap,

      targetDateTime: _targetDateTime,
      daysTextStyle: const TextStyle(color: Colors.black, fontSize: 15),
      customGridViewPhysics: const NeverScrollableScrollPhysics(),
      showHeader: false,
      // markedDateShowIcon: true,
      // markedDateIconMaxShown: 2,
      // markedDateIconBuilder: (event) {
      //   return event.icon;
      // },
      // markedDateMoreShowTotal:
      //     true,

      selectedDayTextStyle: const TextStyle(color: Colors.white, fontSize: 15),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      markedDateMoreCustomDecoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15)),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //custom icon
              //custom icon without header
              Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: new Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _currentMonth,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    )),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _targetDateTime = DateTime(
                              _targetDateTime.year, _targetDateTime.month + 1);
                          _currentMonth =
                              DateFormat.yMMM().format(_targetDateTime);
                        });
                      },
                      child: Container(
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
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _targetDateTime = DateTime(
                              _targetDateTime.year, _targetDateTime.month + 1);
                          _currentMonth =
                              DateFormat.yMMM().format(_targetDateTime);
                        });
                      },
                      child: Container(
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
                    )
                  ],
                ),
              ),
              Container(
                height: 300,
                padding: EdgeInsets.fromLTRB(20, 25, 25, 20),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(26)),
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: _calendarCarouselNoHeader,
              ), //
            ],
          ),
        ));
  }
}
