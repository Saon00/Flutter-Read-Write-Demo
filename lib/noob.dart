import 'package:flutter/material.dart';
import 'package:readwriteprac/news_api.dart';

import 'model.dart';

class Noob extends StatefulWidget {
  const Noob({Key? key}) : super(key: key);

  @override
  _NoobState createState() => _NoobState();
}

class _NoobState extends State<Noob> {
  List<NewsDataModel>? newsList;

  @override
  void initState() {
    getNews().then((value) => setState(() {
          if (value.isNotEmpty) {
            newsList = value;
          } else {
            print('List Is Empty');
          }
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: newsList!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 2,
              left: 8,
              right: 8,
            ),
            child: Card(
              color: Colors.redAccent,
              elevation: 5,
              child: Column(children: [
                Image.network(newsList![index].urlToImage),
                ListTile(
                  title: Text(newsList![index].title),
                  subtitle: Text(newsList![index].author),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
