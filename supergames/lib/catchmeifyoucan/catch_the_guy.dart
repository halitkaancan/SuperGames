import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CatchTheGuy extends StatefulWidget {
  const CatchTheGuy({Key? key}) : super(key: key);

  @override
  State<CatchTheGuy> createState() => _CatchTheGuyState();
}

class _CatchTheGuyState extends State<CatchTheGuy> {

  List<_head> _headList=List.generate(9, (index) => _head());
  Timer? countdown;
  Timer? changer;
  static const maxSecond=30;
  int second =maxSecond;

  void countdownTimer(){
    countdown=Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        second--;
      });
      if(second==0) timer.cancel();
    });

  }

  void headChanger(){
    changer=Timer.periodic(Duration(milliseconds: 500), (timer) {
      _headList.clear();
      _headList=List.generate(9, (index) => _head());
      setState(() {

        _headList[Random().nextInt(9)].visibility= true;
      });
      if(second==0) timer.cancel();
    });
  }
  void playAgain(){
    scoreUtililty.score=0;
    Navigator.pop(context);
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CatchTheGuy(),
    ));
  }
  @override
  void initState(){
    super.initState();
    countdownTimer();
    headChanger();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CatchTheGuy'),backgroundColor: Colors.transparent,


      ),
      body: Column(children: [Expanded(
        flex: 1,
        child: Center(child: Text('Second:$second',style: Theme.of(context).textTheme.headline4,),
        ),
      ),
        Expanded(
          flex:5,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:3 ),
            itemCount: 9,
            itemBuilder: (BuildContext context, int index){
              return _headList[index];
            },
          ),
        ),
        Expanded(
            flex: 2,
            child: Center(child: Text("Score:${scoreUtililty.score}",style: Theme.of(context).textTheme.headline4,),
            ))
      ],
      ),
      floatingActionButton: Visibility(visible:second==0,
          child: FloatingActionButton.extended(
            onPressed: playAgain,
            label: Text("Tekrar oyna!"),
            backgroundColor: Colors.blue,)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class _head extends StatefulWidget{

  bool visibility;

  _head({
    Key? key,
    this.visibility = false
  }) : super(key: key);
  @override
  State <_head> createState() => _headState();
}
class _headState extends State <_head>{
  @override
  Widget build (BuildContext context) {
    return ElevatedButton(onPressed: (){if(widget.visibility) scoreUtililty().addScore();},
      child: Visibility(child: Image.asset("assests/vesikalik.jpg"),
        visible:widget.visibility,),
      style:ElevatedButton.styleFrom(
        primary: Colors.transparent,
        onPrimary: Colors.transparent,
        elevation: 0,

      ) ,
    );

  }

}
class scoreUtililty {
  static int score = 0;

  void addScore() {
    score++;
  }
}