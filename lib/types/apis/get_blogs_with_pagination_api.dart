class GetBlogsWithPaginationApi {
  int id;
  String? image;
  String? title;
  String? description;
  String? url;
  bool? isBookMarked;
  String? createdAt;

  GetBlogsWithPaginationApi({
    required this.id,
    this.image,
    this.title,
    this.description,
    this.url,
    this.isBookMarked,
    this.createdAt,
  });
}
