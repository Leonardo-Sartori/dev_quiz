import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  ResultPage(this.title, this.length, this.result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  "Parabéns!",
                  style: AppTextStyles.heading40,
                ),
              ],
            ),
            SizedBox(height: 16),
            Text.rich(
              TextSpan(
                  text: "Você concluiu",
                  style: AppTextStyles.body,
                  children: [
                    TextSpan(
                        text: "\n$title",
                        style: AppTextStyles.bodyBold),
                    TextSpan(
                        text: "\ncom $result de $length acertos",
                        style: AppTextStyles.body),
                  ]),
              textAlign: TextAlign.center,
            ),
            Column(
              children: [
                Row(
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 68),
                  child: NextButtonWidget.purple("Compartilhar", () {
                    Share.share('DevQuiz NLW 5 - Flutter: Resultado do Quiz: $title\nObtive: ${result / length}% aproveitamento!');
                  }),
                )),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 68),
                  child: NextButtonWidget.white("Voltar ao início", () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                  }),
                )),
              ],
            ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
