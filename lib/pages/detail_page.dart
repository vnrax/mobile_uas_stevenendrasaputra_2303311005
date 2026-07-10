import 'package:flutter/material.dart';

import '../models/news_model.dart';

class DetailPage extends StatelessWidget {
  final News news;

  const DetailPage({
    super.key,
    required this.news,
  });

  String removeHtml(String text) {
    return text
        .replaceAll(RegExp(r'<[^>]*>'), '')
        .replaceAll("&nbsp;", " ")
        .replaceAll("\n", "\n")
        .trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Berita"),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Text(

              news.headline,

              style: const TextStyle(

                fontSize: 24,

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 20),

            Card(

              child: Padding(

                padding: const EdgeInsets.all(12),

                child: Column(

                  children: [

                    Row(

                      children: [

                        const Icon(Icons.person),

                        const SizedBox(width: 10),

                        Expanded(

                          child: Text(news.author),

                        ),

                      ],

                    ),

                    const Divider(),

                    Row(

                      children: [

                        const Icon(Icons.calendar_today),

                        const SizedBox(width: 10),

                        Expanded(

                          child: Text(news.date),

                        ),

                      ],

                    ),

                    const Divider(),

                    Row(

                      children: [

                        const Icon(Icons.category),

                        const SizedBox(width: 10),

                        Expanded(

                          child: Text(news.section),

                        ),

                      ],

                    ),

                  ],

                ),

              ),

            ),

            const SizedBox(height: 20),

            const Text(

              "Abstract",

              style: TextStyle(

                fontWeight: FontWeight.bold,

                fontSize: 20,

              ),

            ),

            const SizedBox(height: 10),

            Text(

              news.abstract,

              textAlign: TextAlign.justify,

            ),

            const SizedBox(height: 25),

            const Text(

              "Isi Berita",

              style: TextStyle(

                fontWeight: FontWeight.bold,

                fontSize: 20,

              ),

            ),

            const SizedBox(height: 10),

            Text(

              removeHtml(news.body),

              textAlign: TextAlign.justify,

              style: const TextStyle(

                height: 1.6,

              ),

            ),

          ],

        ),

      ),

    );

  }

}