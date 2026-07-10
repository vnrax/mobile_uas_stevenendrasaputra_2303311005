import 'package:flutter/material.dart';

import '../models/news_model.dart';
import '../services/api_service.dart';
import 'detail_page.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text("Home"),

        centerTitle: true,

      ),

      body: FutureBuilder<List<News>>(

        future: ApiService.getNews(),

        builder: (context, snapshot){

          if(snapshot.connectionState == ConnectionState.waiting){

            return const Center(

              child: CircularProgressIndicator(),

            );

          }

          if(snapshot.hasError){

            return Center(

              child: Text(

                "Error : ${snapshot.error}",

                textAlign: TextAlign.center,

              ),

            );

          }

          if(!snapshot.hasData){

            return const Center(

              child: Text("Tidak ada data"),

            );

          }

          final news = snapshot.data!;

          return ListView.builder(

            itemCount: news.length > 5 ? 5 : news.length,

            itemBuilder: (context,index){

              final item = news[index];

              return Card(

                margin: const EdgeInsets.all(10),

                elevation: 5,

                child: ListTile(

                  leading: CircleAvatar(

                    backgroundColor: Colors.blue,

                    child: Text(

                      "${index+1}",

                      style: const TextStyle(

                        color: Colors.white,

                      ),

                    ),

                  ),

                  title: Text(

                    item.headline,

                    maxLines: 2,

                    overflow: TextOverflow.ellipsis,

                  ),

                  subtitle: Text(

                    item.abstract,

                    maxLines: 2,

                    overflow: TextOverflow.ellipsis,

                  ),

                  trailing: const Icon(

                    Icons.arrow_forward_ios,

                  ),

                  onTap: (){

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder:(_)=>DetailPage(news: item),

                      ),

                    );

                  },

                ),

              );

            },

          );

        },

      ),

    );

  }

}