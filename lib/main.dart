import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  bool _loading = false;
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
  }

  void _updateProgress() {
    const sec = const Duration(milliseconds: 100);
    Timer.periodic(sec, (Timer t) {
      setState(() {
        _progressValue += 0.01;

        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          t.cancel();
          _progressValue = 0.0;
          return;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: const Text("App"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
              decoration: _loading
                  ? const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/bg.png'),
                          fit: BoxFit.fitHeight))
                  : null,
              padding: const EdgeInsets.all(16),
              child: _loading
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        LinearProgressIndicator(value: _progressValue),
                        Text('${(_progressValue * 100).round()}%',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ],
                    )
                  : const Text("Press button",
                      style: TextStyle(color: Colors.white, fontSize: 20))),
        ),
        floatingActionButton: FloatingActionButton(
            foregroundColor: Colors.pink,
            onPressed: () => setState(() {
                  _loading = !_loading;
                  _updateProgress();
                }),
            child: const Icon(Icons.cloud_download)),
      ),
    );
  }
}
