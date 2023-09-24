
import 'package:cp3405_project/screens/screen_welcome.dart';
import 'package:cp3405_project/screens/screen_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


var testData = ''; 

Future main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final studentsEntity = FirebaseFirestore.instance.collection('Students');

  //final snapshot = await db.collection('Students').where('userType', isEqualTo: 'Student').get();

  //final snapshot = await studentsEntity.doc('test-Student').get(); 
  final snapshot = await studentsEntity.where('Username', isEqualTo: 'username2').get(); 
    final studentData = snapshot.docChanges.first.doc.data(); 
  
  testData = studentData.toString() + '123';
  var _username = ''; 
  Iterable<MapEntry<String, dynamic>> entries = studentData!.entries; 
  for (final entry in studentData.entries) {
    if (entry.key == 'Username') {
      testData = entry.value; 
      _username = entry.value; 
    }
  }

  var _checkUsername = 'username2'; 
  testData = _username.compareTo(_checkUsername).toString() + 'true'; // 0 indicates the values are equal. Other values doesn't mean the values are equal. 


  
  // testData = studentData!.entries.isNotEmpty.toString(); // Checks if account has values within. 


  
  //final snapshot = await studentsEntity.doc('test-Student').get(); 
  //final studentData = snapshot.toString();
  // testData = studentData!.entries.last.value.toString();
  // testData = studentData!.entries.elementAt(5).value.toString();

  // testData = studentData!.entries.toList().elementAt(0).value.toString();


  studentsEntity.get().then((QuerySnapshot querySnapshot) {
    for (var doc in querySnapshot.docs) {
      testData = doc.toString(); 
     }
  });

    runApp(const MyApp());
  
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Start Route
      initialRoute: '/',
      routes: {
        // Screens for navigation
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signUp': (context) => const LoginScreen(),
        '/forgotPassword': (context) => const LoginScreen(),
        '/teacherLanding': (context) => const LoginScreen(),
        '/studentLanding': (context) => const WelcomeScreen(),
        '/questBoard': (context) => const LoginScreen(),
        '/questPlanner': (context) => const LoginScreen(),
        '/avatar': (context) => const LoginScreen(),
        '/metrics': (context) => const LoginScreen(),
        '/classView': (context) => const LoginScreen(),
        '/classBoard': (context) => const LoginScreen(),
      },
      // home: const MyScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  // final String _studentName = 'My Name is Jay Davis'; 
  final String _studentName = testData; 

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.amber,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              _studentName, 
              style: Theme.of(context).textTheme.headlineMedium,

            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}