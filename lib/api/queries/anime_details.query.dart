const String getAnimeDetails = r'''
query getAnimeDetails(
    $id: Int
) {
    Media(
        id: $id
    ) {
        id
        title {
            romaji
            english
            native
        }
        coverImage {
            extraLarge
        }
        seasonYear
        format
        episodes
        averageScore
        favourites
        popularity
        description
        genres
        duration
        source
        status
        startDate {
            day
            month
            year
        }
        endDate {
            day
            month
            year
        }
        season
    }
}
''';
