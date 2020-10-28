import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Lean Body Mass'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Bmi(),
        ),
      ),
    );
  }
}

class Bmi extends StatefulWidget {
  @override
  BmiWidget createState() => BmiWidget();
}

class BmiWidget extends State {
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();

  double h = 0,
      w = 0,
      result1 = 0.0,
      result2 = 0,
      result3 = 0.0,
      result4 = 0,
      result5 = 0.0,
      result6 = 0;
  String radioButtonItem = 'First';
  int id = 1;
  int no = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(14.0),
        ),
        Row(
          children: <Widget>[
            Text(
              'Gender',
              style: new TextStyle(fontSize: 17.0),
            ),
            Radio(
              value: 1,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'First';
                  id = 1;
                });
              },
            ),
            Text(
              'Male',
              style: new TextStyle(fontSize: 17.0),
            ),
            Radio(
              value: 2,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'Second';
                  id = 2;
                });
              },
            ),
            Text(
              'Female',
              style: new TextStyle(
                fontSize: 17.0,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Text(
              'Age 14 or younger?',
              style: new TextStyle(fontSize: 17.0),
            ),
            Radio(
              value: 1,
              groupValue: no,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'Second';
                  no = 1;
                });
              },
            ),
            Text(
              'Yes',
              style: new TextStyle(fontSize: 17.0),
            ),
            Radio(
              value: 2,
              groupValue: no,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'Second';
                  no = 2;
                });
              },
            ),
            Text(
              'No',
              style: new TextStyle(
                fontSize: 17.0,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              hintText: "Height(cm)",
            ),
            keyboardType: TextInputType.numberWithOptions(),
            controller: _height,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              hintText: "Weight(kg)",
            ),
            keyboardType: TextInputType.numberWithOptions(),
            controller: _weight,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5),
              child: RaisedButton(
                child: Text("Calculate(Male)"),
                onPressed: _onPress1,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: RaisedButton(
                child: Text("Calculate(Female)"),
                onPressed: _onPress2,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: RaisedButton(
            child: Text("Clear"),
            onPressed: _clear,
          ),
        ),
        Text("Result"),
        Text("The lean body mass based on different formulas:"),
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(30),
          child: Table(
            border: TableBorder.all(color: Colors.black),
            children: [
              TableRow(children: [
                Text('Formula'),
                Text('Lean Body Mass'),
                Text('Body Fat'),
              ]),
              TableRow(children: [
                Text('Boer'),
                Text(result1.toStringAsFixed(1) + 'kg'),
                Text(result2.toStringAsFixed(0) + '%'),
              ]),
              TableRow(children: [
                Text('James'),
                Text(result3.toStringAsFixed(1) + 'kg'),
                Text(result4.toStringAsFixed(0) + '%'),
              ]),
              TableRow(children: [
                Text('Hume'),
                Text(result5.toStringAsFixed(1) + 'kg'),
                Text(result6.toStringAsFixed(0) + '%'),
              ])
            ],
          ),
        )
      ],
    );
  }

  void _onPress1() {
    setState(() {
      h = double.parse(_height.text);
      w = double.parse(_weight.text);

      result1 = 0.407 * w + 0.267 * h - 19.2;
      result2 = result1 / w * 100 - w;
      result3 = 1.1 * w - 128 * w / h * w / h;
      result4 = result3 / w * 100 - w;
      result5 = 0.32810 * w + 0.33929 * h - 29.5336;
      result6 = result5 / w * 100 - w;
    });
  }

  void _onPress2() {
    setState(() {
      h = double.parse(_height.text);
      w = double.parse(_weight.text);

      result1 = 0.252 * w + 0.473 * h - 48.3;
      result2 = result1 / w * 100 - w;
      result3 = 1.07 * w - 148 * w / h * w / h;
      result4 = result3 / w * 100 - w;
      result5 = 0.29569 * w + 0.41813 * h - 43.2933;
      result6 = result5 / w * 100 - w;
    });
  }

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }

  void _clear() {
    _height.clear();
    _weight.clear();
  }
}
