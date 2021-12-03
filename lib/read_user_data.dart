import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserData extends StatefulWidget {
  const UserData({Key? key}) : super(key: key);

  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  final Stream studentlist =
  FirebaseFirestore.instance.collection('studentlist').snapshots();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        child: StreamBuilder(
          stream: studentlist,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text('Error, no data found');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Data Loading........');
            }
            final data = snapshot.requireData;

            return ListView.builder(
              itemCount: data.size,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      color: Colors.green,
                      elevation: 5,
                      shadowColor: Colors.red,
                      child: ListTile(
                        leading: Icon(Icons.person, color: Colors.white,),
                        title: Text('${data.docs[index]['name']}',
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                        subtitle: Text('${data.docs[index]['roll']}',
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                      ),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
