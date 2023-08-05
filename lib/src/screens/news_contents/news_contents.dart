import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mi_credencial/src/custom_widgets/news_content_card.dart';
import 'package:mi_credencial/src/model_class/content_model.dart';
import 'package:mi_credencial/src/screens/news_details_screen/news_details_screen.dart';
import 'package:mi_credencial/src/utils/my_style.dart';
import 'package:http/http.dart' as http;

class NewsContents extends StatefulWidget {
  const NewsContents({Key? key}) : super(key: key);

  @override
  State<NewsContents> createState() => _NewsContentsState();
}

class _NewsContentsState extends State<NewsContents> {
  List<ContentModel> contentList = [];

  getData() async {
    http.Response response = await http.get(Uri.parse(
        "https://api.micredencial.com.ar/contents/C9950BEA9012437494FDDD3EE8DC601A"));

    var data = jsonDecode(response.body);

    contentList = (data as List).map((e) => ContentModel.fromJson(e)).toList();

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,color: Theme.of(context).hintColor)),
        elevation: 0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text("Novedades",style: TextStyle(color: Theme.of(context).hintColor)),
        centerTitle: true,
      ),
      body: contentList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: contentList.length,
                itemBuilder: (c, i) {
                  return NewsContentCard(
                      img: contentList[i].dsImage!.isEmpty
                          ? "${const Center(child: CircularProgressIndicator())}"
                          : "${contentList[i].dsImage}",
                      title: "${contentList[i].dsTitle}",
                      subject: "${contentList[i].dsSubject}",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => NewsDetailsScreen(
                                  title: contentList[i].dsTitle,
                                  img: contentList[i].dsImage,
                                  details: contentList[i].dsContent,
                                  sub: contentList[i].dsSubject,
                                  dsFile: contentList[i].dsFile,
                                )));
                      });
                },
              )),
    );
  }
}
