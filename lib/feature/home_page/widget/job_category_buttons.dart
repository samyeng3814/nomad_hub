import 'package:flutter/material.dart';
import 'package:nomad_hub/core/utils/app_colors.dart';
import 'package:nomad_hub/feature/home_page/provider/home_page_provider.dart';
import 'package:provider/provider.dart';


  Widget jobCategoryButtons(BuildContext context) {
    var provider = Provider.of<HomePageProvider>(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.045,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: provider.buttonName.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              provider.getCurretValue(index);
            },
            child: AnimatedContainer(
              duration: const Duration(
                milliseconds: 300,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.04,
                margin: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color:
                       provider.current == index ? AppColors.primaryColor : Colors.white,
                  border: Border.all(
                    width: 1,
                    color:  provider.current == index
                        ? Colors.transparent
                        : Colors.black.withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    provider.buttonName[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color:  provider.current == index ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }



// Text(
//               buttonName[index],
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w700,
//                 color: Colors.black38,
//               ),
//             ),
