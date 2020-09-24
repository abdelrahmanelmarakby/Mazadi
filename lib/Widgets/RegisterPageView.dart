import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:mazadi/Providers/Register.dart';
import 'package:mazadi/Screens/Registerone.dart';
import 'package:mazadi/Screens/Registertwo.dart';
import 'package:provider/provider.dart';

class Pageview extends StatefulWidget {
  @override
  _PageviewState createState() => _PageviewState();
}

var controller = PageController(
  initialPage: 0,
);
LiquidController Controller = LiquidController();

class _PageviewState extends State<Pageview> {
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
    }

    var high = MediaQuery.of(context).size.height;
    var wide = MediaQuery.of(context).size.width;
    var items = <Widget>[
      Register(),
      Registertwo(),
    ];
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: high / 1,
            child: ChangeNotifierProvider<Registerstate>(
                create: (context) => Registerstate(),
                child: LiquidSwipe(
                  enableLoop: false,
                  liquidController: Controller,
                  ignoreUserGestureWhileAnimating: true,
                  positionSlideIcon: .40,
                  enableSlideIcon: true,
                  slideIconWidget: Flash(
                    duration: Duration(seconds: 5),
                    infinite: true,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text(
                            "اسحب",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  pages: items,
                  initialPage: 0,
                  waveType: WaveType.liquidReveal,
                )),
          ),
        ],
      ),
    );
  }
}
