import 'package:easacc_task/constants.dart';
import 'package:easacc_task/view/web_view_load.dart';
import 'package:easacc_task/view/widgets/custom_button.dart';
import 'package:easacc_task/view/widgets/custom_text.dart';

import 'package:flutter/material.dart';

import 'access_network_devices.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Enter Your URL",
                    color: Colors.grey,
                  ),
                  TextField(
                    controller: textFieldController,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor,),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(height: 10,),
                  AccessNetworkDevicesComponent(),

                  CustomGeneralButton(
                    text: "Go",
                    onTap: () {
                      _goToWebSite(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _goToWebSite(BuildContext context) {
    String textToSend = textFieldController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WebViewLoad(
            url: textToSend,
          ),
        ));
  }
}
