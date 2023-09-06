import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 23, 87, 5)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Hello'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Select Date',
              style: TextStyle(fontSize: 25), 
            ),
            ElevatedButton(onPressed: () async{
              DateTime? datePicked = await showDatePicker(context: context,
              initialDate: DateTime.now(), 
              firstDate: DateTime(1900),
              lastDate: DateTime(DateTime.now().year + 4));
            
            if(datePicked!=null){
              print('Date selected: ${datePicked.day}-${datePicked.month}-${datePicked.year}');
              
            }
          

            }, child: Text('Show'),),
            Container(
              height: 10,
            ),
            ElevatedButton(onPressed: () async {
              TimeOfDay? pickedTime = await showTimePicker(
                context: context, 
                initialTime: TimeOfDay.now(),
                initialEntryMode: TimePickerEntryMode.input
              );

              if(pickedTime!=null){
                print("time :${pickedTime.hour}: ${pickedTime.minute}");
              }

            }, child: Text('Select Time'),)
            
          ],
        ),
      ) );
  }
}
