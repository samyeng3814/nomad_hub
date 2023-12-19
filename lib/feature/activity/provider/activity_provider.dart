import 'package:flutter/material.dart';
import 'package:nomad_hub/feature/activity/model/activity_details_model.dart';

class ActivityProvider extends ChangeNotifier {
  int current = 0;
  List activityButtons = [
    "All Status",
    "Applied",
    "Approved",
    "Pending",
    "Cancelled",
  ];

  List<ActivityDetailsModel> activityStatusList = [
    ActivityDetailsModel(
      companyLogo: ("assets/images/figma.png"),
      companyName: "Figma Pro",
      date: "12/12/2023",
      applicationStatus: "Applied",
      jobDescribtion: "Job Describtion ------",
      workType: "Fulltime",
      salaryRange: "\u{20B9} 500-600",
      location: "Bengalure, karnataka",
      jobCategory: "Welder",
      isSavedJob: false,
      postedTime: "Today",
      appliedDate: "11//12/2020",
    ),
    ActivityDetailsModel(
      companyLogo: ("assets/images/dribbble.png"),
      companyName: "Dribbble",
      date: "12/12/2023",
      applicationStatus: "Approved",
      jobDescribtion: "Job Describtion ------",
      workType: "Part time",
      salaryRange: "\u{20B9} 500-600",
      location: "Bengalure, karnataka",
      jobCategory: "Field Installer",
      isSavedJob: false,
      postedTime: "Two days ago",
      appliedDate: "11//12/2020",
    ),
    ActivityDetailsModel(
      companyLogo: ("assets/images/paypal.png"),
      companyName: "Paypal",
      date: "12/12/2023",
      applicationStatus: "Cancelled",
      jobDescribtion: "Job Describtion ------",
      workType: "Contract",
      salaryRange: "\u{20B9} 500-600",
      location: "Bengalure, karnataka",
      jobCategory: "Sheet metal worker",
      isSavedJob: false,
      postedTime: "Today",
      appliedDate: "11//12/2020",
    ),
    ActivityDetailsModel(
      companyLogo: ("assets/images/spotify.png"),
      companyName: "Spotify",
      date: "12/12/2023",
      applicationStatus: "Pending",
      jobDescribtion: "Job Describtion ------",
      workType: "Contract",
      salaryRange: "\u{20B9} 500-600",
      location: "Bengalure, karnataka",
      jobCategory: "Welder",
      isSavedJob: false,
      postedTime: "Three days ago",
      appliedDate: "11//12/2020",
    ),
    ActivityDetailsModel(
      companyLogo: ("assets/images/youtube.png"),
      companyName: "YouTube",
      date: "12/12/2023",
      applicationStatus: "Applied",
      jobDescribtion: "Job Describtion ------",
      workType: "Part time",
      salaryRange: "\u{20B9} 500-600",
      location: "Bengalure, karnataka",
      jobCategory: "Pipefitter",
      isSavedJob: false,
      postedTime: "Today",
      appliedDate: "11//12/2020",
    ),
    ActivityDetailsModel(
      companyLogo: ("assets/images/photoshop-lightroom.png"),
      companyName: "Adobe",
      date: "12/12/2023",
      applicationStatus: "Pending",
      jobDescribtion: "Job Describtion ------",
      workType: "Fulltime",
      salaryRange: "\u{20B9} 500-600",
      location: "Bengalure, karnataka",
      jobCategory: "Plumber",
      isSavedJob: false,
      postedTime: "Today",
      appliedDate: "11//12/2020",
    ),
    ActivityDetailsModel(
      companyLogo: ("assets/images/youtube.png"),
      companyName: "YouTube",
      date: "12/12/2023",
      applicationStatus: "Cancelled",
      jobDescribtion: "Job Describtion ------",
      workType: "Part time",
      salaryRange: "\u{20B9} 500-600",
      location: "Bengalure, karnataka",
      jobCategory: "Pipefitter",
      isSavedJob: false,
      postedTime: "Today",
      appliedDate: "11//12/2020",
    ),
     ActivityDetailsModel(
      companyLogo: ("assets/images/spotify.png"),
      companyName: "Spotify",
      date: "12/12/2023",
      applicationStatus: "Approved",
      jobDescribtion: "Job Describtion ------",
      workType: "Contract",
      salaryRange: "\u{20B9} 500-600",
      location: "Bengalure, karnataka",
      jobCategory: "Welder",
      isSavedJob: false,
      postedTime: "Three days ago",
      appliedDate: "11//12/2020",
    ),
    
  ];

  int get currentIndex => current;
  List get buttonTabs => activityButtons;

  getCurretValue(int val) {
    current = val;
    notifyListeners();
  }
}
