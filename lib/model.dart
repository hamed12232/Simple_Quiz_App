class Question{

  String textQuestion;
  List<Answer>answer;
  Question(this.textQuestion,this.answer){}

}
class Answer{
  String? textAnswer;
  bool? iscorrect;
Answer(this.textAnswer,this.iscorrect){}

}

 List<Question> listQuesion(){
List<Question> list=[
 
  Question(
    "What language is Flutter primarily\n developed in?",
    [
      Answer("Java", false),
      Answer("Dart", true),
      Answer("Swift", false),
      Answer("C#", false),
    ],
  ),
  Question(
    "Which IDE is commonly used for\n Flutter development?",
    [
      Answer("Android Studio", true),
      Answer("Visual Studio Code", true),
      Answer("Eclipse", false),
      Answer("Xcode", false),
    ],
  ),
  Question(
    "What is the name of the widget\n used to create a new screen in Flutter?",
    [
      Answer("ScreenWidget", false),
      Answer("PageWidget", false),
      Answer("ViewWidget", false),
      Answer("Scaffold", true),
    ],
  ),
   Question(
    "What is the framework used\n for building UI in Flutter?",
    [
      Answer("React", false),
      Answer("Angular", false),
      Answer("Vue", false),
      Answer("Widgets", true),
    ],
  ),
  Question(
    "Which platform(s) does Flutter\n support for app development?",
    [
      Answer("Android", true),
      Answer("iOS", true),
      Answer("Web", true),
      Answer("Desktop", true),
    ],
  ),
  Question(
    "What is the command used to create\n a new Flutter project?",
    [
      Answer("flutter start", false),
      Answer("flutter new", false),
      Answer("flutter create", true),
      Answer("flutter init", false),
    ],
  ),
  Question(
    "What is the main function responsible\n for in a Flutter app?",
    [
      Answer("Handling HTTP requests", false),
      Answer("Rendering UI", false),
      Answer("Starting the app", true),
      Answer("Managing state", false),
    ],
  ),
];

return list;
}