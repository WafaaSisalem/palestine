import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomSheetEmail extends StatelessWidget {
  BottomSheetEmail({super.key});
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'smith@example.com',
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
                child: Text('contact us'))
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
