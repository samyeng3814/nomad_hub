import 'package:flutter/material.dart';
import 'package:nomad_hub/core/components/custom_text_widget.dart';
import 'package:nomad_hub/core/navigation/navigation.dart';

import 'package:nomad_hub/core/utils/app_colors.dart';
import 'package:nomad_hub/feature/activity/provider/activity_provider.dart';
import 'package:nomad_hub/feature/activity/widget/activity_detail_card.dart';
import 'package:nomad_hub/feature/home_page/pages/job_description_page.dart';
import 'package:provider/provider.dart';

class TabbarButtons extends StatefulWidget {
  const TabbarButtons({super.key});

  @override
  State<TabbarButtons> createState() => _TabbarButtonsState();
}

class _TabbarButtonsState extends State<TabbarButtons>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: context.read<ActivityProvider>().activityButtons.length,
        vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ActivityProvider>(context);
    List<ScrollController> scrollControllers = List.generate(
        provider.activityButtons.length, (index) => ScrollController());
    return Column(
      children: [
        TabBar(
          tabAlignment: TabAlignment.start,
          controller: _tabController,
          isScrollable: true,
          dividerColor: Colors.transparent,
          indicator: BoxDecoration(
            gradient: AppColors.buttonGradient,
            borderRadius: BorderRadius.circular(50),
          ),
          labelPadding: EdgeInsets.zero,
          indicatorColor: Colors.transparent,
          indicatorPadding: EdgeInsets.zero,
          indicatorWeight: double.minPositive,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          tabs: provider.buttonTabs
              .map(
                (name) => Tab(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Align(
                      alignment: Alignment.center,
                      child: CustomText(text: name),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        Expanded(
          child: TabBarView( controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              provider.buttonTabs.length,
              (inX) => SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.activityStatusList.length,
                      controller: scrollControllers[inX],
                      itemBuilder: (context, index) {
                        return ActivityDetailCard(
                          onTap: () {
                            pushContext(context,
                                route: JobDescriptionPage(
                                  postedTime: provider
                                      .activityStatusList[index].postedTime,
                                  isSavedJob: provider
                                      .activityStatusList[index].isSavedJob,
                                  index: index,
                                  applicationStatus: provider
                                      .activityStatusList[index]
                                      .applicationStatus,
                                  companyLogo: provider
                                      .activityStatusList[index].companyLogo,
                                  companyName: provider
                                      .activityStatusList[index].companyName,
                                  date: provider.activityStatusList[index].date,
                                  jobDescribtion: provider
                                      .activityStatusList[index].jobDescribtion,
                                  jobType: provider
                                      .activityStatusList[index].workType,
                                  salaryRange: provider
                                      .activityStatusList[index].salaryRange,
                                  location: provider
                                      .activityStatusList[index].location,
                                  jobCategory: provider
                                      .activityStatusList[index].jobCategory,
                                ));
                          },
                          isSavedJob:
                              provider.activityStatusList[index].isSavedJob,
                          index: index,
                          applicationStatus: provider
                              .activityStatusList[index].applicationStatus,
                          companyLogo:
                              provider.activityStatusList[index].companyLogo,
                          companyName:
                              provider.activityStatusList[index].companyName,
                          date: provider.activityStatusList[index].date,
                          jobDescribtion:
                              provider.activityStatusList[index].jobDescribtion,
                          jobType: provider.activityStatusList[index].workType,
                          salaryRange:
                              provider.activityStatusList[index].salaryRange,
                          location: provider.activityStatusList[index].location,
                          jobCategory:
                              provider.activityStatusList[index].jobCategory,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SizedBox(
  //     height: MediaQuery.of(context).size.height * 0.045,
  //     child: ListView.builder(
  //       physics: const BouncingScrollPhysics(),
  //       shrinkWrap: true,
  //       scrollDirection: Axis.horizontal,
  //       itemCount: buttonName.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return GestureDetector(
  //           onTap: () {
  //             setState(() {
  //               current = index;
  //             });
  //           },
  //           child: AnimatedContainer(
  //             duration: const Duration(
  //               milliseconds: 300,
  //             ),
  //             child: Container(
  //               margin: const EdgeInsets.symmetric(
  //                 horizontal: 8,
  //               ),
  //               padding: const EdgeInsets.symmetric(horizontal: 16),
  //               decoration: BoxDecoration(
  //                 color:
  //                     current == index ? AppColors.primaryColor : Colors.white,
  //                 border: Border.all(
  //                   width: 1,
  //                   color: current == index
  //                       ? Colors.transparent
  //                       : Colors.black.withOpacity(0.3),
  //                 ),
  //                 borderRadius: BorderRadius.circular(20),
  //               ),
  //               child: Center(
  //                 child: CustomText(
  //                   text: buttonName[index],
  //                   fontSize: 12,
  //                   fontWeight: FontWeight.w600,
  //                   color: current == index ? Colors.white : Colors.black,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
}
