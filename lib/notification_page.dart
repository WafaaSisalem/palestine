import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'colorhelper.dart';

const loremIpsum =
    'Send notifications to users who haven\'t registered for an upcomingevent to re-mind them to sign up before the regis-tration deadline.';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: ColorHelper.green0C,
          useInkWell: true,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: const [
            NotificationWidget(
              title: 'Registration reminders',
              content: loremIpsum,
              date: '25/Feb/2023',
            ),
            NotificationWidget(
              title: 'Event Updates',
              content: loremIpsum,
              date: '25/Feb/2023',
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget(
      {super.key,
      required this.title,
      required this.content,
      required this.date});
  final String title;
  final String content;
  final String date;
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0x1a000000)))),
      padding: const EdgeInsets.fromLTRB(21, 21, 27, 15),
      child: Column(
        children: [
          ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToCollapse: true,
              ),
              header: Row(children: [
                const Icon(Icons.notifications_outlined),
                const SizedBox(
                  width: 12,
                ),
                buildNotificationTitle(title)
              ]),
              collapsed: Padding(
                padding: const EdgeInsets.only(right: 23),
                child: Text(
                  loremIpsum,
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: buildNotificationContentTextStyle(),
                ),
              ),
              expanded: Padding(
                padding: const EdgeInsets.only(right: 23),
                child: Text(
                  loremIpsum,
                  style: buildNotificationContentTextStyle(),
                ),
              )),
          const SizedBox(
            height: 11,
          ),
          buildNotificationDate(date),
        ],
      ),
    ));
  }
}

Text buildNotificationTitle(title) {
  return Text(
    title,
    style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
  );
}

Align buildNotificationDate(date) {
  return Align(
    alignment: Alignment.centerRight,
    child: Text(
      date,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    ),
  );
}

buildNotificationContentTextStyle() {
  return const TextStyle(fontSize: 18, fontWeight: FontWeight.w300);
}
