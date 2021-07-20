import 'package:flutter/material.dart';
import 'package:flutter_step_progress/widgets/progress_widget.dart';

import 'common/controllers/progress_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ProgressController controller1 = ProgressController();
  final ProgressController controller2 = ProgressController();
  final ProgressController controller3 = ProgressController();

  @override
  Widget build(BuildContext context) {
    final double progressWidth = 100.0;
    final double progressHeight = 80.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ha! another step progress!!!'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blueAccent,
            child: Row(
              children: [
                Container(
                  width: progressWidth,
                  height: progressHeight,
                  child: ProgressWidget(
                    controller: controller1,
                    title: 'Stage 1',
                    drawLeadingLine: false,
                  ),
                ),
                Container(
                  width: progressWidth,
                  height: progressHeight,
                  child: ProgressWidget(
                    controller: controller2,
                    title: 'Stage 2',
                  ),
                ),
                Container(
                  width: progressWidth,
                  height: progressHeight,
                  child: ProgressWidget(
                    controller: controller3,
                    title: 'Stage 3',
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  child: ElevatedButton(
                      onPressed: () {
                        controller1.resetAnimation!();
                        controller2.resetAnimation!();
                        controller3.resetAnimation!();
                      },
                      child: Text('Reset'))),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                child: ElevatedButton(
                  onPressed: () {
                    controller1.startAnimation!();
                  },
                  child: Text('Stage 1'),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                child: ElevatedButton(
                  onPressed: () {
                    controller2.startAnimation!();
                  },
                  child: Text('Stage 2'),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                child: ElevatedButton(
                  onPressed: () {
                    controller3.startAnimation!();
                  },
                  child: Text('Stage 3'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
