class AppUser {
  final String displayName;
  final String email;
  final String photoUrl;
  List<int>? bookmarks;

  AppUser(
      {required this.displayName,
      required this.email,
      required this.photoUrl,
      this.bookmarks});

  factory AppUser.fromJson(Map<Object?, dynamic> json) => AppUser(
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String,
      bookmarks: (json['bookmarks'] as List<dynamic>).cast<int>());
}
