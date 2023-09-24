import 'package:flutter/material.dart';

void main() {

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(252, 43, 62, 232),
          title: const Text('Quest Board'),
          leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp),
          onPressed: () { 
            // ignore: avoid_print
            print('navigate back');
           },
          ),
          actions: [
            IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {  
              // ignore: avoid_print
              print('navigate to settings');
            },),
          ],
          ),


        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            buildQuest(),
            buildQuest(),
            buildQuest(),
          ],
        ),


        bottomNavigationBar: NavigationBarTheme(
          data: const NavigationBarThemeData(
            backgroundColor: Color.fromARGB(252, 43, 62, 232),
            indicatorColor: Color.fromARGB(252, 43, 62, 232),
            ),
          child: NavigationBar(
            destinations: [
              NavigationDestination(
                icon: IconButton(
                  icon: const Icon(
                    Icons.person_2_outlined,
                    color: Colors.white,
                    ), onPressed: () { 
                      // ignore: avoid_print
                      print('Navigate to Account');
                     },
                ), 
                label: 'Account',                
                ),
              NavigationDestination(
                icon: IconButton(
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                    ), onPressed: () { 
                      // ignore: avoid_print
                      print('Navigate to Home');
                     },
                ), label: 'Home',
                ),
              NavigationDestination(
                icon: IconButton(
                  icon: const Icon(
                    Icons.tv,
                    color: Colors.white,
                    ), onPressed: () { 
                      // ignore: avoid_print
                      print('Navigate to Screen');
                     },
                ), label: 'Screen',
                ),
            ],
          ),
        ),

      ),
    );
  }


  Widget buildQuest() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      width: 110,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2,
          )
      ),
      child: const Center(
        child: Text('Quest'),
        ),
    );
  }
}

