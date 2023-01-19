class News {
  final List news;
  final List sportsNews;
  final List businessNews;
  final List entertainmentNews;
  final List healthNews;
  final List scienceNews;
  final List technologyNews;

  News({
    required this.news,
    required this.sportsNews,
    required this.businessNews,
    required this.entertainmentNews,
    required this.healthNews,
    required this.scienceNews,
    required this.technologyNews,
  });

  factory News.fromJson({required Map data}) {
    return News(
      news: data['articles'],
      sportsNews: data['articles'],
      businessNews: data['articles'],
      entertainmentNews: data['articles'],
      healthNews: data['articles'],
      scienceNews: data['articles'],
      technologyNews: data['articles'],
    );
  }
}
