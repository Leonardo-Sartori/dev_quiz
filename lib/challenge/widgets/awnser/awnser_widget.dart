import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/models/awnser_model.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatelessWidget {
  final AwnserModel awnser;
  final bool isSelected;
  final bool disabled;
  final ValueChanged<bool> onTap;

  AwnserWidget(this.awnser, this.onTap, {this.isSelected = false, this.disabled = false});

  Color get _selectedColorRight {
    if (awnser.isRight == null) {
      awnser.isRight = false;
    }
    return awnser.isRight ? AppColors.darkGreen : AppColors.darkRed;
  }

  Color get _selectedBorderRight {
    if (awnser.isRight == null) {
      awnser.isRight = false;
    }
    return awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;
  }

  Color get _selectedColorCardRight {
    if (awnser.isRight == null) {
      awnser.isRight = false;
    }
    return awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;
  }

  Color get _selectedBorderCardRight {
    if (awnser.isRight == null) {
      awnser.isRight = false;
    }
    return awnser.isRight ? AppColors.green : AppColors.red;
  }

  TextStyle get _selectedTextStyleRight {
    if (awnser.isRight == null) {
      awnser.isRight = false;
    }
    return awnser.isRight
        ? AppTextStyles.bodyDarkGreen
        : AppTextStyles.bodyDarkRed;
  }

  IconData get _selectedIconRight {
    if (awnser.isRight == null) {
      awnser.isRight = false;
    }
    return awnser.isRight ? Icons.check : Icons.close;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: IgnorePointer(
        ignoring: disabled,
          child: GestureDetector(
          onTap: (){
            onTap(awnser.isRight);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected ? _selectedColorCardRight : AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(BorderSide(
                color: isSelected ? _selectedBorderCardRight : AppColors.white,
              )),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(awnser.title,
                        style: isSelected
                            ? _selectedTextStyleRight
                            : AppTextStyles.body)),
                Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        color: isSelected ? _selectedColorRight : AppColors.white,
                        borderRadius: BorderRadius.circular(500),
                        border: Border.fromBorderSide(BorderSide(
                            color: isSelected
                                ? _selectedBorderRight
                                : AppColors.white))),
                    child: isSelected
                        ? Icon(_selectedIconRight, size: 16, color: Colors.white)
                        : null)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
