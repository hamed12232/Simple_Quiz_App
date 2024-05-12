import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter/widgets.dart';
import 'model.dart';
class splash extends StatefulWidget {
    splash({super.key});
 
  @override
  State<splash> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<splash> {
  void initState(){

    Future.delayed(Duration(seconds: 3),(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
    
    });

super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,

     body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Quiz App",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 40),),
          SizedBox(width: double.infinity,),
          Image(image:AssetImage("assets/game.png"),
          width: 100,
          height: 180,
          ),
                    SizedBox(height:40,),

          CircularProgressIndicator(color: Colors.red,)
        ]
      )
    );
  }
}