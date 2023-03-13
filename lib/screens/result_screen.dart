import 'package:flutter/material.dart';

import '../models/record.dart';

class ResultPage extends StatelessWidget {
  final Record record;
  const ResultPage(this.record, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(
                'Your BMI is',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Text(
            record.bmi.toStringAsFixed(2),
            style: TextStyle(color: record.color, fontSize: 50),
          ),
          Text(
            record.result,
            style: TextStyle(color: record.color, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
