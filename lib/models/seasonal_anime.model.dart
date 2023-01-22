import 'package:animista/utils/tuple.dart';

class SeasonalAnimeModel {
  final Trio<String?, String?, String?> title;
  final String coverImage;
  final String format;
  final String season;
  final int seasonYear;
  final int favourites;
  final double averageScore;
  final int episodes;

  SeasonalAnimeModel(
      {required this.title,
      required this.coverImage,
      required this.format,
      required this.season,
      required this.seasonYear,
      required this.favourites,
      required this.averageScore,
      required this.episodes});

  factory SeasonalAnimeModel.fromJson(Map<String, dynamic> json) =>
      SeasonalAnimeModel(
          title: Trio<String?, String?, String?>(
              json['title']['romaji'] as String?,
              json['title']['english'] as String?,
              json['title']['native'] as String?),
          coverImage: json['coverImage']['extraLarge'] as String,
          format: json['format'] as String,
          season: json['season'] as String,
          seasonYear: json['seasonYear'] as int,
          favourites: json['favourites'] as int,
          //Averages are normally scored as percentages, so we convert them to 1-10 scale
          averageScore: (json['averageScore'] / 10) as double,
          episodes: json['episodes'] as int);
}

const seasonalAnimesJsonExample = r'''
  [
        {
          "title": {
            "romaji": "Cowboy Bebop",
            "english": "Cowboy Bebop",
            "native": "\u30ab\u30a6\u30dc\u30fc\u30a4\u30d3\u30d0\u30c3\u30d7"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx1-CXtrrkMpJ8Zq.png"
          },
          "format": "TV",
          "season": "SPRING",
          "seasonYear": 1998,
          "favourites": 19773,
          "averageScore": 86,
          "episodes": 26
        },
        {
          "title": {
            "romaji": "Cowboy Bebop: Tengoku no Tobira",
            "english": "Cowboy Bebop: The Movie - Knockin' on Heaven's Door",
            "native": "\u30ab\u30a6\u30dc\u30fc\u30a4\u30d3\u30d0\u30c3\u30d7\u5929\u56fd\u306e\u6249"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx5-NozHwXWdNLCz.jpg"
          },
          "format": "MOVIE",
          "season": "SUMMER",
          "seasonYear": 2001,
          "favourites": 984,
          "averageScore": 82,
          "episodes": 1
        },
        {
          "title": {
            "romaji": "TRIGUN",
            "english": "Trigun",
            "native": "TRIGUN"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx6-Zzun7PHNNgPt.jpg"
          },
          "format": "TV",
          "season": "SPRING",
          "seasonYear": 1998,
          "favourites": 3455,
          "averageScore": 79,
          "episodes": 26
        },
        {
          "title": {
            "romaji": "Witch Hunter ROBIN",
            "english": "Witch Hunter ROBIN",
            "native": "Witch Hunter ROBIN"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx7-6uh1fPvbgS9t.png"
          },
          "format": "TV",
          "season": "SUMMER",
          "seasonYear": 2002,
          "favourites": 109,
          "averageScore": 68,
          "episodes": 26
        },
        {
          "title": {
            "romaji": "Bouken Ou Beet",
            "english": "Beet the Vandel Buster",
            "native": "\u5192\u967a\u738b\u30d3\u30a3\u30c8"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/medium\/b8-ReS3TwSgrDDi.jpg"
          },
          "format": "TV",
          "season": "FALL",
          "seasonYear": 2004,
          "favourites": 12,
          "averageScore": 62,
          "episodes": 52
        },
        {
          "title": {
            "romaji": "Eyeshield 21",
            "english": "Eyeshield 21",
            "native": "\u30a2\u30a4\u30b7\u30fc\u30eb\u30c921"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx15-A4F2t0TgWoi4.png"
          },
          "format": "TV",
          "season": "SPRING",
          "seasonYear": 2005,
          "favourites": 464,
          "averageScore": 75,
          "episodes": 145
        },
        {
          "title": {
            "romaji": "Hachimitsu to Clover",
            "english": "Honey and Clover",
            "native": "\u30cf\u30c1\u30df\u30c4\u3068\u30af\u30ed\u30fc\u30d0\u30fc"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx16-5fJZ2Sy2ThRA.jpg"
          },
          "format": "TV",
          "season": "SPRING",
          "seasonYear": 2005,
          "favourites": 677,
          "averageScore": 76,
          "episodes": 24
        },
        {
          "title": {
            "romaji": "Hungry Heart: Wild Striker",
            "english": null,
            "native": "\u30cf\u30f3\u30b0\u30ea\u30fc\u30cf\u30fc\u30c8 Wild Striker"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx17-6kqIbdUk3dgi.png"
          },
          "format": "TV",
          "season": "FALL",
          "seasonYear": 2002,
          "favourites": 48,
          "averageScore": 70,
          "episodes": 52
        },
        {
          "title": {
            "romaji": "Initial D FOURTH STAGE",
            "english": "Initial D 4th Stage",
            "native": "\u982d\u6587\u5b57\u3008\u30a4\u30cb\u30b7\u30e3\u30eb\u3009D FOURTH STAGE"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/medium\/b18-r7IirVmwP89u.jpg"
          },
          "format": "TV",
          "season": "SPRING",
          "seasonYear": 2004,
          "favourites": 508,
          "averageScore": 79,
          "episodes": 24
        },
        {
          "title": {
            "romaji": "MONSTER",
            "english": "Monster",
            "native": "MONSTER"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx19-ham53gnijfiN.jpg"
          },
          "format": "TV",
          "season": "SPRING",
          "seasonYear": 2004,
          "favourites": 11851,
          "averageScore": 88,
          "episodes": 74
        },
        {
          "title": {
            "romaji": "NARUTO",
            "english": "Naruto",
            "native": "NARUTO -\u30ca\u30eb\u30c8-"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx20-YJvLbgJQPCoI.jpg"
          },
          "format": "TV",
          "season": "FALL",
          "seasonYear": 2002,
          "favourites": 23709,
          "averageScore": 79,
          "episodes": 220
        },
        {
          "title": {
            "romaji": "ONE PIECE",
            "english": "ONE PIECE",
            "native": "ONE PIECE"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/nx21-tXMN3Y20PIL9.jpg"
          },
          "format": "TV",
          "season": "FALL",
          "seasonYear": 1999,
          "favourites": 56235,
          "averageScore": 87,
          "episodes": null
        },
        {
          "title": {
            "romaji": "Tennis no Ouji-sama",
            "english": "The Prince of Tennis",
            "native": "\u30c6\u30cb\u30b9\u306e\u738b\u5b50\u69d8"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx22-8Qg3NZXH6asP.png"
          },
          "format": "TV",
          "season": "FALL",
          "seasonYear": 2001,
          "favourites": 488,
          "averageScore": 74,
          "episodes": 178
        },
        {
          "title": {
            "romaji": "Ring ni Kakero 1",
            "english": null,
            "native": "\u30ea\u30f3\u30b0\u306b\u304b\u3051\u308d\uff11"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx23-OwtP69d9B9kg.jpg"
          },
          "format": "TV",
          "season": "FALL",
          "seasonYear": 2004,
          "favourites": 7,
          "averageScore": 53,
          "episodes": 12
        },
        {
          "title": {
            "romaji": "School Rumble",
            "english": "School Rumble",
            "native": "\u30b9\u30af\u30fc\u30eb\u30e9\u30f3\u30d6\u30eb"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx24-InbFkgWGvqIK.png"
          },
          "format": "TV",
          "season": "FALL",
          "seasonYear": 2004,
          "favourites": 749,
          "averageScore": 75,
          "episodes": 26
        },
        {
          "title": {
            "romaji": "Sunabouzu",
            "english": "Desert Punk",
            "native": "\u7802\u307c\u3046\u305a"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx25-H1etX7IgfFtQ.jpg"
          },
          "format": "TV",
          "season": "FALL",
          "seasonYear": 2004,
          "favourites": 203,
          "averageScore": 68,
          "episodes": 24
        },
        {
          "title": {
            "romaji": "TEXHNOLYZE",
            "english": "Texhnolyze",
            "native": "TEXHNOLYZE"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx26-u2SawALYH3w3.jpg"
          },
          "format": "TV",
          "season": "SPRING",
          "seasonYear": 2003,
          "favourites": 1804,
          "averageScore": 76,
          "episodes": 22
        },
        {
          "title": {
            "romaji": "Trinity Blood",
            "english": "Trinity Blood",
            "native": "\u30c8\u30ea\u30cb\u30c6\u30a3\u30fb\u30d6\u30e9\u30c3\u30c9"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx27-MOAaiBHHLfOY.png"
          },
          "format": "TV",
          "season": "SPRING",
          "seasonYear": 2005,
          "favourites": 180,
          "averageScore": 67,
          "episodes": 24
        },
        {
          "title": {
            "romaji": "Yakitate!! Japan",
            "english": null,
            "native": "\u713c\u304d\u305f\u3066!! \u30b8\u30e3\u3071\u3093"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx28-QuKcZpUjTXzV.png"
          },
          "format": "TV",
          "season": "FALL",
          "seasonYear": 2004,
          "favourites": 207,
          "averageScore": 75,
          "episodes": 69
        },
        {
          "title": {
            "romaji": "Zipang",
            "english": null,
            "native": "\u30b8\u30d1\u30f3\u30b0"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx29-0PsnJVadMG7k.jpg"
          },
          "format": "TV",
          "season": "FALL",
          "seasonYear": 2004,
          "favourites": 30,
          "averageScore": 71,
          "episodes": 26
        },
        {
          "title": {
            "romaji": "Shin Seiki Evangelion",
            "english": "Neon Genesis Evangelion",
            "native": "\u65b0\u4e16\u7d00\u30a8\u30f4\u30a1\u30f3\u30b2\u30ea\u30aa\u30f3"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx30-wmNoX3m2qTzz.jpg"
          },
          "format": "TV",
          "season": "FALL",
          "seasonYear": 1995,
          "favourites": 25125,
          "averageScore": 83,
          "episodes": 26
        },
        {
          "title": {
            "romaji": "Shin Seiki Evangelion Movie: Shi to Shinsei",
            "english": "Neon Genesis Evangelion: Death & Rebirth",
            "native": "\u65b0\u4e16\u7d00\u30a8\u30f4\u30a1\u30f3\u30b2\u30ea\u30aa\u30f3\u5287\u5834\u7248 \u30b7\u30c8\u65b0\u751f"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx31-3zRThtzQH62E.png"
          },
          "format": "MOVIE",
          "season": "WINTER",
          "seasonYear": 1997,
          "favourites": 402,
          "averageScore": 72,
          "episodes": 1
        },
        {
          "title": {
            "romaji": "Shin Seiki Evangelion Movie: Air \/ Magokoro wo, Kimi ni",
            "english": "Neon Genesis Evangelion: The End of Evangelion",
            "native": "\u65b0\u4e16\u7d00\u30a8\u30f4\u30a1\u30f3\u30b2\u30ea\u30aa\u30f3\u5287\u5834\u7248 Air\/\u307e\u3054\u3053\u308d\u3092\u3001\u541b\u306b"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx32-i4ijZI4MuPiV.jpg"
          },
          "format": "MOVIE",
          "season": "SUMMER",
          "seasonYear": 1997,
          "favourites": 11836,
          "averageScore": 85,
          "episodes": 1
        },
        {
          "title": {
            "romaji": "Kenpuu Denki Berserk",
            "english": "Berserk",
            "native": "\u5263\u98a8\u4f1d\u5947\u30d9\u30eb\u30bb\u30eb\u30af"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx33-CTtcRjqe7UnM.jpg"
          },
          "format": "TV",
          "season": "FALL",
          "seasonYear": 1997,
          "favourites": 5680,
          "averageScore": 83,
          "episodes": 25
        },
        {
          "title": {
            "romaji": "GHOST IN THE SHELL: Koukaku Kidoutai",
            "english": "Ghost in the Shell",
            "native": "GHOST IN THE SHELL \/ \u653b\u6bbb\u6a5f\u52d5\u968a"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx43-LMGXobx4D6in.png"
          },
          "format": "MOVIE",
          "season": "FALL",
          "seasonYear": 1995,
          "favourites": 3836,
          "averageScore": 80,
          "episodes": 1
        },
        {
          "title": {
            "romaji": "Rurouni Kenshin: Meiji Kenkaku Romantan - Tsuioku-hen",
            "english": "Samurai X: Trust and Betrayal",
            "native": "\u308b\u308d\u3046\u306b\u5263\u5fc3\u2015\u660e\u6cbb\u5263\u5ba2\u6d6a\u6f2b\u8b5a\u2015\u8ffd\u61b6\u7de8"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx44-MG5I672UbWAy.png"
          },
          "format": "OVA",
          "season": "WINTER",
          "seasonYear": 1999,
          "favourites": 1493,
          "averageScore": 84,
          "episodes": 4
        },
        {
          "title": {
            "romaji": "Rurouni Kenshin: Meiji Kenkaku Romantan",
            "english": "Rurouni Kenshin",
            "native": "\u308b\u308d\u3046\u306b\u5263\u5fc3 -\u660e\u6cbb\u5263\u5ba2\u6d6a\u6f2b\u8b5a-"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx45-DEFgZRCxiGmF.png"
          },
          "format": "TV",
          "season": "WINTER",
          "seasonYear": 1996,
          "favourites": 1724,
          "averageScore": 79,
          "episodes": 94
        },
        {
          "title": {
            "romaji": "Rurouni Kenshin: Meiji Kenkaku Romantan - Ishinshishi e no Requiem",
            "english": "Samurai X: The Motion Picture",
            "native": "\u308b\u308d\u3046\u306b\u5263\u5fc3 -\u660e\u6cbb\u5263\u5ba2\u6d6a\u6f2b\u8b5a- \u7dad\u65b0\u5fd7\u58eb\u3078\u306e\u93ae\u9b42\u6b4c"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx46-Steq4sQpA6fq.png"
          },
          "format": "MOVIE",
          "season": "FALL",
          "seasonYear": 1997,
          "favourites": 39,
          "averageScore": 70,
          "episodes": 1
        },
        {
          "title": {
            "romaji": "AKIRA",
            "english": "Akira",
            "native": "AKIRA"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx47-Sjkc8RDBjqwT.jpg"
          },
          "format": "MOVIE",
          "season": "SUMMER",
          "seasonYear": 1988,
          "favourites": 5188,
          "averageScore": 79,
          "episodes": 1
        },
        {
          "title": {
            "romaji": ".hack\/\/SIGN",
            "english": ".hack\/\/Sign",
            "native": ".hack\/\/SIGN"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx48-YKktSuM10DRK.png"
          },
          "format": "TV",
          "season": "SPRING",
          "seasonYear": 2002,
          "favourites": 305,
          "averageScore": 65,
          "episodes": 26
        },
        {
          "title": {
            "romaji": "Aa! Megami-sama!",
            "english": "Oh! My Goddess",
            "native": "\u3042\u3042\u3063\u5973\u795e\u3055\u307e\u3063"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx49-jv1G7rSP4lxg.png"
          },
          "format": "OVA",
          "season": "WINTER",
          "seasonYear": 1993,
          "favourites": 65,
          "averageScore": 68,
          "episodes": 5
        },
        {
          "title": {
            "romaji": "Aa! Megami-sama! (TV)",
            "english": "Oh! My Goddess (TV)",
            "native": "\u3042\u3042\u3063\u5973\u795e\u3055\u307e\u3063 (TV)"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx50-OdzAFLX6X6Hf.png"
          },
          "format": "TV",
          "season": "WINTER",
          "seasonYear": 2005,
          "favourites": 175,
          "averageScore": 69,
          "episodes": 24
        },
        {
          "title": {
            "romaji": "Tenshi Kinryouku",
            "english": "Angel Sanctuary",
            "native": "\u5929\u4f7f\u7981\u731f\u533a"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/medium\/b51-qkm7PDhQr1jS.jpg"
          },
          "format": "OVA",
          "season": "SPRING",
          "seasonYear": 2000,
          "favourites": 25,
          "averageScore": 54,
          "episodes": 3
        },
        {
          "title": {
            "romaji": "Kidou Tenshi Angelic Layer",
            "english": "Angelic Layer",
            "native": "\u6a5f\u52d5\u5929\u4f7f\u30a8\u30f3\u30b8\u30a7\u30ea\u30c3\u30af\u30ec\u30a4\u30e4\u30fc"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx52-i6aTXaa4w1QA.png"
          },
          "format": "TV",
          "season": "SPRING",
          "seasonYear": 2001,
          "favourites": 82,
          "averageScore": 68,
          "episodes": 26
        },
        {
          "title": {
            "romaji": "Ai Yori Aoshi",
            "english": "Ai Yori Aoshi",
            "native": "\u85cd\u3088\u308a\u9752\u3057"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx53-GPDXGvbhg4w5.png"
          },
          "format": "TV",
          "season": "SPRING",
          "seasonYear": 2002,
          "favourites": 92,
          "averageScore": 66,
          "episodes": 24
        },
        {
          "title": {
            "romaji": "Appleseed (Movie)",
            "english": null,
            "native": "\u30a2\u30c3\u30d7\u30eb\u30b7\u30fc\u30c9"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx54-EIMIUlH3FuJb.jpg"
          },
          "format": "MOVIE",
          "season": "SPRING",
          "seasonYear": 2004,
          "favourites": 53,
          "averageScore": 65,
          "episodes": 1
        },
        {
          "title": {
            "romaji": "Arc the Lad",
            "english": null,
            "native": "\u30a2\u30fc\u30af\u30b6\u30e9\u30c3\u30c9"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx55-uG26UwIxEJkJ.png"
          },
          "format": "TV",
          "season": "SPRING",
          "seasonYear": 1999,
          "favourites": 10,
          "averageScore": 59,
          "episodes": 26
        },
        {
          "title": {
            "romaji": "Avenger",
            "english": null,
            "native": "\u30a2\u30f4\u30a7\u30f3\u30b8\u30e3\u30fc"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/medium\/b56-u0q9CHIgtbQG.jpg"
          },
          "format": "TV",
          "season": "FALL",
          "seasonYear": 2003,
          "favourites": 10,
          "averageScore": 52,
          "episodes": 13
        },
        {
          "title": {
            "romaji": "BECK",
            "english": "Beck: Mongolian Chop Squad",
            "native": "BECK"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx57-HhnvbHS4ujea.png"
          },
          "format": "TV",
          "season": "FALL",
          "seasonYear": 2004,
          "favourites": 1764,
          "averageScore": 80,
          "episodes": 26
        },
        {
          "title": {
            "romaji": "BLUE GENDER",
            "english": "Blue Gender",
            "native": "BLUE GENDER"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/medium\/b58-2KarB5N1dB0P.jpg"
          },
          "format": "TV",
          "season": "FALL",
          "seasonYear": 1999,
          "favourites": 90,
          "averageScore": 65,
          "episodes": 26
        },
        {
          "title": {
            "romaji": "Chobits",
            "english": "Chobits",
            "native": "\u3061\u3087\u3073\u3063\u30c4"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/nx59-0J95ZHgt4uyP.jpg"
          },
          "format": "TV",
          "season": "SPRING",
          "seasonYear": 2002,
          "favourites": 1002,
          "averageScore": 70,
          "episodes": 26
        },
        {
          "title": {
            "romaji": "Chrno Crusade",
            "english": "Chrono Crusade",
            "native": "\u30af\u30ed\u30ce\u30af\u30eb\u30bb\u30a4\u30c9"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx60-N28VFNCZyvhI.png"
          },
          "format": "TV",
          "season": "FALL",
          "seasonYear": 2003,
          "favourites": 256,
          "averageScore": 71,
          "episodes": 24
        },
        {
          "title": {
            "romaji": "D.N.Angel",
            "english": "D.N.Angel",
            "native": "\uff24\u30fb\uff2e\u30fb\uff21\uff2e\uff27\uff25\uff2c"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/medium\/61.jpg"
          },
          "format": "TV",
          "season": "SPRING",
          "seasonYear": 2003,
          "favourites": 177,
          "averageScore": 66,
          "episodes": 26
        },
        {
          "title": {
            "romaji": "D.C.: Da Capo",
            "english": "D.C.~Da Capo~",
            "native": "D.C.\uff5e\u30c0\u30fb\u30ab\u30fc\u30dd\uff5e"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx62-llr25zE9LOm1.png"
          },
          "format": "TV",
          "season": "SUMMER",
          "seasonYear": 2003,
          "favourites": 44,
          "averageScore": 61,
          "episodes": 26
        },
        {
          "title": {
            "romaji": "DearS",
            "english": null,
            "native": "\u30c7\u30a3\u30a2\u30fc\u30ba"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx63-2EYTwbAK4CLR.jpg"
          },
          "format": "TV",
          "season": "SUMMER",
          "seasonYear": 2004,
          "favourites": 113,
          "averageScore": 59,
          "episodes": 12
        },
        {
          "title": {
            "romaji": "Rozen Maiden",
            "english": "Rozen Maiden",
            "native": "\u30ed\u30fc\u30bc\u30f3\u30e1\u30a4\u30c7\u30f3"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx64-i0zBn241OD2x.png"
          },
          "format": "TV",
          "season": "FALL",
          "seasonYear": 2004,
          "favourites": 306,
          "averageScore": 69,
          "episodes": 12
        },
        {
          "title": {
            "romaji": "Rozen Maiden: Tr\u00e4umend",
            "english": "Rozen Maiden: Dreaming",
            "native": "\u30ed\u30fc\u30bc\u30f3\u30e1\u30a4\u30c7\u30f3 ~ \u30c8\u30ed\u30a4\u30e1\u30f3\u30c8"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx65-SnVu0Txb00nV.jpg"
          },
          "format": "TV",
          "season": "FALL",
          "seasonYear": 2005,
          "favourites": 94,
          "averageScore": 72,
          "episodes": 12
        },
        {
          "title": {
            "romaji": "Azumanga Daiou THE ANIMATION",
            "english": "Azumanga Daioh",
            "native": "\u3042\u305a\u307e\u3093\u304c\u5927\u738b THE ANIMATION"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx66-1LTNhVTnttZv.png"
          },
          "format": "TV",
          "season": "SPRING",
          "seasonYear": 2002,
          "favourites": 1679,
          "averageScore": 77,
          "episodes": 26
        },
        {
          "title": {
            "romaji": "Basilisk: Kouga Ninpouchou",
            "english": "Basilisk",
            "native": "\u30d0\u30b8\u30ea\u30b9\u30af \u7532\u8cc0\u5fcd\u6cd5\u5e16"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/nx67-aBz3s2hBTtdH.jpg"
          },
          "format": "TV",
          "season": "SPRING",
          "seasonYear": 2005,
          "favourites": 256,
          "averageScore": 71,
          "episodes": 24
        },
        {
          "title": {
            "romaji": "Black Cat",
            "english": "Black Cat",
            "native": "\u30d6\u30e9\u30c3\u30af\u30ad\u30e3\u30c3\u30c8"
          },
          "coverImage": {
            "extraLarge": "https:\/\/s4.anilist.co\/file\/anilistcdn\/media\/anime\/cover\/large\/bx68-DKUkbrlNTPSy.png"
          },
          "format": "TV",
          "season": "FALL",
          "seasonYear": 2005,
          "favourites": 340,
          "averageScore": 69,
          "episodes": 23
        }
      ]
 ''';
