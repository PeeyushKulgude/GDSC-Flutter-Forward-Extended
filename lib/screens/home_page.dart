import 'package:flutter/material.dart';

import '../constants/widgets/record_tile.dart';
import '../models/record.dart';
import 'result_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Record> records = [];
  final weightInputController = TextEditingController();
  final heightInputController = TextEditingController();

  void _addRecord() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Record'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(label: Text('Enter your weight')),
              controller: weightInputController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(label: Text('Enter your height')),
              controller: heightInputController,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              double w = double.parse(weightInputController.text);
              double h = double.parse(heightInputController.text);
              Record newRecord = Record(w, h);
              setState(() {
                records.add(newRecord);
                weightInputController.clear();
                heightInputController.clear();
              });
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(newRecord)));
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: records.isEmpty
          ? const Center(
              child: Text('No records'),
            )
          : ListView.builder(
              itemCount: records.length,
              itemBuilder: (context, index) {
                return RecordTile(records[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addRecord,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
