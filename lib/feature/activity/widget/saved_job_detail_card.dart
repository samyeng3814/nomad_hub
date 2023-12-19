import 'package:flutter/material.dart';
import 'package:nomad_hub/core/components/custom_text_widget.dart';
import 'package:nomad_hub/core/utils/app_colors.dart';
import 'package:nomad_hub/core/utils/app_sizedbox.dart';

class SavedJobDetailCard extends StatelessWidget {
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
  final Function()? onTap;
  final String postedTime;

  const SavedJobDetailCard({
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
    required this.onTap,
    required this.postedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16).copyWith(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.redButtonColor.withOpacity(0.5),
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  color: AppColors.logoContainer,
                  borderRadius: BorderRadius.circular(44),
                ),
                child: Center(
                  child: Image.asset(
                    companyLogo,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              AppSizedBox.w16,
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: jobCategory,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            AppSizedBox.h8,
                            Row(
                              children: [
                                CustomText(
                                  text: companyName,
                                  fontSize: 14,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                ),
                                CustomText(
                                  text: jobType,
                                  fontSize: 12,color: AppColors.jobTypeIcon,
                                ),
                              ],
                            ),
                            AppSizedBox.h8,
                            CustomText(
                              text: salaryRange,
                              fontSize: 14,
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.bookmark_added_rounded,
                          size: 24,
                        ),
                      ],
                    ),
                    AppSizedBox.h8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.logoContainer,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.location_on_outlined,size: 14,),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                child: CustomText(
                                  text: location,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.logoContainer,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: CustomText(
                            text: postedTime,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
