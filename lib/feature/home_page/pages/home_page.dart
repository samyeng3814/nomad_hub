import 'package:flutter/material.dart';
import 'package:nomad_hub/core/components/custom_text_field.dart';
import 'package:nomad_hub/core/components/custom_text_widget.dart';
import 'package:nomad_hub/core/navigation/navigation.dart';
import 'package:nomad_hub/core/utils/app_colors.dart';
import 'package:nomad_hub/core/utils/app_sizedbox.dart';
import 'package:nomad_hub/feature/home_page/pages/job_description_page.dart';
import 'package:nomad_hub/feature/home_page/provider/home_page_provider.dart';
import 'package:nomad_hub/feature/home_page/widget/job_content_card.dart';
import 'package:nomad_hub/feature/home_page/widget/sliver_persistent_header_delegate.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  double height = 206;
  bool lastStatus = true;

  bool get _isShrink {
    return _scrollController.hasClients && _scrollController.offset > (96);
  }

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = _scrollController..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomePageProvider>(context);
    List<ScrollController> scrollControllers = List.generate(
        provider.buttonName.length, (index) => ScrollController());

    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: provider.buttonName.length,
          child: NestedScrollView(
            headerSliverBuilder: (context, inneBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  snap: false,
                  floating: false,
                  automaticallyImplyLeading: false,
                  centerTitle: false,
                  expandedHeight: 206,
                  title: inneBoxIsScrolled == true
                      ? SizedBox(
                          height: 38,
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  controller: searchController,
                                  isBorderEnabled: true,
                                  hintText: "Search for job",
                                ),
                              ),
                              AppSizedBox.w12,
                              Container(
                                height: 38,
                                width: 38,
                                // padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AppColors.redButtonLightColor,
                                ),
                                child: const Icon(
                                  Icons.search_outlined,
                                ),
                              ),
                            ],
                          ),
                        )
                      : null,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    centerTitle: false,
                    background: SafeArea(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 48,
                                          width: 48,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: AppColors.lightBlueColor,
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Image.asset(
                                              "assets/images/man-avatar.png",
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        AppSizedBox.w12,
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomText(
                                              text: "Hi, ",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            // AppSizedBox.h4,
                                            CustomText(
                                              text: "Iron Man",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Badge(
                                      backgroundColor: AppColors.redButtonColor,
                                      offset: const Offset(-2, 1),
                                      label: const CustomText(text: "2"),
                                      child: IconButton(
                                        padding: const EdgeInsets.all(0),
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.notifications_none_rounded,
                                          size: 32,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                AppSizedBox.h24,
                                const Row(
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 6.0),
                                      child: CustomText(
                                        text: "Bengalure, karnataka",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Icon(Icons.keyboard_arrow_down_rounded)
                                  ],
                                ),
                                AppSizedBox.h24,
                                SizedBox(
                                  height: 38,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: CustomTextField(
                                          controller: searchController,
                                          isBorderEnabled: true,
                                          hintText: "Search for job",
                                        ),
                                      ),
                                      AppSizedBox.w12,
                                      Container(
                                        height: 38,
                                        width: 38,
                                        // padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: AppColors.redButtonLightColor,
                                        ),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.search_outlined,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    stretchModes: const [StretchMode.zoomBackground],
                  ),
                ),
                SliverPersistentHeader(
                  floating: true,
                  pinned: true,
                  delegate: MySliverPersistentHeaderDelegate(
                    TabBar(
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                        gradient: AppColors.buttonGradient,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      labelPadding: EdgeInsets.zero,
                      indicatorColor: Colors.transparent,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: provider.buttonName
                          .map((name) => Tab(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 26),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: CustomText(text: name),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                provider.buttonName.length,
                (inX) => SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: provider.jobDetailsList.length,
                        controller: scrollControllers[inX],
                        itemBuilder: (context, index) {
                          return JobContentCard(
                            onTap: () {
                              pushContext(context,
                                  route: JobDescriptionPage(
                                    postedTime: provider
                                        .jobDetailsList[index].postedTime,
                                    isSavedJob: provider
                                        .jobDetailsList[index].isSavedJob,
                                    index: index,
                                    applicationStatus: provider
                                        .jobDetailsList[index]
                                        .applicationStatus,
                                    companyLogo: provider
                                        .jobDetailsList[index].companyLogo,
                                    companyName: provider
                                        .jobDetailsList[index].companyName,
                                    date: provider.jobDetailsList[index].date,
                                    jobDescribtion: provider
                                        .jobDetailsList[index].jobDescribtion,
                                    jobType:
                                        provider.jobDetailsList[index].workType,
                                    salaryRange: provider
                                        .jobDetailsList[index].salaryRange,
                                    location:
                                        provider.jobDetailsList[index].location,
                                    jobCategory: provider
                                        .jobDetailsList[index].jobCategory,
                                  ));
                            },
                            isSavedJob:
                                provider.jobDetailsList[index].isSavedJob,
                            index: index,
                            applicationStatus: provider
                                .jobDetailsList[index].applicationStatus,
                            companyLogo:
                                provider.jobDetailsList[index].companyLogo,
                            companyName:
                                provider.jobDetailsList[index].companyName,
                            postedTime: provider.jobDetailsList[index].postedTime,
                            jobDescribtion:
                                provider.jobDetailsList[index].jobDescribtion,
                            jobType: provider.jobDetailsList[index].workType,
                            salaryRange:
                                provider.jobDetailsList[index].salaryRange,
                            location: provider.jobDetailsList[index].location,
                            jobCategory:
                                provider.jobDetailsList[index].jobCategory,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
