import 'package:flutter/material.dart';
import 'package:nomad_hub/core/components/custom_text_widget.dart';
import 'package:nomad_hub/core/navigation/navigation.dart';
import 'package:nomad_hub/core/utils/app_colors.dart';
import 'package:nomad_hub/core/utils/app_sizedbox.dart';
import 'package:nomad_hub/feature/home_page/widget/job_desc_common_column.dart';

class JobDescriptionPage extends StatefulWidget {
  final String companyLogo;
  final String companyName;
  final String jobDescribtion;
  final String salaryRange;
  final String jobType;
  final String date;
  final String applicationStatus;
  final String location;
  final String jobCategory;
  final int index;
  final bool isSavedJob;
  final String postedTime;
  const JobDescriptionPage({
    super.key,
    required this.applicationStatus,
    required this.companyLogo,
    required this.companyName,
    required this.date,
    required this.jobDescribtion,
    required this.jobType,
    required this.salaryRange,
    required this.location,
    required this.jobCategory,
    required this.index,
    required this.isSavedJob,
    required this.postedTime,
  });

  @override
  State<JobDescriptionPage> createState() => _JobDescriptionPageState();
}

class _JobDescriptionPageState extends State<JobDescriptionPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              popContext(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 24,
              color: AppColors.blackColor,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.ios_share_rounded,
                size: 24,
                color: AppColors.blackColor,
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(24).copyWith(top: 8, bottom: 14),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: AppColors.secondaryColor,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 68,
                            width: 68,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.whiteColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.8),
                                  offset: const Offset(-4.0, -4.0),
                                  blurRadius: 8.0,
                                ),
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(4.0, 4.0),
                                  blurRadius: 8.0,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Image.asset(
                                widget.companyLogo,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          AppSizedBox.h16,
                          CustomText(
                            text: widget.jobCategory,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          AppSizedBox.h4,
                          CustomText(
                            text: widget.companyName,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          AppSizedBox.h12,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.logoContainer,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: CustomText(
                                  text: widget.jobType,
                                  fontSize: 12,
                                ),
                              ),
                              AppSizedBox.w6,
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.logoContainer,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: CustomText(
                                  text: widget.postedTime,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      jobDescCommonWidget(
                        containerColor: AppColors.salaryContainer,
                        icon: Icons.account_balance_wallet_outlined,
                        iconColor: AppColors.salaryIcon,
                        title: "Salary",
                        type: widget.salaryRange,
                      ),
                      jobDescCommonWidget(
                        containerColor: AppColors.jobTypeContainer,
                        icon: Icons.business_center_outlined,
                        iconColor: AppColors.jobTypeIcon,
                        title: "Job Tpye",
                        type: widget.jobType,
                      ),
                      jobDescCommonWidget(
                        containerColor: AppColors.calenderContainer,
                        icon: Icons.calendar_today_outlined,
                        iconColor: AppColors.calenderIcon,
                        title: "Date",
                        type: widget.date,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  margin: const EdgeInsets.all(8),
                  child: TabBar(
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerHeight: 2,
                    labelPadding: const EdgeInsets.all(12),
                    tabs: const [
                      CustomText(
                        text: "Job Description",
                        fontSize: 14,
                      ),
                      CustomText(
                        text: "Company Details",
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 36,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Descriptions",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                                AppSizedBox.h8,
                                CustomText(
                                  fontSize: 12,
                                  text:
                                      "Define the job and identify the type of candidate they’d like to hire. Attract internal candidates and engage in effective succession planning. Recruit and hire suitable candidates. When job descriptions include salary ranges, HR can compare the salary proposed for a role against those offered by similar organizations in their industry. Up-to-date and accurate job descriptions can also help employers avoid unforeseen legal complications and employment claims down the line. Furthermore, job descriptions enable applicants to determine whether a job may be a good fit for them. Communicating duties and obligations is crucial if employers want new hires to fulfill work expectations. Candidates with disabilities, in particular, need to know the demands of a position so they can determine if the job could be suitable.",
                                ),
                              ],
                            ),
                          ),
                           AppSizedBox.h64,
                        ],
                      ),
                      ListView(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 36, vertical: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Company Details",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                                AppSizedBox.h8,
                                CustomText(
                                  fontSize: 12,
                                  text:
                                      "Define the job and identify the type of candidate they’d like to hire. Attract internal candidates and engage in effective succession planning. Recruit and hire suitable candidates. When job descriptions include salary ranges, HR can compare the salary proposed for a role against those offered by similar organizations in their industry. Up-to-date and accurate job descriptions can also help employers avoid unforeseen legal complications and employment claims down the line. Furthermore, job descriptions enable applicants to determine whether a job may be a good fit for them. Communicating duties and obligations is crucial if employers want new hires to fulfill work expectations. Candidates with disabilities, in particular, need to know the demands of a position so they can determine if the job could be suitable.",
                                ),
                              ],
                            ),
                          ),
                          AppSizedBox.h64,
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, ),
                child: Container(
                  color: AppColors.whiteColor.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.blueGrey,
                            width: 1,
                          ),
                          color: AppColors.logoContainer,
                        ),
                        child:  InkWell(
                          onTap: (){},
                          child:const Icon(
                            Icons.bookmark_outline_rounded,
                            size: 24,
                          ),
                        ),
                      ),
                      AppSizedBox.w8,
                      Expanded(
                        child: Container(
                          height: 38,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          gradient: AppColors.buttonGradient
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: CustomText(
                              text: "Apply Now",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
