import 'package:flutter/material.dart';

import 'package:nomad_hub/core/components/custom_text_widget.dart';
import 'package:nomad_hub/core/utils/app_colors.dart';
import 'package:nomad_hub/core/utils/app_sizedbox.dart';

class JobContentCard extends StatelessWidget {
  final String companyLogo;
  final String companyName;
  final String jobDescribtion;
  final String salaryRange;
  final String jobType;
  final String postedTime;
  final String applicationStatus;
  final String location;
  final String jobCategory;
  final int index;
  final bool isSavedJob;
  final Function()? onTap;

  const JobContentCard({
    super.key,
    required this.applicationStatus,
    required this.companyLogo,
    required this.companyName,
    required this.postedTime,
    required this.jobDescribtion,
    required this.jobType,
    required this.salaryRange,
    required this.location,
    required this.jobCategory,
    required this.index,
    required this.isSavedJob,
    required this.onTap,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                          color: AppColors.logoContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Image.asset(
                            companyLogo,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      AppSizedBox.w16,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: jobCategory,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          AppSizedBox.h4,
                          CustomText(
                            text: companyName,
                            fontSize: 14,
                          ),
                        ],
                      )
                    ],
                  ),
                  const Icon(
                    Icons.bookmark_outline_rounded,
                    size: 36,
                  ),
                ],
              ),
              AppSizedBox.h20,
              CustomText(
                text: jobDescribtion,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.start,
              ),
              AppSizedBox.h20,
              Row(
                children: [
                  const Icon(Icons.location_on_outlined),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: CustomText(
                      text: location,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              AppSizedBox.h20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: salaryRange,
                    fontSize: 14,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.logoContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CustomText(
                      text: jobType,
                      fontSize: 14,
                    ),
                  ),
                  CustomText(
                    text: postedTime,
                    fontSize: 14,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


//  surfaceTintColor: AppColors.whiteColor,
        
//         // margin: const EdgeInsets.all(16),
//         color: AppColors.whiteColor,
//         elevation: 1,