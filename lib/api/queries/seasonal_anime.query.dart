const String getSeasonalAnime = r'''
query getSeasonalAnime(
    $page: Int,
    $perPage: Int,
    $season : MediaSeason,
    $seasonYear : Int,
    $isAdult: Boolean,
    $sort : [MediaSort],
    $format_in : [MediaFormat]
) {
    Page(
        page: $page,
        perPage: $perPage
    ) {
        media(
            season: $season,
            seasonYear: $seasonYear,
            isAdult: $isAdult,
            sort: $sort,
            format_in: $format_in
        ) {
            id
            title {
                english
            }
            coverImage {
                extraLarge
            }
            format
            season
            seasonYear
            favourites
            averageScore
            episodes
        }
    }
}
''';
