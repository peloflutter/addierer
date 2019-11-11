import 'package:flutter/material.dart';

class AddiererWidget extends StatefulWidget {
  AddiererWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddiererWidgetState createState() => _AddiererWidgetState();
}

class _AddiererWidgetState extends State<AddiererWidget> {
  String _firstOpd;
  String _secondOpd;
  String _result;

  TextEditingController _controller1;
  TextEditingController _controller2;

  @override
  void initState() {
    debugPrint('_AddiererWidgetState::initState');
    super.initState();

    _firstOpd = '';
    _secondOpd = '';
    _result = '';

    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
  }

  void _add() {
    debugPrint('_add: 1. Operand: $_firstOpd - 2. Operand: $_secondOpd');
    setState(() {
      _result = (double.parse(_firstOpd) + double.parse(_secondOpd)).toString();
    });
  }

  void _clear() {
    debugPrint('_clear');
    setState(() {
      _firstOpd = '';
      _secondOpd = '';
      _result = '';

      _controller1.text = '';
      _controller2.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('_AddiererWidgetState::build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                controller: _controller1,
                style: TextStyle(fontSize: 20),
                keyboardType: TextInputType.number,
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
                controller: _controller2,
                style: TextStyle(fontSize: 20),
                keyboardType: TextInputType.number,
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
                style: TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _result.toString(),
                style: TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text('Clear'),
                onPressed: () {
                  _clear();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller1.dispose();
    _controller2.dispose();
  }
}
