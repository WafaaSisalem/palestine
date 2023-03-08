import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomSheetEmail extends StatelessWidget {
  BottomSheetEmail({super.key});
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'Info@alawdah.eu',
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
              child: const Text("Open Mail App"),
              onPressed: () async {
                var result = await OpenMailApp.openMailApp();

                // If no mail apps found, show error
                if (!result.didOpen && !result.canOpen) {
                  if (context.mounted) showNoMailAppsDialog(context);
                } else if (!result.didOpen && result.canOpen) {
                  if (context.mounted) {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return MailAppPickerDialog(
                          mailApps: result.options,
                        );
                      },
                    );
                  }
                }
              },
            ),
            ElevatedButton(
                onPressed: () {
                  launchUrl(emailLaunchUri);
                },
                child: Text('contact us')),
            ElevatedButton(
                onPressed: () async {
                  String fbProtocolUrl;
                  if (Platform.isIOS) {
                    fbProtocolUrl = 'fb://profile/166328110149178';
                  } else {
                    fbProtocolUrl = 'fb://page/166328110149178';
                  }

                  String fallbackUrl =
                      'https://m.facebook.com/166328110149178/';

                  try {
                    bool launched =
                        await launch(fbProtocolUrl, forceSafariVC: false);

                    if (!launched) {
                      await launch(fallbackUrl, forceSafariVC: false);
                    }
                  } catch (e) {
                    await launch(fallbackUrl, forceSafariVC: false);
                  }
                },
                child: Text('Facebook'))
          ],
        )),
      ),
    );
  }

  // String? encodeQueryParameters(Map<String, String> params) {
  //   return params.entries
  //       .map((MapEntry<String, String> e) =>
  //           '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
  //       .join('&');
  // }

  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Open Mail App"),
          content: const Text("No mail apps installed"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}

// // Copyright 2013 The Flutter Authors. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.

// // ignore_for_file: public_member_api_docs

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:url_launcher/link.dart';
// import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'URL Launcher',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'URL Launcher'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   Future<void>? _launched;

//   Future<void> _launchInBrowser(Uri url) async {
//     if (!await launchUrl(
//       url,
//       mode: LaunchMode.externalApplication,
//     )) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   Future<void> _launchInWebViewOrVC(Uri url) async {
//     if (!await launchUrl(
//       url,
//       mode: LaunchMode.inAppWebView,
//       webViewConfiguration: const WebViewConfiguration(
//           headers: <String, String>{'my_header_key': 'my_header_value'}),
//     )) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   Future<void> _launchInWebViewWithoutJavaScript(Uri url) async {
//     if (!await launchUrl(
//       url,
//       mode: LaunchMode.inAppWebView,
//       webViewConfiguration: const WebViewConfiguration(enableJavaScript: false),
//     )) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   Future<void> _launchInWebViewWithoutDomStorage(Uri url) async {
//     if (!await launchUrl(
//       url,
//       mode: LaunchMode.inAppWebView,
//       webViewConfiguration: const WebViewConfiguration(enableDomStorage: false),
//     )) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   Future<void> _launchUniversalLinkIos(Uri url) async {
//     final bool nativeAppLaunchSucceeded = await launchUrl(
//       url,
//       mode: LaunchMode.externalNonBrowserApplication,
//     );
//     if (!nativeAppLaunchSucceeded) {
//       await launchUrl(
//         url,
//         mode: LaunchMode.inAppWebView,
//       );
//     }
//   }

//   Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
//     if (snapshot.hasError) {
//       return Text('Error: ${snapshot.error}');
//     } else {
//       return const Text('');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // onPressed calls using this URL are not gated on a 'canLaunch' check
//     // because the assumption is that every device can launch a web URL.
//     // https://www.facebook.com/PalestiniansInEuropeConferences/?mibextid=ZbWKwL
//     final Uri toLaunch =
//         Uri(scheme: 'https', path: 'm.facebook.com/166328110149178/');
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: ListView(
//         children: <Widget>[
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               ElevatedButton(
//                 onPressed: () => setState(() {
//                   _launched = _launchInBrowser(toLaunch);
//                 }),
//                 child: const Text('Launch in browser'),
//               ),
//               ElevatedButton(
//                 onPressed: () => setState(() {
//                   _launched = _launchUniversalLinkIos(toLaunch);
//                 }),
//                 child: const Text(
//                     'Launch a universal link in a native app, fallback to Safari.(Youtube)'),
//               ),
//               const Padding(padding: EdgeInsets.all(16.0)),
//               Link(
//                 uri: Uri.parse('https://m.facebook.com/166328110149178/'),
//                 target: LinkTarget.blank,
//                 builder: (BuildContext ctx, FollowLink? openLink) {
//                   return TextButton.icon(
//                     onPressed: openLink,
//                     label: const Text('Link Widget documentation'),
//                     icon: const Icon(Icons.read_more),
//                   );
//                 },
//               ),
//               const Padding(padding: EdgeInsets.all(16.0)),
//               FutureBuilder<void>(future: _launched, builder: _launchStatus),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
