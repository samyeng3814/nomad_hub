

import 'package:flutter/material.dart';
import 'package:nomad_hub/core/utils/app_colors.dart';
import 'package:nomad_hub/feature/chat_page/pages/chat_user_list_page.dart';
import 'package:nomad_hub/feature/explore/explore_page.dart';
import 'package:nomad_hub/feature/home_page/pages/home_page.dart';
import 'package:nomad_hub/feature/activity/activity_page.dart';
import 'package:nomad_hub/feature/profile/profile_page.dart';

class ScreenLayout extends StatefulWidget {
  static const String routeName = '/actual-home';
  const ScreenLayout({Key? key}) : super(key: key);

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  PageController pageController = PageController();
  int _page = 0;

  List<Widget> pages = [
    const HomePage(),
    const ActivityPage(),
    const ExplorePage(),
    const ChatUserListPage(),
    const ProfilePage(),
  ];

  void updatePage(int page) {
    pageController.jumpToPage(page);
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(
        child: Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: pages,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey[400]!, width: 1),
              ),
            ),
            child: TabBar(
              indicator: BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.primaryColor, width: 4),
                ),
              ),
              onTap: updatePage,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  child: Icon(
                    Icons.home_outlined,
                    color: _page == 0 ? AppColors.primaryColor : Colors.black,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.timeline_outlined,
                    color: _page == 1 ? AppColors.primaryColor : Colors.black,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.explore_outlined,
                    color: _page == 2 ? AppColors.primaryColor : Colors.black,
                  ),
                ),
                 Tab(
                  child: Icon(
                    Icons.chat_bubble_outline,
                    color: _page ==3 ? AppColors.primaryColor : Colors.black,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.account_circle_outlined,
                    color: _page == 4 ? AppColors.primaryColor : Colors.black,
                  ),
                ),
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}