import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          // Use Center as layout has unconstrained width (loose constraints),
          // together with SizedBox to specify the max width (tight constraints)
          // See this thread for more info:
          // https://twitter.com/biz84/status/1445400059894542337
          child: Center(
            child: SizedBox(
              width: 300, // max allowed width
              child: CountdownAndRestart(),
            ),
          ),
        ),
      ),
    );
  }
}

/// Main demo UI (countdown + restart button)
class CountdownAndRestart extends StatefulWidget {
  const CountdownAndRestart({super.key});

  @override
  CountdownAndRestartState createState() => CountdownAndRestartState();
}

class CountdownAndRestartState extends State<CountdownAndRestart> with SingleTickerProviderStateMixin {
  static const maxWidth = 300.0;
  Duration _elapsed = Duration.zero;
  late final Ticker _ticker;
  final int totalTime = 10;
  int remainingTime = 10;
  double percent = 1.0;

  @override
  void initState() {
    _ticker = createTicker((elapsed) {
      setState(() {
        _elapsed = elapsed;
        percent = (10000 - _elapsed.inMilliseconds) / 10000;
        remainingTime = totalTime - _elapsed.inSeconds;
      });

      if (_elapsed.inSeconds >= 10) _ticker.stop();
    });
    _ticker.start();
    super.initState();
  }

  _restart() {
    _ticker.stop();
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: maxWidth,
              height: maxWidth,
              child: CircularProgressIndicator(
                strokeWidth: 25,
                value: percent,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
                backgroundColor: Colors.purple[300],
              ),
            ),
            Text(
              remainingTime.toString(),
              style: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 100,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: _restart,
          child: const Text(
            'Restart',
            style: TextStyle(fontSize: 32),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
