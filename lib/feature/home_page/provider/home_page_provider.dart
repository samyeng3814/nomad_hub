import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nomad_hub/feature/home_page/model/job_details_model.dart';

class HomePageProvider extends ChangeNotifier {
  int current = 0;
  List buttonName = [
    "All",
    "PLUMBER",
    "WELDER",
    "PIPEFITTER",
    "ASSEMBLER",
    "FIELD INSTALLER",
    "SHEET METAL WORKER",
    "MORE",
  ];

  List<JobDetailsModel> jobDetailsList = [
    JobDetailsModel(
      companyLogo: ("assets/images/figma.png"),
      companyName: "Figma Pro",
      date: "12/12/2023",
      applicationStatus: "Pending",
      jobDescribtion: "Job Describtion ------",
      workType: "Fulltime",
      salaryRange: "\u{20B9} 500-600",
      location: "Bengalure, karnataka",
      jobCategory: "Welder",
      isSavedJob: false,
      postedTime: "Today",
    ),
    JobDetailsModel(
      companyLogo: ("assets/images/dribbble.png"),
      companyName: "Dribbble",
      date: "12/12/2023",
      applicationStatus: "Pending",
      jobDescribtion: "Job Describtion ------",
      workType: "Part time",
      salaryRange: "\u{20B9} 500-600",
      location: "Bengalure, karnataka",
      jobCategory: "Field Installer",
      isSavedJob: false,
      postedTime: "Two days ago",
    ),
    JobDetailsModel(
      companyLogo: ("assets/images/paypal.png"),
      companyName: "Paypal",
      date: "12/12/2023",
      applicationStatus: "Pending",
      jobDescribtion: "Job Describtion ------",
      workType: "Contract",
      salaryRange: "\u{20B9} 500-600",
      location: "Bengalure, karnataka",
      jobCategory: "Sheet metal worker",
      isSavedJob: false,
      postedTime: "Today",
    ),
    JobDetailsModel(
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
    ),
    JobDetailsModel(
      companyLogo: ("assets/images/youtube.png"),
      companyName: "YouTube",
      date: "12/12/2023",
      applicationStatus: "Pending",
      jobDescribtion: "Job Describtion ------",
      workType: "Part time",
      salaryRange: "\u{20B9} 500-600",
      location: "Bengalure, karnataka",
      jobCategory: "Pipefitter",
      isSavedJob: false,
      postedTime: "Today",
    ),
    JobDetailsModel(
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
    ),
  ];

  int get currentValue => current;
  List get getTabbuttons => buttonName;

  getCurretValue(int val) {
    current = val;
    notifyListeners();
  }
}
