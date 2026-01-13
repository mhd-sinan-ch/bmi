import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: LoginPage()));
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController resultController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI')),
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 20),
        child: Column(
          children: [
            SizedBox(
              width: 150,
              child: TextField(
                controller: heightController,
                keyboardType:
                TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Height (cm)',
                ),
              ),
            ),

            SizedBox(height: 20),

            SizedBox(
              width: 150,
              child: TextField(
                controller: weightController,
                keyboardType:
                TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Weight (kg)',
                ),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (heightController.text.isEmpty ||
                    weightController.text.isEmpty) {
                  resultController.text = 'Enter values';
                  return;
                }

                double height =
                    double.parse(heightController.text) / 100;
                double weight =
                double.parse(weightController.text);

                double bmi = weight / (height * height);
                resultController.text = bmi.toStringAsFixed(2);
              },
              child: Text('Calculate'),
            ),

            SizedBox(height: 20),

            SizedBox(
              width: 150,
              child: TextField(
                controller: resultController,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'BMI Result',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
