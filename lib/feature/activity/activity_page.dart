import 'package:flutter/material.dart';
import 'package:nomad_hub/core/components/custom_text_widget.dart';
import 'package:nomad_hub/core/navigation/navigation.dart';
import 'package:nomad_hub/feature/activity/provider/activity_provider.dart';
import 'package:nomad_hub/feature/activity/widget/saved_job_detail_card.dart';
import 'package:nomad_hub/feature/activity/widget/status_buttons.dart';
import 'package:nomad_hub/feature/home_page/pages/job_description_page.dart';
import 'package:provider/provider.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ActivityProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: const CustomText(
            text: "Activity",
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          bottom: TabBar(
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerHeight: 2,
            labelPadding: const EdgeInsets.all(12),
            tabs: const [
              CustomText(
                text: "Applied",
                fontSize: 14,
              ),
              CustomText(
                text: "Saved",
                fontSize: 14,
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: TabbarButtons(),
            ),
            ListView(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.activityStatusList.length,
                  itemBuilder: (context, index) {
                    return SavedJobDetailCard(
                      onTap: () {
                        pushContext(context,
                            route: JobDescriptionPage(
                              postedTime:
                                  provider.activityStatusList[index].postedTime,
                              isSavedJob:
                                  provider.activityStatusList[index].isSavedJob,
                              index: index,
                              applicationStatus: provider
                                  .activityStatusList[index].applicationStatus,
                              companyLogo: provider
                                  .activityStatusList[index].companyLogo,
                              companyName: provider
                                  .activityStatusList[index].companyName,
                              date: provider.activityStatusList[index].date,
                              jobDescribtion: provider
                                  .activityStatusList[index].jobDescribtion,
                              jobType:
                                  provider.activityStatusList[index].workType,
                              salaryRange: provider
                                  .activityStatusList[index].salaryRange,
                              location:
                                  provider.activityStatusList[index].location,
                              jobCategory: provider
                                  .activityStatusList[index].jobCategory,
                            ));
                      },
                      postedTime: provider.activityStatusList[index].postedTime,
                      isSavedJob: provider.activityStatusList[index].isSavedJob,
                      index: index,
                      applicationStatus:
                          provider.activityStatusList[index].applicationStatus,
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
          ],
        ),
      ),
    );
  }
}
