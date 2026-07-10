class News {
  final int id;
  final String headline;
  final String abstract;
  final String body;
  final String author;
  final String section;
  final String date;
  final String articleUri;
  final String pdfUri;

  News({
    required this.id,
    required this.headline,
    required this.abstract,
    required this.body,
    required this.author,
    required this.section,
    required this.date,
    required this.articleUri,
    required this.pdfUri,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'] ?? 0,
      headline: json['headline'] ?? '',
      abstract: json['abstract'] ?? '',
      body: json['body'] ?? '',
      author: json['author'] ?? '',
      section: json['section'] ?? '',
      date: json['date'] ?? '',
      articleUri: json['article_uri'] ?? '',
      pdfUri: json['pdf_uri'] ?? '',
    );
  }
}