import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ViewModel/Controller/bottom_nav_controller.dart';
class CustomBottomNavBar extends StatelessWidget {
  final BottomNavController navController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
      currentIndex: navController.selectedIndex.value,
      onTap: navController.changeIndex,

      type: BottomNavigationBarType.fixed,
      backgroundColor: backGroundColor,
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home, color: Colors.purple),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_offer_outlined),
          label: 'Offers',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article_outlined),
          label: 'Services',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Account',
        ),
      ],
    ));
  }
}
