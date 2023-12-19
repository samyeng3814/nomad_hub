

class JobDetailsModel {
  final String companyLogo;
  final String companyName;
  final String jobDescribtion;
  final String salaryRange;
  final String workType;
final String   date;
final String   applicationStatus;
final String   location;
final String   jobCategory;
final bool     isSavedJob;
final String   postedTime;
JobDetailsModel({
  required this.applicationStatus,
  required this.companyLogo,
  required this.companyName,
  required this.date,
  required this.jobDescribtion,
  required this.workType,
  required this.salaryRange,
  required this.location,
  required this.jobCategory,
  required this.isSavedJob,
  required this.postedTime,
});
}