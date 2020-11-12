import 'package:flutter/material.dart';

class CarSample extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return CarSampleState();
  }

}

class CarSampleState extends State{

  Choice selectedChoice = choices[0];

  void select(Choice choice){
    setState(() {
      selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("神州专车"),
          actions: [
            IconButton(
              icon: Icon(choices[0].icon),
              onPressed: (){select(choices[0]);},
            ),
            IconButton(
              icon: Icon(choices[1].icon),
              onPressed: (){select(choices[1]);},
            ),
            PopupMenuButton(
//              onSelected: select,
              itemBuilder: (BuildContext context){
                  return choices.skip(1).map((Choice choice){
                    return PopupMenuItem(
                      value: choice,
                      child: Text(choice.title+"1"),
                    );
                  }).toList();
              },
            )
          ],
        ),
      ),
    );
  }

}

const List<Choice> choices = <Choice>[
  Choice(title: "自驾",icon: Icons.directions_car),
  Choice(title: "自行车",icon: Icons.directions_bike),
  Choice(title: "乘船",icon: Icons.directions_boat),
  Choice(title: "公交车",icon: Icons.directions_bus),
  Choice(title: "步行",icon: Icons.directions_walk),
];

class Choice {
  const Choice({this.title,this.icon});
  final String title;
  final IconData icon;
}

void main(){
  runApp(CarSample());
}