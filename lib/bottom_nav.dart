import 'package:flutter/material.dart';
import 'package:palestine/calendar.dart';
import 'package:palestine/colorhelper.dart';
import 'package:palestine/square_event_card.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key});

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  int currentIndex = 0;

  List<Widget> screens = [CalendarPage(), SquareEventCard()];

  void _onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorHelper.greyFC,
        elevation: 3,
        onPressed: () {},
        tooltip: 'QR',
        child: const Icon(
          Icons.qr_code_scanner,
          color: ColorHelper.grey82,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        unselectedLabelStyle:
            const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        unselectedItemColor: ColorHelper.grey82,
        selectedItemColor: ColorHelper.green0C,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(
              Icons.home,
              color: ColorHelper.green0C,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            activeIcon: Icon(
              Icons.home,
              color: ColorHelper.green0C,
            ),
            label: 'Schedule',
          ),
        ],
        currentIndex: currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
