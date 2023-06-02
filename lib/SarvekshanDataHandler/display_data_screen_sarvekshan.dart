import 'package:flutter/material.dart';

import 'data_model.dart';


class DisplayDataScreen extends StatefulWidget {
  DataModel data;

  DisplayDataScreen(this.data, {super.key});

  @override
  _DisplayDataScreenState createState() => _DisplayDataScreenState();
}

class _DisplayDataScreenState extends State<DisplayDataScreen> {
  List<DataModel> dataList = [];

  @override
  void initState() {
    super.initState();
    dataList.add(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Data'),
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          final data = dataList[index];
          return Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(data.hhNumber, style: TextStyle(color: Colors.red),),
                    Text(data.fatherName),
                    Text(data.mohallaName),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    dataList.removeAt(index);
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
