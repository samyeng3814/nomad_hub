import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nomad_hub/core/components/custom_text_widget.dart';
import 'package:nomad_hub/core/utils/app_colors.dart';
import 'package:nomad_hub/core/utils/app_sizedbox.dart';

class ActivityDetailCard extends StatelessWidget {
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

  const ActivityDetailCard({
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
  });

  getStatusTextColor(String status) {
    switch (status) {
      case "Pending":
        {
          return AppColors.pendingText;
        }
      case "Applied":
        {
          return AppColors.appliedText;
        }
      case "Approved":
        {
          return AppColors.approvedText;
        }
      case "Cancelled":
        {
          return AppColors.cancelledText;
        }
      default:
        {
          return AppColors.appliedText;
        }
    }
  }

  getStatusContainerColor(String status) {
    switch (status) {
      case "Pending":
        {
          return AppColors.pendingContainer;
        }
      case "Applied":
        {
          return AppColors.appliedContainer;
        }
      case "Approved":
        {
          return AppColors.approvedContainer;
        }
      case "Cancelled":
        {
          return AppColors.cancelledContainer;
        }
      default:
        {
          return AppColors.appliedContainer;
        }
    }
  }

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
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
                      CustomText(
                        text: companyName,
                        fontSize: 14,
                      )
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                    decoration: BoxDecoration(
                        color: getStatusContainerColor(applicationStatus),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: getStatusTextColor(applicationStatus)
                              .withOpacity(0.4),
                          width: 1,
                        )),
                    child: CustomText(
                        text: applicationStatus,
                        fontSize: 12,
                        color: getStatusTextColor(applicationStatus)),
                  ),
                ],
              ),
              AppSizedBox.h16,
              CustomText(
                text: jobCategory,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              AppSizedBox.h16,
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
              AppSizedBox.h16,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.logoContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CustomText(
                      text: jobType,
                      fontSize: 12,
                    ),
                  ),
                  CustomText(
                    text:
                        "Applied at ${DateFormat.MMMEd().format(DateFormat('dd/MM/yyyy').parse(date))}",
                    fontSize: 12,
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
