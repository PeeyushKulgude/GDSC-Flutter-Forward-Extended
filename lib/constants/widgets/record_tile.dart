import 'package:flutter/material.dart';

import '../../models/record.dart';

class RecordTile extends StatelessWidget {
  final Record record;
  const RecordTile(this.record, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: double.infinity,
        width: 50,
        child: Center(
          child: Icon(
            Icons.person,
            color: record.color,
          ),
        ),
      ),
      title: Text(
        record.result,
        style: TextStyle(color: record.color),
      ),
      subtitle: Text(
        'Weight: ${record.weight} kg, Height: ${record.height} m',
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('BMI', style: TextStyle(color: Color(0xff404040))),
          Text(
            record.bmi.toStringAsFixed(2),
            style: TextStyle(color: record.color),
          ),
        ],
      ),
    );
  }
}
