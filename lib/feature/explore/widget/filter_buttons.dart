import 'package:flutter/material.dart';
import 'package:nomad_hub/core/utils/app_colors.dart';
import 'package:nomad_hub/feature/explore/provider/filter_provider.dart';
import 'package:provider/provider.dart';

class FilterButtons extends StatefulWidget {
  final List filterButtons;
  final String buttonType;
  const FilterButtons(
      {super.key, required this.filterButtons, required this.buttonType});

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FilterProvider>(context, listen: false);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.045,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.filterButtons.length,
        itemBuilder: (context,  index) {
          return GestureDetector(
            onTap: () {
                provider.getJobFilterButtons(widget.buttonType, index);
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
                
                  color:  provider.getJobTypeCurrentIndex == index
                      ? AppColors.lightBlueColor: Colors.white,
                  border: Border.all(
                    width: 1,
                    color:
                            provider.getJobTypeCurrentIndex == index
                        ? Colors.transparent
                        : Colors.black.withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    widget.filterButtons[index],
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
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
}
