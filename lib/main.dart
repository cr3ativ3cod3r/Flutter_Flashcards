import 'package:flutter/material.dart';









void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _AppState();
  
}

class _AppState extends State<MyApp>{
  final List physics=[
    'Who gave the general theory of relativity',
    "Who gave newton's laws of motion",
    'what is the SI unit of time',
    'What is the SI unit of mass',
    'What is the SI unit of temperature',
  ];
  final List pans=[
    'Einstein',
    'Newton',
    'Second',
    'Kilogram',
    'Kelvin',
  ];
  final List chemistry=[
    'What is the process of turning a liquid into a gas at the surface of a liquid',
    'What is the smallest unit of an element that retains its chemical properties?',
    'What is the chemical symbol for gold?',
    "What is the most abundant gas in the Earth's atmosphere?",
    'What is the chemical name for table salt?'
  ];
  final List cans=[
    'Evaporation',
    'Atom',
    'Au',
    'Nitrogen',
    'Sodium chloride',
  ];
  final List maths=[
    'What theorem relates the lengths of the sides of a right triangle?',
    "Who is credited with proving Fermat's Last Theorem?",
    'Which Greek mathematician is known as the "Father of Geometry"?',
    'In calculus, what does the integral represent?',
    'Who introduced the concept of logarithms?',
  ];
  final List mans=[
    'Pythagorean theorem',
    'Andrew Wiles',
    'Euclid',
    'Area under a curve',
    'John Napier',
  ];
  bool view = false;
  int currentindex = 0;
  final _textcontroller = TextEditingController();
  final _textcontroller2 = TextEditingController();
  String addq = '';
  String addanswer = '';
  List _ques = [
    'Who gave the general theory of relativity',
    "Who gave newton's laws of motion",
    'what is the SI unit of time',
    'What is the SI unit of mass',
    'What is the SI unit of temperature',
  ];
  List _ans = [
    'Einstein',
    'Newton',
    'Second',
    'Kilogram',
    'Kelvin',
  ];
  

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color.fromARGB(255, 42, 151, 240)),
      home:Scaffold(
        appBar:AppBar(
          title: const Text('Flashcards'),
        ),
        drawer: Drawer(child: Column(
          children: [
            TextField(
                  controller: _textcontroller,
                  decoration: const InputDecoration(
                    hintText: 'Enter question'
                  ),
                ),
                TextField(
                  controller: _textcontroller2,
                  decoration: const InputDecoration(
                    hintText: 'Enter Answer'
                  ),
                ),
                MaterialButton(onPressed: (){
                    setState(() {
                      addq = _textcontroller.text;
                      addanswer = _textcontroller2.text;
                      _ques.add(addq);
                      _ans.add(addanswer);
                      _textcontroller2.clear();
                      _textcontroller.clear();
                    });
                },child: const Text('Add'),)
          ],
        )),
        body: Stack(
          children: [



        ListView.builder(
          itemBuilder: (BuildContext contect, int index){
                        return GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! < 0) {
                  setState(() {
                    view = false;
                    currentindex = (currentindex - 1 ) % _ques.length;
                  });
                } else {
                  setState(() {
                    view = false;
                    currentindex = (currentindex + 1) % _ques.length;
                  });
                }
              },
            child: Container(
              
              padding: const EdgeInsets.only(top: 160, left: 10, bottom: 160, right: 10),
              child: InkWell(
                child: Container(
                  decoration: const BoxDecoration(
                        
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color.fromARGB(250, 255, 255, 254),
                      ),
                height: 700,
                width: 700,
                
                child: Center(
                    
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 150),
                    Text(_ques[currentindex]),
                    
                  const SizedBox(height: 50),

                  Text(view ? _ans[currentindex] : '',),
                
                const SizedBox(height: 50),

                    ElevatedButton(onPressed: (){
                      setState((){
                        view = !view;
                    }
                    );
                    }, child:  const Text(
                            'Click to know!',
                    
                    
                  
                  
                )),
                
                  const SizedBox(height: 130),

                
                Align(
                  alignment: Alignment.bottomRight,
                child: MaterialButton(onPressed: (){
                  setState(() {
                    view = false;
                    _ques.removeAt(currentindex);
                    _ans.removeAt(currentindex);
                    currentindex = (currentindex - 1) % _ques.length;
                  });
                },child: const Icon(Icons.delete),)
                )]),
                )
              ),)
              
              ));
            
            },
          itemCount: 1,
          
          ),
          ]
          
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                        
                        color: Color.fromARGB(250, 255, 255, 254),
                      ),
          child: Row(
          children: [
            
            
            ElevatedButton(onPressed: (){
              setState(() {
                _ques = physics;
                _ans = pans;
                currentindex = 0;
                view = false;
              });
            }, child: const Icon(Icons.electric_bolt_sharp)),
            const SizedBox(width: (20),),
            
            ElevatedButton(onPressed: (){
              setState(() {
                _ques = chemistry;
                _ans = cans;
                currentindex = 0;
                view = false;
              });
            }, child: const Icon(Icons.science),
          ),
          const SizedBox(width: 20,),
          ElevatedButton(onPressed: (){
              setState(() {
                _ques = maths;
                _ans = mans;
                currentindex = 0;
                view = false;
              });
            }, child: const Icon(Icons.book),
          ),

          ]),
          
            ))
          );}

}



