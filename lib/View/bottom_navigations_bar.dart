import 'package:canwinn_project/View/services/Service_page.dart';
import 'package:canwinn_project/View/services/services_list.dart';
import 'package:canwinn_project/View/widgets/bottom_bar.dart';
import 'package:canwinn_project/ViewModel/Controller/bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:canwinn_project/View/dash_board/Dashboard.dart';
import 'package:canwinn_project/View/Offers_page.dart';
import 'package:canwinn_project/View/Profile_page.dart';

class BottomNavigationsBarScreens extends StatelessWidget {
  BottomNavigationsBarScreens({super.key});

  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> _screens = [
    Dashboard(),
    OffersScreen(),
    ServicesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: _screens,
        ),
        bottomNavigationBar: CustomBottomNavBarr(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
        ),
      ),
    );
  }
}
