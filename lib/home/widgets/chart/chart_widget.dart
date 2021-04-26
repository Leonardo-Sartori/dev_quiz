import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatefulWidget {
  final double percent;

  ChartWidget(this.percent);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animantion;

  void initAnimation() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animantion =
        Tween<double>(begin: 0.0, end: widget.percent).animate(_controller);
    _controller.forward();
  }

  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: 70,
        child: AnimatedBuilder(
          animation: _animantion,
          builder: (context, _) => Stack(
            children: [
              Center(
                child: Container(
                  height: 70,
                  width: 70,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: _animantion.value,
                    backgroundColor: AppColors.chartSecondary,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                  ),
                ),
              ),
              Center(child: Text("${(_animantion.value * 100).toInt()}%", style: AppTextStyles.heading))
            ],
          ),
        ));
  }
}
