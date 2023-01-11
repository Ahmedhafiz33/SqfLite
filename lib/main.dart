import 'package:flutter/material.dart';
import 'package:sqlflite/sqflite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  SqfliteDb sqldb = SqfliteDb();
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            color: Colors.green,
            onPressed: () async {
              int response = await sqldb
                  .insertData("INSERT INTO 'notes' ('note') VALUES ('Yaman')");
              print(response);
            },
            child: Text('increment data'),
          ),
          MaterialButton(
            color: Colors.green,
            onPressed: () async {
              List<Map> response =
                  await sqldb.readData("SELECT * FROM 'notes'");
              print(response);
            },
            child: Text('read data'),
          ),
          MaterialButton(
            color: Colors.green,
            onPressed: () async {
              int response =
                  await sqldb.deleteData("DELETE FROM 'notes' WHERE id = 12 ");
              print(response);
            },
            child: Text('delete data'),
          ),
          MaterialButton(
            color: Colors.green,
            onPressed: () async {
              int response = await sqldb.updateData(
                  "UPDATE 'notes' SET 'note' = 'Yaman' WHERE id = 13 ");
              print(response);
            },
            child: Text('update data'),
          ),
        ],
      ),
    );
  }
}
