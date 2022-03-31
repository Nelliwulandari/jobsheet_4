import 'package:flutter/material.dart';
import 'package:jobsheet_4/method/history.dart';
import 'package:jobsheet_4/method/results.dart';
import 'package:jobsheet_4/layout/color_pallete.dart';
import 'package:jobsheet_4/method/convert.dart';
import 'package:jobsheet_4/method/dropdown.dart';
import 'package:jobsheet_4/method/inputs.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _inputUser = 0;
  final inputController = TextEditingController();
  String _newValue = "Kelvin";
  double _result = 0;
  var listItem = ["Kelvin", "Reamur", "Fahrenheit"];
  List listViewItem = [];

  onDropdownChange(newValue) {
    setState(() {
      _newValue = newValue;
      perhitunganSuhu();
    });
  }

  void perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Kelvin") {
        _result = _inputUser + 273;
        listViewItem.add('Kelvin : $_result');
      } else if (_newValue == "Reamur") {
        _result = (4 / 5) * _inputUser;
        listViewItem.add('Reamur : $_result');
      } else {
        _result = (9 / 5) * _inputUser + 32;
        listViewItem.add('Fahrenheit : $_result');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nelli Wulandari\n2031710069'),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(children: [
          Inputs(inputController: inputController),
          Dropdown(
              newValue: _newValue,
              onDropdownChange: onDropdownChange,
              listItem: listItem),
          Results(result: _result),
          Convert(perhitunganSuhu: perhitunganSuhu),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              "Riwayat Konversi",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: History(listViewItem: listViewItem),
          ),
        ]),
      ),
    );
  }
}