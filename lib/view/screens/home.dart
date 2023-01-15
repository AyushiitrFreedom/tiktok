import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:tiktok/constants.dart';

import '../widgets/customAddIcon.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pagedx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundColor,
        onTap: ((index) {
          setState(() {
            pagedx = index;
          });
        }),
        currentIndex: pagedx,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home , size: 25,
            
            ),
            label: "home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 25,color: Colors.white ,

            ),
            label: "Search"
          ),
          BottomNavigationBarItem(
            icon: customAddIcon(),
            label: ""
            ),
        
          BottomNavigationBarItem(
            icon: Icon(Icons.message , size: 25,

            ),
            label : "message"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 25,

            ) ,
            label : "person"
          ),
        
        ],
      ),
      body: (pageindex[pagedx]),
    );
  }
}