import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(LoadingStudentApp());
}

class LoadingStudentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World of SchoolCraft',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoadingStudent(),
    );
  }
}

class LoadingStudent extends StatelessWidget {
  const LoadingStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Column(
        children: [
          //top half 2x2 grid
          SizedBox(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.height,
            child: GridView.count(
              crossAxisCount: 2, // 2 columns
              children: [
                // quest button
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // action
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.all(10.0),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.flag,
                          color: Colors.white,
                          size: 80.0,
                        ),
                        Text(
                          'Quests',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // mastery button
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      //action
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.all(10.0),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.thumb_up_sharp,
                          color: Colors.white,
                          size: 80.0,
                        ),
                        Text(
                          'Mastery',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Class Board
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      //action
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.all(10.0),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.monitor,
                          color: Colors.white,
                          size: 80.0,
                        ),
                        Text(
                          'Class Board',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // avatar the last container bender
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      //actin
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.all(10.0),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.portrait,
                          color: Colors.white,
                          size: 80.0,
                        ),
                        Text(
                          'My Avatar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // bottom half
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //add classs
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  margin: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      //actin
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.black),
                      ),
                      padding: const EdgeInsets.all(10.0),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 40.0,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'ADD A CLASS',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //suggest
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  margin: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // actin
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.black),
                      ),
                      padding: const EdgeInsets.all(10.0),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 40.0,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'SUGGESTION',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Text('fade display') //todo
        ],
      ),
    );
  }
}
