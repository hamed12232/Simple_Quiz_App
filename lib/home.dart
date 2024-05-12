import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';

import 'model.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<home> {
  List<Question> Questionlist=listQuesion();
  int currentQuestion=0;
  Answer? selectedAnswer;
  int score=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
       child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text("Simple Quiz App",
              style: TextStyle(
                color: Colors.white ,
                fontSize: 25,
                fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20,),

             Text(
                'Question ${currentQuestion+1} / ${Questionlist.length}',
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                       fontSize: 20,
                )
             ),
                SizedBox(height: 40,),
          Stack(
            alignment: Alignment.center,
             clipBehavior: Clip.none,
            children:[ 
              Container(
              height: 160,
              width: double.infinity,
              margin: EdgeInsets.all(9),
              padding: EdgeInsets.all(35),
              decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                ),
              Center(
                child: Text(
                  Questionlist[currentQuestion].textQuestion,
                  style: TextStyle(color: Colors.black,
                            fontSize: 20,  
                            fontWeight: FontWeight.bold,
                            ),
                ),
              ),
                const Positioned(
                    top: -30,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.question_mark_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
       
                  const Positioned(
                    left: -10,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  const Positioned(
                    right: -10,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.black,
                    ),
                  ),
          ],
       ),
       SizedBox(width: 20,),
       
       Column(children: [
         for(Answer answer in Questionlist[currentQuestion].answer)
        AnswerButtom(answer)
       
       ],
       ),
       SizedBox(height: 20,),
       NextButtom(),
      
          ],
        ),
     )

    );
  }
  AnswerButtom(Answer answer){
    bool isSelected=answer==selectedAnswer;
    return Container(
     clipBehavior: Clip.antiAliasWithSaveLayer,
     margin: EdgeInsets.symmetric(vertical:5),
        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
      child: MaterialButton(onPressed: (){
        setState(() {
          selectedAnswer=answer;
        });
      },
        child:Text("${answer.textAnswer}",
        style: TextStyle(color: Colors.black),
        ),
        color:isSelected?Colors.orange:Colors.white,
        minWidth: 200,
        height: 55,
      ),
    );
  }
  
  NextButtom(){
    bool last=false;
    if(currentQuestion==Questionlist.length-1){
      last=true;
    }

    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
     margin: EdgeInsets.symmetric(vertical:5),
        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
      child: MaterialButton(onPressed: (){
       if(selectedAnswer?.iscorrect ?? false){
        score++;
       }
        if(selectedAnswer==null){
            return;//هتقف
        }else if(last){
          showDialog(
            barrierDismissible: false,

            context: context, builder: (_)
          {
            return AlertDialog(
              title: Text('Quiz Completed'),
              backgroundColor: Colors.white,
              actions: [
                Text("Your score is ${Questionlist.length}/$score"),
                MaterialButton(onPressed: (){
                  setState(() {
                    score=0;
                    currentQuestion=0;
                    selectedAnswer=null;
                    Navigator.pop(context);//عاوز احذف الحاجة اللي معروضة
                  });
                },
                child: Text("restart"),)
              ],
            );
          }
          );
        }
      
        else{
          setState(() {
             currentQuestion++;
          selectedAnswer=null;
          });
        }
      },
        child:Text(last?"Submit":"Next",style: TextStyle(
          color: Colors.black
        ),
        ),
        color:Colors.green,
        minWidth: 100,
        height: 50,
           ),
    );
  
    }
  }


