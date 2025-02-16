import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/view/screens/bookings/bookings_screen.dart';
import 'package:cradenthealth/view/screens/categories_screens.dart';
import 'package:cradenthealth/view/screens/drawer_screens/drawer_screen.dart';
import 'package:cradenthealth/view/screens/home/home_screen.dart';
import 'package:cradenthealth/view/screens/steps/steps_screen.dart';
import 'package:cradenthealth/view_model/ui_controllers/app_bottom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppBottomNavigation extends StatefulWidget {
  const AppBottomNavigation({super.key});

  @override
  _AppBottomNavigationState createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  // int _selectedIndex = 0;

  // List of screens for each tab.
  final List<Widget> _pages = <Widget>[
    HomeScreen(),
    BookingsScreen(navigateBack: false),
    CategoriesScreens(
      navigateBack: false,
    ),
    // CategoriesScreens(),
    StepsScreen(navigateBack: false),
    DrawerScreen(navigateBack: false),
  ];
  final bottomNavigationController = Get.find<BottomNavigationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      body: Obx(() {
        return _pages[bottomNavigationController.selectedIndex.value];
      }), // Display the selected screen
      bottomNavigationBar: Obx(() {
        return BottomAppBar(
          // notchMargin: 10,
          elevation: 20,
          shadowColor: Colors.black,
          padding: EdgeInsets.zero,
          shape: CircularNotchedRectangle(),
          // clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            elevation: 3,

            backgroundColor: AppColors.whiteColor,
            type: BottomNavigationBarType.fixed, // Always show labels
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_outlined),
                label: 'Bookings',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category_outlined,
                  color: AppColors.whiteColor,
                ),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.directions_walk_outlined),
                label: 'Step Tracker',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),

              // BottomNavigationBarItem(
              //   icon: Image.asset(
              //     AppImages.walletImage, // Replace with your asset
              //     width: 24,
              //     height: 28, fit: BoxFit.cover,
              //   ),
              //   label: 'Wallet',
              // ),
              // BottomNavigationBarItem(
              //   icon: Image.asset(
              //     AppImages.profileIcon, // Replace with your asset
              //     width: 24,
              //     height: 24,
              //   ),
              //   label: 'Profile',
              // ),
            ],
            currentIndex: bottomNavigationController.selectedIndex.value,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.black,
            onTap: (value) {
              bottomNavigationController.updateSelectedIndex(value);
            }, // Change screen when an item is tapped
          ),
        );
      }),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(10),
        child: FloatingActionButton(
          hoverElevation: 10,
          backgroundColor: AppColors.whiteColor,
          tooltip: 'Search',
          shape: CircleBorder(),
          elevation: 4,
          child: Icon(
            Icons.add,
            size: 40,
            color: AppColors.blackColor,
          ),
          onPressed: () {
            bottomNavigationController.updateSelectedIndex(2);
            // showCustomBottomSheet(context);
          },
        ),
      ),
    );
  }
}
