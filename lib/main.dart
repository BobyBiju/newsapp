import 'package:flutter/material.dart';
import 'api_service/api_services.dart';
import 'models/articles_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ServiceApi client =ServiceApi();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   home: Scaffold(
     appBar: AppBar(
       title: Text('News App'),
       centerTitle: true,
     ),
     body: FutureBuilder(
       future: client.getArticle(),
       builder: (BuildContext context,AsyncSnapshot<List<Article>> snapshot){
         if(snapshot.hasData){
           List<Article>? articles = snapshot.data;
           return ListView.builder(itemCount: articles!.length,
               itemBuilder:(context,index)=> ListTile(
               title: Text(articles[index].title),
             )
           );
         }
         return Center(
           child: CircularProgressIndicator(),
         );
     },
     ),
   ),
    );
  }
}



