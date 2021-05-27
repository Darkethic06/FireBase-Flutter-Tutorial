// this code is for Realtime Database
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class HomaPage extends StatefulWidget {
  @override
  _HomaPageState createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  final database = FirebaseDatabase.instance;
  //  DatabaseReference = employeesRef;

// void initState(){
//   final FirebaseDatabase database = FirebaseDatabase(app: widget.);
// }

  final textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ref = database.reference();
    final employeeRef = database.reference().child('Employees');
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee App"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Enter Employee Name ",
                style: TextStyle(fontSize: 22),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textcontroller,
                textAlign: TextAlign.center,
              ),
            ),
            // ignore: deprecated_member_use
            FlatButton(
                color: Colors.blueGrey,
                onPressed: () {
                  ref
                      .child("Employees")
                      .push()
                      .child("EmployeeName")
                      .set(textcontroller.text)
                      .asStream();
                  // ref.child("employeename").set(textcontroller.text);
                  textcontroller.clear();
                },
                child: Text(
                  "Submit Employee",
                  style: TextStyle(color: Colors.white),
                )),

            Flexible(
              child: FirebaseAnimatedList(
                query: employeeRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                      return ListTile(
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: ()=> employeeRef.child(snapshot.key).remove(),

                        ),
                       title: Text(snapshot.value['EmployeeName'])
                      );
                    },
              ),
            )
          ],
        ),
      ),
    );
  }
}
