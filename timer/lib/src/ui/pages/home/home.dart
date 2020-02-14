import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timer/src/resources/timer.service.dart';
import 'package:timer/src/ui/components/button/button.dart';
import 'package:timer/src/ui/components/times-list/times-list.dart';

class Home extends State {

  List<String> timesList = [];
  bool isPlaying = false;
  TimerService timerService = TimerService();

  void checkPlayPauseButton() {
    this.isPlaying ? this.pauseTimer() : this.startTimer();
  }

  void checkLapsButton() {
    if(!this.isPlaying && this.timerService.currentDuration != null) {
      this.clearTimer();
    } else {
      this.markLap();
    }
  }

  String checkLapsButtonsTitles() {
    if(!this.isPlaying && this.timerService.currentDuration != null) {
      return 'Zerar';
    }
    return 'Volta';
  }

  Widget renderButtonsRow() {
    return (
      Container(

        margin: EdgeInsets.only(top: 50, bottom: 20),

        padding: EdgeInsets.only(left: 20, right: 20),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Button(
              color: Colors.grey[800],
              title: this.checkLapsButtonsTitles(),
              onPressed: this.checkLapsButton,
            ),

            Button(
              color: this.isPlaying ? Colors.red : Colors.green[600],
              title: this.isPlaying ? 'Pause' : 'Play',
              onPressed: this.checkPlayPauseButton,
            )
          ],
        )
      )
    );
  }

  Widget renderTimesList() {
    return (
      Expanded(
        child: TimesList(
          timesList: this.timesList,
        ),
      )
    );
  }

  void startTimer() {
    setState(() {
      this.isPlaying = true;
      this.timerService.start();
    });
  }

  void pauseTimer() {
    setState(() {
      this.isPlaying = false;
      this.timerService.stop();
    });
  }

  void markLap() {
    setState(() {
      this.timesList.add(this.getClock());
      this.timerService.reset();
      this.isPlaying = false;
    });
  }

  void clearTimer() {
    setState(() {
      this.timerService.reset();
    });
  }

  String getClockTimes(String type, int value) {
    String stringValue = value.toString();

    if(type == 'min' || type == 'sec') {
      return stringValue.length == 1 ? '0' + stringValue : stringValue;
    }
    return stringValue.length == 1 ? '0' + stringValue : stringValue.substring(0, 2);
  }

  String getClock() {
    return '${getClockTimes('min', this.timerService.currentDuration.inMinutes)}:${getClockTimes('sec', this.timerService.currentDuration.inSeconds)},${getClockTimes('mili', this.timerService.currentDuration.inMilliseconds)}';
  }

  Widget renderTimer() {
    return (
      AnimatedBuilder(
        animation: this.timerService,

        builder: (context, child) {
          return (
            Container(
              alignment: Alignment.center,

              margin: EdgeInsets.only(top: 50),

              height: 300,

              child: Text(
                this.getClock(),
                style: TextStyle(
                  fontSize: 65,
                  color: Colors.white
                ),
              )
            )
          );
        },
      )
    );
  }

  Widget renderHomeBody() {
    return (
      Container(

        alignment: Alignment.center,

        color: Colors.black,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            this.renderTimer(),

            this.renderButtonsRow(),

            this.renderTimesList()
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this.renderHomeBody(),
    );
  }

}