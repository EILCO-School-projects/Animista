const String searchAnime = r'''
query searchAnime(
    $search: String,
    $page: Int,
    $perPage: Int,
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
            search: $search,
            seasonYear: $seasonYear,
            isAdult: $isAdult,
            sort: $sort,
            format_in: $format_in
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
