import 'package:flutter/material.dart';

import '../models/news_model.dart';
import '../services/api_service.dart';
import 'detail_page.dart';

class BeritaPage extends StatelessWidget {
  const BeritaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Berita"),
        centerTitle: true,
      ),

      body: FutureBuilder<List<News>>(
        future: ApiService.getNews(),

        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error : ${snapshot.error}",
                textAlign: TextAlign.center,
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("Data tidak ditemukan"),
            );
          }

          final news = snapshot.data!;

          return RefreshIndicator(

            onRefresh: () async {
              await ApiService.getNews();
            },

            child: ListView.separated(

              itemCount: news.length,

              separatorBuilder: (_, __) =>
                  const Divider(height: 1),

              itemBuilder: (context, index) {

                final item = news[index];

                return ListTile(

                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      "${item.id}",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),

                  title: Text(
                    item.headline,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  subtitle: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [

                      const SizedBox(height: 5),

                      Text(
                        item.abstract,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 5),

                      Row(
                        children: [

                          const Icon(
                            Icons.person,
                            size: 16,
                            color: Colors.blue,
                          ),

                          const SizedBox(width: 5),

                          Expanded(
                            child: Text(item.author),
                          ),

                        ],
                      )

                    ],
                  ),

                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),

                  onTap: () {

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (_) =>
                            DetailPage(news: item),

                      ),

                    );

                  },

                );

              },

            ),

          );

        },

      ),

    );
  }
}