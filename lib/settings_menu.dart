// import 'package:flutter/material.dart';
// import 'package:palestine/colorhelper.dart';

// // main method
// void main() {
// // runapp method run the our main app
//   runApp(SimpleAppBarPopupMenuButton());
// }

// class SimpleAppBarPopupMenuButton extends StatelessWidget {
//   const SimpleAppBarPopupMenuButton({Key? key}) : super(key: key);
// // definition of the dialog
// // box when value is selected
//   void _showDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Alert!!"),
//           content: Text("You are awesome!"),
//           actions: [
//             MaterialButton(
//               child: Text("OK"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // MaterialApp with debugShowCheckedModeBanner
//     // false and title.
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'AppBar Popup Menu Button',
//       // scaffold with appbar
//       home: Scaffold(
//         // appbar with title text
//         appBar: AppBar(
//           title: Text('AppBar Popup Menu Button'),
//           // in action widget we have PopupMenuButton
//           actions: [
//             PopupMenuButton<int>(
//               itemBuilder: (context) => [
//                 // PopupMenuItem 1
//                 PopupMenuItem(
//                   value: 1,
//                   // row with 2 children
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.language,
//                         color: ColorHelper.green0C,
//                       ),
//                       SizedBox(
//                         width: 14,
//                       ),
//                       Text(
//                         "Language",
//                         style: TextStyle(
//                             fontSize: 22, fontWeight: FontWeight.w500),
//                       )
//                     ],
//                   ),
//                 ),
//                 // PopupMenuItem 2
//                 PopupMenuItem(
//                   value: 2,
//                   // row with two children
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.logout,
//                         color: ColorHelper.green0C,
//                       ),
//                       SizedBox(
//                         width: 14,
//                       ),
//                       Text(
//                         "Logout",
//                         style: TextStyle(
//                             fontSize: 22, fontWeight: FontWeight.w500),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//               offset: Offset(0, 100),
//               color: Colors.white,
//               elevation: 2,
//               // on selected we show the dialog box
//               onSelected: (value) {
//                 // if value 1 show dialog
//                 if (value == 1) {
//                   _showDialog(context);
//                   // if value 2 show dialog
//                 } else if (value == 2) {
//                   _showDialog(context);
//                 }
//               },
//             ),
//           ],
//         ),
//         // body with centered text
//         body: Center(
//           child: Text("Press the 3 Point Button Up!"),
//         ),
//       ),
//     );
//   }
// }
// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_down_button/pull_down_button.dart';

@immutable
class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    final edgeInsets = MediaQuery.of(context).padding;
    final padding = EdgeInsets.only(
      left: 16 + edgeInsets.left,
      top: 24 + edgeInsets.top,
      right: 16 + edgeInsets.right,
      bottom: 24 + edgeInsets.bottom,
    );

    return ListView.separated(
      padding: padding,
      reverse: true,
      itemBuilder: (context, index) {
        final isSender = index.isEven;

        return Align(
          alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
          child: ExampleMenu(
            position: PullDownMenuPosition.automatic,
            itemsOrder: PullDownMenuItemsOrder.automatic,
            applyOpacity: false,
            builder: (_, showMenu) => CupertinoButton(
              onPressed: showMenu,
              padding: EdgeInsets.zero,
              child: _MessageExample(isSender: isSender),
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemCount: 20,
    );
  }
}

@immutable
class ExampleMenu extends StatelessWidget {
  const ExampleMenu({
    super.key,
    required this.position,
    required this.itemsOrder,
    required this.builder,
    this.applyOpacity = true,
  });

  final PullDownMenuPosition position;
  final PullDownMenuButtonBuilder builder;
  final PullDownMenuItemsOrder itemsOrder;
  final bool applyOpacity;

  @override
  Widget build(BuildContext context) => PullDownButton(
        itemBuilder: (context) => [
          PullDownMenuActionsRow.small(
            items: [
              PullDownMenuItem(
                onTap: () {},
                title: 'Cut',
                icon: CupertinoIcons.scissors,
              ),
              PullDownMenuItem(
                onTap: () {},
                title: 'Copy',
                icon: CupertinoIcons.doc_on_doc,
              ),
              PullDownMenuItem(
                onTap: () {},
                title: 'Paste',
                icon: CupertinoIcons.doc_on_clipboard,
              ),
              PullDownMenuItem(
                onTap: () {},
                title: 'Look Up',
                icon: CupertinoIcons.doc_text_search,
              ),
            ],
          ),
          const PullDownMenuDivider.large(),
          PullDownMenuItem(
            enabled: false,
            title: 'Select',
            onTap: () {},
            icon: CupertinoIcons.checkmark_circle,
          ),
          const PullDownMenuDivider(),
          PullDownMenuItem(
            title: 'Connect to remote server',
            onTap: () {},
            icon: CupertinoIcons.cloud_upload,
          ),
          const PullDownMenuDivider.large(),
          PullDownMenuItem.selectable(
            title: 'Grid',
            selected: true,
            onTap: () {},
            icon: CupertinoIcons.square_grid_2x2,
          ),
          const PullDownMenuDivider(),
          PullDownMenuItem.selectable(
            title: 'List',
            selected: false,
            onTap: () {},
            icon: CupertinoIcons.list_bullet,
          ),
          const PullDownMenuDivider.large(),
          PullDownMenuActionsRow.medium(
            items: [
              PullDownMenuItem(
                enabled: false,
                onTap: () {},
                title: 'Inbox',
                icon: CupertinoIcons.tray_arrow_down,
              ),
              PullDownMenuItem(
                onTap: () {},
                title: 'Archive',
                icon: CupertinoIcons.archivebox,
              ),
              PullDownMenuItem(
                onTap: () {},
                title: 'Trash',
                isDestructive: true,
                icon: CupertinoIcons.delete,
              ),
            ],
          ),
        ],
        itemsOrder: itemsOrder,
        applyOpacity: applyOpacity,
        position: position,
        buttonBuilder: builder,
      );
}

// Eyeballed message box from iMessage
@immutable
class _MessageExample extends StatelessWidget {
  const _MessageExample({
    required this.isSender,
  });

  final bool isSender;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 267,
        child: Material(
          color: isSender
              ? CupertinoColors.systemBlue.resolveFrom(context)
              : CupertinoColors.systemFill.resolveFrom(context),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Text(
              isSender
                  ? 'How’s next Tuesday? Can’t wait to see you! 🤗'
                  : 'Let’s get lunch! When works for you? 😋',
              style: TextStyle(
                fontSize: 17,
                height: 22 / 17,
                letterSpacing: -0.41,
                fontFamily: '.SF Pro Text',
                color: isSender
                    ? CupertinoColors.label.darkColor
                    : CupertinoColors.label.resolveFrom(context),
              ),
            ),
          ),
        ),
      );
}
