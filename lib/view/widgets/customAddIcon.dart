import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class customAddIcon extends StatelessWidget {
  const customAddIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
          width: 45.0, 
          height: 27.0,
          child: Stack(
            children:[
              Container(
                margin: EdgeInsets.only(left: 10.0),
                width: 40,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 250, 45, 108),
                borderRadius: BorderRadius.circular(7.0)
              )),
              
              Container(
                margin: EdgeInsets.only(right: 10.0),
                width: 40,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 32, 211, 234),
                borderRadius: BorderRadius.circular(7.0)
              )),
              Center(child:Container(
                height: double.infinity,
                width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7.0)
              ),
              child: Icon(Icons.add, size: 20.0,color: Colors.black,),
              )),
              ]
          ));
  }
}