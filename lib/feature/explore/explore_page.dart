import 'package:flutter/material.dart';
import 'package:nomad_hub/core/components/custom_text_field.dart';

import 'package:provider/provider.dart';

import 'package:nomad_hub/core/components/custom_text_widget.dart';
import 'package:nomad_hub/core/utils/app_colors.dart';
import 'package:nomad_hub/core/utils/app_sizedbox.dart';
import 'package:nomad_hub/feature/explore/provider/filter_provider.dart';
import 'package:nomad_hub/feature/explore/widget/filter_buttons.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  TextEditingController minSalaryController = TextEditingController();
  TextEditingController maxSalaryController = TextEditingController();
  List<String> dateType = ["Today", "Tomorrow"];
  String selectDate = '';
  TextEditingController jobSearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 38,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: jobSearchController,
                      isBorderEnabled: true,
                      hintText: "Search for job",
                      prefix: const Icon(
                        Icons.location_on_outlined,
                      ),
                    ),
                  ),
                  AppSizedBox.w12,
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
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
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showFilterBottomSheet(context);
          },
          elevation: 2,
          backgroundColor: AppColors.redButtonLightColor,
          child: const Icon(
            Icons.tune_outlined,
          ),
        ),
      ),
    );
  }

  showFilterBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      barrierColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        var state = Provider.of<FilterProvider>(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomText(
                      text: "Filter",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.clear_rounded,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                AppSizedBox.h16,
                const Row(
                  children: [
                    CustomText(
                      text: "Job type",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                AppSizedBox.h12,
                Consumer<FilterProvider>(builder: (context, state, _) {
                  return FilterButtons(
                      filterButtons: state.jobTypebuttons,
                      buttonType: "jobType");
                }),
                AppSizedBox.h16,
                const Row(
                  children: [
                    CustomText(
                      text: "Job Categories",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                AppSizedBox.h12,
                Consumer<FilterProvider>(builder: (context, state, _) {
                  return FilterButtons(
                      filterButtons: state.jobCategoryButtons,
                      buttonType: "jobCategories");
                }),
                AppSizedBox.h16,
                const Row(
                  children: [
                    CustomText(
                      text: "Salary Range",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                AppSizedBox.h12,
                Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                              text: "Min",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            AppSizedBox.h4,
                            Container(
                              constraints: const BoxConstraints(minWidth: 120),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color:
                                    AppColors.lightBlueColor.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: CustomText(
                                text:
                                    state.getMinSalaryRange.toStringAsFixed(0),
                                fontSize: 14,
                                color: AppColors.darkBlueBlack,
                              ),
                            ),
                          ],
                        ),
                        AppSizedBox.w16,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                              text: "Max",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            AppSizedBox.h4,
                            Container(
                              constraints: const BoxConstraints(minWidth: 120),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color:
                                    AppColors.lightBlueColor.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: CustomText(
                                text:
                                    state.getMaxSalaryRange.toStringAsFixed(0),
                                fontSize: 14,
                                color: AppColors.darkBlueBlack.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    AppSizedBox.h12,
                    RangeSlider(
                      values: state.getSalaryRangeValue,
                      min: 210,
                      max: 1600,
                      labels: RangeLabels(
                        state.salaryRangeValue.start.round().toString(),
                        state.salaryRangeValue.end.round().toString(),
                      ),
                      onChanged: (value) {
                        context.read<FilterProvider>().updateSalaryRange(value);
                      },
                    ),
                    AppSizedBox.h16,
                    const Row(
                      children: [
                        CustomText(
                          text: "Select Date",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    AppSizedBox.h12,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Row(
                            children: dateType
                                .map((e) => Expanded(child: radioTile(e)))
                                .toList(),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color:
                                  AppColors.calenderContainer.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.calendar_today_outlined,
                                size: 24,
                                color: AppColors.calenderIcon.withOpacity(0.7),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppSizedBox.h16,
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              side: BorderSide(
                                width: 1,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            onPressed: () {},
                            child: CustomText(
                              text: "Reset",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                        AppSizedBox.w12,
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: AppColors.buttonGradient),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {},
                              child: CustomText(
                                text: "Apply Filter",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget radioTile(String title,) {
    return RadioListTile(
        toggleable: false,
        contentPadding: const EdgeInsets.all(0),
        visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        title: Text(title),
        value: title,
        groupValue: selectDate,
        onChanged: (value) {
          setState(() {
            selectDate = value as String;
          });
        });
  }
}


   // Expanded(child: CustomTextField(controller: minSalaryController,hintText: "Minimimum",maxLines: 1,inputFormatter: [FilteringTextInputFormatter.digitsOnly],isLabelEnabled: true, isBorderEnabled: true,)),

   //  Expanded(child: CustomTextField(controller: maxSalaryController,hintText: "Maximum",maxLines: 1,inputFormatter: [FilteringTextInputFormatter.digitsOnly],isLabelEnabled: true, isBorderEnabled: true,)),