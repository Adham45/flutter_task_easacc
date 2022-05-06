import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../core/view_model/auth_view_model.dart';
import '../core/view_model/control_view_model.dart';
import '../core/view_model/network_view_model.dart';


import 'auth/login_view.dart';
import 'widgets/custom_text.dart';

class ControlView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<AuthViewModel>().user == null
          ? LoginScreen()
          : Get.find<NetworkViewModel>().connectionStatus.value == 1 ||
          Get.find<NetworkViewModel>().connectionStatus.value == 2
          ? GetBuilder<ControlViewModel>(
        init: ControlViewModel(),
        builder: (controller) => Scaffold(
          body: controller.currentScreen,
          bottomNavigationBar: CustomBottomNavigationBar(),
        ),
      )
          : NoInternetConnection();
    });
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: GetBuilder<ControlViewModel>(
        builder: (controller) => BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          backgroundColor: Colors.grey.shade100,
          currentIndex: controller.navigatorIndex,
          onTap: (index) {
            controller.changeCurrentScreen(index);
          },
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                'assets/images/explore.png',
                fit: BoxFit.contain,
                height: 20,
                width: 20,
              ),
              activeIcon: CustomText(
                text: 'Settings',
                fontSize: 14,
                alignment: Alignment.center,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                'assets/images/person.png',
                fit: BoxFit.contain,
                height: 20,
                width: 20,
              ),
              activeIcon: CustomText(
                text: 'Company',
                fontSize: 14,
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 30,
            ),
            CustomText(
              text: 'Please check your internet connection..',
              fontSize: 14,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}