import 'dart:async';

//import 'package:covd_19/view/countries_list.dart';
import 'package:covd_19/view/word_states.dart';
//import 'package:covd_19/view/word_states.dart';
import 'package:flutter/material.dart';
import 'dart:math'as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
// static const String id ='splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

late final AnimationController _controller=AnimationController(
    duration: Duration(seconds:3),
    vsync: this)..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  void initState() {
    // TODO: implement initState
    super.initState();
Timer(Duration(seconds: 3), () {
  Navigator.push(context, MaterialPageRoute(builder: (context)=>WorldStateScreen()));
});

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context,Widget?child){
                return Transform.rotate(
                    angle: _controller.value*3.0*math.pi,
                child: Container(
                  height: 200,
                  width: 200,
                  child: Center(
                    child: Image(image: AssetImage('images/virus.png'),),
                  ),
                )
                );}),
            SizedBox(height: MediaQuery.of(context).size.height*.08,),
          const Align(
            alignment: Alignment.center,
            child: Text('Covid-19\nTracker App',
              textAlign:TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          ),
          ],
        ),
      ),
    );
  }
}
