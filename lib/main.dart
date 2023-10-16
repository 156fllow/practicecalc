import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:practicecalc/practice.dart';
import './settings.dart';
import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculation Practice',
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
      home: const MyHomePage(title: 'Calculation Practice'),
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
  static const int mode_add = 1;
  static const int mode_sub = 2;
  static const int mode_mul = 3;
  static const int mode_div = 4;
  int mode = Settings.mode; //1:足し算/2:引き算/3:掛け算/4:割り算
  int first_term = Settings.first_term;
  int second_term = Settings.second_term;

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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
              'You choose the practice mode',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(children: [
                  const Text("Mode"),
                    DropdownButton(
                      items: const[
                        DropdownMenuItem(
                          value: mode_add,
                          child: Text('足し算'),
                        ),
                        DropdownMenuItem(
                          value: mode_sub,
                          child: Text('引き算'),
                        ),
                        DropdownMenuItem(
                          value: mode_mul,
                          child: Text('掛け算'),
                        ),
                        DropdownMenuItem(
                          value: mode_div,
                          child: Text('割り算'),
                        ),
                      ],
                      value: mode,
                      onChanged: (int? value){
                        Settings.mode = value!;
                        setState((){
                          mode = value!;
                        });
                      }
                  ),
                ],),
                Column(children: [
                  const Text("Term1 digits"),
                  DropdownButton(
                      items: const[
                        DropdownMenuItem(
                          value: 1,
                          child: Text('1'),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text('2'),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text('3'),
                        ),
                        DropdownMenuItem(
                          value: 4,
                          child: Text('4'),
                        ),
                      ],
                      value: first_term,
                      onChanged: (int? value){
                        Settings.first_term = value!;
                        setState((){
                          first_term = value!;
                        });
                      }
                  ),
                ],),
                Column(children: [
                  const Text("Term2 digits"),
                  DropdownButton(
                      items: const[
                        DropdownMenuItem(
                          value: 1,
                          child: Text('1'),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text('2'),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text('3'),
                        ),
                        DropdownMenuItem(
                          value: 4,
                          child: Text('4'),
                        ),
                      ],
                      value: second_term,
                      onChanged: (int? value){
                        Settings.second_term = value!;
                        setState((){
                          second_term = value!;
                        });
                      }
                    ),
                ],),
              ],
            ),
            TextButton(
              onPressed: (){
                // Fluttertoast.showToast(msg: "Pressed Start" + "/" + mode.toString() + "/" + first_term.toString() + "/" + second_term.toString());
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Practice())
                );
              },
              child: Text("Start"),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
