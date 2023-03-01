import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palestine/button.dart';

import 'colorhelper.dart';
import 'custom_textfield.dart';
import 'widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String countryName = '';
  String countryFlag = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset('assets/images/2.png'),
        ),
        const SizedBox(height: 85),
        Container(width: 275, height: 51, color: Colors.black),
        const SizedBox(height: 78),
        //if email
        // CustomTextFormField(
        //   hintText: 'Email',
        // ),

        //if email and country
        CustomTextFormField(hintText: 'Name'),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () {
            //TODO: SHOW THE DROPMENU
            showCountryPicker(
              context: context,
              showPhoneCode:
                  true, // optional. Shows phone code before the country name.
              onSelect: (Country country) {
                countryName = country.displayNameNoCountryCode;
                countryFlag = country.flagEmoji;
                setState(() {});
              },
            );
          },
          child: Container(
            width: 296,
            height: 44,
            decoration: buildBorderStyle(),
            child: Row(
              children: [
                const SizedBox(
                  width: 13,
                ),
                Text(countryFlag),
                countryName.isEmpty
                    ? const Text('Country Name',
                        style: TextStyle(
                            color: ColorHelper.black33, fontSize: 18.0))
                    : Text(countryName, style: const TextStyle(fontSize: 18))
              ],
            ),
          ),
        ),

        const SizedBox(
          height: 12,
        ),
        CustomTextFormField(hintText: 'Email'),
        const SizedBox(
          height: 24,
        ),
        CustomElevatedButton(
          btnName: 'login', //if email and country let's go instead of login
          onPressed: () {
            //TODO: LOGIN
          },
          width: 296,
          fontsize: 20,
        ),
        Expanded(
            child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextButton.icon(
            icon: const Icon(
              Icons.arrow_back,
              size: 19,
              color: ColorHelper.grey9F,
            ),
            onPressed: () {
              //TODO: What happens when I press the SKIP button
            },
            label: const Text(
              'Skip',
              style: TextStyle(color: ColorHelper.greyA0, fontSize: 16),
            ),
          ),
        ))
      ],
    ));
  }
}
