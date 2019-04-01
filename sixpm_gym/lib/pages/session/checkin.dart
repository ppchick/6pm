import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'rateSession.dart';
import 'dart:math';
import '../globalUserID.dart' as globalUID;

class SessionCheckIn extends StatefulWidget {
  final DocumentSnapshot document;
  SessionCheckIn({this.document});
  @override
  SessionCheckInState createState() => new SessionCheckInState(document);
}

class SessionCheckInState extends State<SessionCheckIn>
    with TickerProviderStateMixin {
  Timer _timer;
  int _second = 0;
  int _minute = 0;
  int _hour = 0;
  String timerText = "START";
  DocumentSnapshot document;

  SessionCheckInState(DocumentSnapshot document) {
    this.document = document;
  }
  AnimationController animationController;

  String get timerString {
    Duration duration =
        animationController.duration * animationController.value;
    return '${duration.inHours}:${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    int hours = (document['numHour']).toInt();
    if (document['numHour'] == hours)
      animationController =
          AnimationController(vsync: this, duration: Duration(hours: hours));
    else
      animationController = AnimationController(
          vsync: this, duration: Duration(hours: hours, minutes: 30));
  }

  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(5.0, 40.0, 5.0, 0.0),
              child: new StreamBuilder(
                  stream: Firestore.instance
                      .collection('MatchedSession')
                      .document(document.documentID)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return new Text("Loading");
                    } else {
                      DocumentSnapshot sessionDoc = snapshot.data;
                      if (sessionDoc['hasCheckIn1'] == true &&
                          sessionDoc['hasCheckIn2'] == true) {    //Both users have checked in
                        animationController.reverse(
                            from: animationController.value == 0.0
                                ? 1.0
                                : animationController
                                    .value); 
                        return new Text(
                          'Start Exercising!',
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        );
                      } else
                        return new Text(
                          'Waiting for partner to check in...',
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        );
                    }
                  }),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.center,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: AnimatedBuilder(
                          animation: animationController,
                          builder: (BuildContext context, Widget child) {
                            return CustomPaint(
                              painter: TimerPainter(
                                  animation: animationController,
                                  backgroundColor: Colors.white,
                                  color: Theme.of(context).accentColor),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Time left to work out",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat')),
                            AnimatedBuilder(
                                animation: animationController,
                                builder: (_, Widget child) {
                                  return Text(
                                    timerString,
                                    style: Theme.of(context).textTheme.display4,
                                  );
                                })
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 40.0,
              width: 200,
              child: Material(
                borderRadius: BorderRadius.circular(0.0),
                shadowColor: Colors.grey,
                color: Colors.white,
                elevation: 7.0,
                child: InkWell(
                  onTap: () {
                    print('[Finish] Pressed');

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RateSession(document: document)));
                  },
                  child: Center(
                    child: Text(
                      'FINISH SESSION',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  final Animation<double> animation;
  final Color backgroundColor;
  final Color color;

  TimerPainter({this.animation, this.backgroundColor, this.color})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * pi;
    canvas.drawArc(Offset.zero & size, pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
