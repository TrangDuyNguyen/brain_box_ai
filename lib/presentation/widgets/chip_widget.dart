import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/domain/entities/search/category_entity.dart';
import 'package:flutter/material.dart';

class ChipsHorizontalWidget extends StatelessWidget {
  final List<CategoryEntity> chipLabels;
  final Function(int) onChipSelected;
  final int selectedChipIndex;

  const ChipsHorizontalWidget(
      {super.key,
      required this.chipLabels,
      required this.onChipSelected,
      this.selectedChipIndex = 0});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        child: SizedBox(
          height: 36,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ChoiceChip(
                  label: Text(
                    chipLabels[index].name,
                    style: context.appTextStyles.labelLarge.copyWith(
                        color: selectedChipIndex == index
                            ? context.appColors.onPrimary
                            : context.appColors.primary),
                  ),
                  selected: selectedChipIndex == index,
                  onSelected: (selected) => onChipSelected(index),
                  backgroundColor: Colors.transparent,
                  selectedColor: context.appColors.primaryContainer,
                  showCheckmark: false,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Đặt border radius là 8
                    side: BorderSide(
                      color: context.appColors.primaryContainer, // Màu border
                    ),
                  ),
                  elevation: 0, // Remove shadow
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
              itemCount: chipLabels.length),
        ),
      ),
    );
  }
}
