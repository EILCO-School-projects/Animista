import 'package:animista/utils/tuple.dart';

class AnimeDetailsModel {
  final int id;
  final Trio<String?, String?, String?> title;
  final String coverImage;
  final int seasonYear;
  final String format;
  final int episodes;
  final double averageScore;
  final int favourites;
  final int popularity;
  final String description;
  final List<String> genres;
  final int duration;
  final String source;
  final String status;
  final Trio<int?, int?, int?> startDate;
  final Trio<int?, int?, int?>? endDate;
  final String season;
  bool isBookmarked = false;

  AnimeDetailsModel(
      {required this.id,
      required this.title,
      required this.coverImage,
      required this.seasonYear,
      required this.format,
      required this.episodes,
      required this.averageScore,
      required this.favourites,
      required this.popularity,
      required this.description,
      required this.genres,
      required this.duration,
      required this.source,
      required this.status,
      required this.startDate,
      required this.endDate,
      required this.season,
      required this.isBookmarked});

  factory AnimeDetailsModel.fromJson(Map<String, dynamic> json) =>
      AnimeDetailsModel(
          id: json['id'],
          title: Trio<String?, String?, String?>(
              json['title']['romaji'] as String?,
              json['title']['english'] as String?,
              json['title']['native'] as String?),
          coverImage: json['coverImage']['extraLarge'] as String,
          seasonYear: json['seasonYear'] as int,
          format: json['format'] as String,
          episodes: json['episodes'] as int,
          averageScore: (json['averageScore'] / 10) as double,
          favourites: json['favourites'] as int,
          popularity: json['popularity'] as int,
          description: json['description'] as String,
          genres: (json['genres'] as List<dynamic>).cast<String>(),
          duration: json['duration'] as int,
          source: json['source'] as String,
          status: json['status'] as String,
          startDate: Trio<int?, int?, int?>(
            json['startDate']['day'] as int?,
            json['startDate']['month'] as int?,
            json['startDate']['year'] as int?,
          ),
          endDate: Trio<int?, int?, int?>(
            json['endDate']['day'] as int?,
            json['endDate']['month'] as int?,
            json['endDate']['year'] as int?,
          ),
          season: json['season'] as String,
          isBookmarked: false
          //Averages are normally scored as percentages, so we convert them to 1-10 scale
          );
}
