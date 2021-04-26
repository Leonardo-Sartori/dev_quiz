import 'package:DevQuiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/models/awnser_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onChange;
  final ValueChanged<bool> onSelected;

  QuizWidget(this.question, this.onSelected, {this.onChange});

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AwnserModel awnser(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          Text(widget.question.title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          for (var i = 0; i < widget.question.awnsers.length; i++)
            AwnserWidget(
              awnser(i),
              (value){
                if(value == null) {
                  value = false;
                }
                indexSelected = i;
                setState(() {});
                Future.delayed(Duration(seconds: 1)).then((_) => widget.onSelected(value));

              },
              isSelected: indexSelected == i,
              disabled: indexSelected != -1,
            ),

          // ...question.awnsers.map((e) => AwnserWidget(
          //   e.title,
          //   isRight: e.isRight,
          // )).toList(),
        ],
      ),
    );
  }
}
