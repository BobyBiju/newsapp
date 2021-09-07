import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:new_news/models/articles_model.dart';

 class ServiceApi {
  String endPointUrl='https://newsapi.org/v2/everything?domains=wsj.com&apiKey=8bf873b9ad424ff78a34047a288de70e';

  Future<List<Article>> getArticle() async {
    var newsModel;
    try{
     http.Response res = await http.get(Uri.parse(endPointUrl));

     if (res.statusCode == 200) {
       Map<String , dynamic> json= jsonDecode(res.body);
       List<dynamic> body= json["articles"] as List;
       List<Article> newsModel= body.map<Article>((dynamic item) => Article.fromJson(item)).toList();
       return newsModel;
     }
    }
     catch(e){
       return newsModel;
     }
     return newsModel;
   }
 }