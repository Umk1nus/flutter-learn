import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Weather",
            style: TextStyle(color: Colors.black54),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          iconTheme: IconThemeData(color: Colors.blueAccent.shade700),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        Image.asset(
          'assets/images/bg.png',
          fit: BoxFit.cover,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _weatherDescription(),
                const Divider(),
                _temperature(),
                _temperatureForecast(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Column _weatherDescription() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(
        'Tuesday - Nov 22',
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        'Weather description',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: Colors.black38,
        ),
      ),
    ],
  );
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.wb_cloudy_outlined,
            color: Colors.cyanAccent[700],
          ),
        ],
      ),
      const SizedBox(
        width: 20.0,
      ),
      const Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('15, Clear', style: TextStyle(color: Colors.blueAccent))
            ],
          ),
          Row(
            children: <Widget>[
              Text('Yoshkar-Ola', style: TextStyle(color: Colors.blueAccent))
            ],
          ),
        ],
      ),
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
      spacing: 10.0,
      children: List.generate(7, (int intex) {
        return Chip(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.amberAccent),
            borderRadius: BorderRadius.circular(3.0),
          ),
          avatar: const Icon(
            Icons.wb_sunny,
            color: Colors.brown,
          ),
          label: Text(
            "${intex + 15}",
            style: const TextStyle(fontSize: 15.0),
          ),
        );
      }));
}

// class App extends StatefulWidget {
// @override
// State<StatefulWidget> createState() {
//   return _AppState();
// }
// }

// class _AppState extends State<App> {
//   bool _loading = false;
//   double _progressValue = 0.0;

//   @override
//   void initState() {
//     super.initState();
//   }

//   void _updateProgress() {
//     const sec = Duration(milliseconds: 100);
//     Timer.periodic(sec, (Timer t) {
//       setState(() {
//         _progressValue += 0.01;

//         if (_progressValue.toStringAsFixed(1) == '1.0') {
//           _loading = false;
//           t.cancel();
//           _progressValue = 0.0;
//           return;
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.blueAccent,
//         appBar: AppBar(
//           title: const Text("App"),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: Container(
//               decoration: _loading
//                   ? const BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage('assets/images/bg.png'),
//                           fit: BoxFit.fitHeight))
//                   : null,
//               padding: const EdgeInsets.all(16),
//               child: _loading
//                   ? Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         LinearProgressIndicator(value: _progressValue),
//                         Text('${(_progressValue * 100).round()}%',
//                             style: const TextStyle(
//                                 color: Colors.white, fontSize: 20)),
//                       ],
//                     )
//                   : const Text("Press button",
//                       style: TextStyle(color: Colors.white, fontSize: 20))),
//         ),
//         floatingActionButton: FloatingActionButton(
//             foregroundColor: Colors.pink,
//             onPressed: () => setState(() {
//                   _loading = !_loading;
//                   _updateProgress();
//                 }),
//             child: const Icon(Icons.cloud_download)),
//       ),
//     );
//   }
// }
