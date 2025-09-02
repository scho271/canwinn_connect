import 'package:canwinn_project/View/services/Service_page.dart';
import 'package:canwinn_project/View/services/services_list.dart';
import 'package:canwinn_project/View/widgets/bottom_bar.dart';
import 'package:canwinn_project/ViewModel/Controller/bottom_nav_controller.dart';
import 'package:canwinn_project/block/bottom_nav/block/bottom_nav_block.dart';
import 'package:canwinn_project/block/bottom_nav/block/bottom_nav_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:canwinn_project/View/dash_board/Dashboard.dart';
import 'package:canwinn_project/View/Offers_page.dart';
import 'package:canwinn_project/View/Profile_page.dart';

import '../block/bottom_nav/block/bottom_nav_events.dart';

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
    // return Obx(
    //   () => Scaffold(
    //     body: IndexedStack(
    //       index: controller.selectedIndex.value,
    //       children: _screens,
    //     ),
    //     bottomNavigationBar: CustomBottomNavBarr(
    //       currentIndex: controller.selectedIndex.value,
    //       onTap: controller.changeIndex,
    //     ),
    //   ),
    // );

    return BlocBuilder<BottomNavBlock, BottomNavStates>(
      builder: (context, state) {
        return Scaffold(
          body: _screens[state.selectIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: state.selectIndex,
            onTap: (index) {
              context.read<BottomNavBlock>().add(ChangeBottom(index));
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        );
      },
    );




  }
}
