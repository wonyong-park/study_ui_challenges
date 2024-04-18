import 'dart:math';

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
  // 카운트 다운 총 시간
  static const int timeoutInSeconds = 10;
  // 경과 시간
  Duration _elapsed = Duration.zero;

  late final Ticker _ticker;

  // 남은 시간
  // int remainingTime = 10;
  int get remainingTime => max(0, timeoutInSeconds - _elapsed.inSeconds);

  // 남은 퍼센트
  // double percent = 1.0;
  double get percent => _elapsed.inMilliseconds / (1000 * timeoutInSeconds.toDouble());


  @override
  void initState() {
    _ticker = createTicker((elapsed) {
      setState(() {
        _elapsed = elapsed;
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
        CountdownRender(
          percent: percent,
          remainingTime: remainingTime,
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

class CountdownRender extends StatelessWidget {
  final int remainingTime;
  final double percent;

  const CountdownRender({
    super.key,
    required this.remainingTime,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final strokeWidth = constraints.maxWidth / 15;
              return AspectRatio(
                aspectRatio: 1.0,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(pi),
                  child: CircularProgressIndicator(
                    strokeWidth: strokeWidth,
                    value: percent,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
                    backgroundColor: Colors.purple[300],
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              remainingTime.toString(),
              style: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

