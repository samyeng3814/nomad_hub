import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  int? jobTypeCurrentIndex =0;
  int? jobCategoryCurrentIndex=0;

  List jobTypebuttons = [
    "Fulltime",
    "Part time",
    "Contract",
    "Daily",
    "Monthly",
  ];

  List jobCategoryButtons = [
    "PLUMBER",
    "WELDER",
    "PIPEFITTER",
    "ASSEMBLER",
    "FIELD INSTALLER",
    "SHEET METAL WORKER",
  ];

  List dateFilterList=[
    "Pick Date",
    "Today",
    "Tommorrow",
    "Select Range",
  ];

  double minSalaryRange = 260;
  double maxSalaryRange = 1600;
  RangeValues salaryRangeValue = const RangeValues(260, 1600);

  int get getJobTypeCurrentIndex => jobTypeCurrentIndex!;
  int get getJobCategoryCurrentIndex => jobCategoryCurrentIndex!;
  List get getJobTypeButtons => jobTypebuttons;
  List get getJobCategoryButtons => jobCategoryButtons;
  double get getMinSalaryRange => minSalaryRange;
  double get getMaxSalaryRange => maxSalaryRange;
  List get getDateFilterList => dateFilterList;

  RangeValues get getSalaryRangeValue => salaryRangeValue;

  void updateSalaryRange(RangeValues values) {
    salaryRangeValue = values;
    minSalaryRange = values.start;
    maxSalaryRange = values.end;
    notifyListeners();
  }

  getJobFilterButtons(String type, int index) {
    switch (type) {
      case "jobType":
        jobTypeCurrentIndex = index;
        break;
      case "jobCategories":
        jobCategoryCurrentIndex = index;
        break;
        default:
    }
    notifyListeners();
  }

//   getJobTypeCurrentIndexValue(int index){
// jobTypeCurrentIndex = index;
// notifyListeners();
//   }
//   getJobCategoryIndexValue(int index){
// jobCategoryCurrentIndex = index;
// notifyListeners();
//   }
}
