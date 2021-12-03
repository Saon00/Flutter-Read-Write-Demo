import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:readwriteprac/main.dart';

var _nameController = TextEditingController();
var _rollController = TextEditingController();

var _name = '';
var _roll = 0;

CollectionReference studentlist =
    FirebaseFirestore.instance.collection("studentlist");

class AddUser extends StatelessWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add User Data')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                onChanged: (value) {
                  _name = value;
                },
                keyboardType: TextInputType.text,
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'enter name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                onChanged: (value) {
                  _roll = int.parse(value);
                },
                keyboardType: TextInputType.number,
                controller: _rollController,
                decoration: InputDecoration(
                  labelText: 'enter roll',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.greenAccent,
                  ),
                  onPressed: () async {
                    await studentlist
                        .add({'name': _name, 'roll': _roll})
                        .then((value) => Navigator.push(context,
                            CupertinoPageRoute(builder: (context) => MyApp())))
                        .catchError((e) =>
                            Fluttertoast.showToast(msg: "Failed to Update..."));
                  },
                  icon: Icon(Icons.add),
                  label: Text('Update')),
            )
          ],
        ),
      ),
    );
  }
}
