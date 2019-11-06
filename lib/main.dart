import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddiererWidget(title: 'Flutter Simple Number Adder'),
    );
  }
}

class AddiererWidget extends StatefulWidget {
  AddiererWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddiererWidgetState createState() => _AddiererWidgetState();
}

class _AddiererWidgetState extends State<AddiererWidget> {
  bool isNumeric(String str) {
    try {
      double.parse(str);
    } catch (FormatException) {
      return false;
    }
    return true;
  }

  String _firstOpd;
  String _secondOpd;
  String _result;

  @override
  void initState() {
    debugPrint('_AddiererWidgetState::initState');
    super.initState();

    _firstOpd = '';
    _secondOpd = '';
    _result = '';
  }

  void _add() {
    debugPrint('_add: 1. Operand: $_firstOpd - 2. Operand: $_secondOpd');

    if (!isNumeric(_firstOpd) || !isNumeric(_secondOpd)) {
      _result = 'Wrong input !';
    } else {
      _result = (double.parse(_firstOpd) + double.parse(_secondOpd)).toString();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('_AddiererWidgetState::build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '1. Operand:',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
            child: TextField(
              
              style: TextStyle(fontSize: 20),
              onChanged: (String text) {
                _firstOpd = text;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '2. Operand:',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
            child: TextField(
              style: TextStyle(fontSize: 20),
              onChanged: (String text) {
                _secondOpd = text;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              child: Text('Add'),
              onPressed: () {
                _add();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
            child: Text(
              'Result:',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _result.toString(),
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
