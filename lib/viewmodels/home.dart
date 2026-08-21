class BannerItem {
  String id;
  String imgurl;
  BannerItem({required this.id, required this.imgurl});

  factory BannerItem.fromJSON(Map<String, dynamic> json) {
    return BannerItem(id: json["id"] ?? "", imgurl: json["imgUrl"] ?? "");
  }
}

class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem> children;
  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children = const [],
  });

  factory CategoryItem.fromJSON(Map<String, dynamic> json) {
    return CategoryItem(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      picture: json["picture"] ?? "",
      children:
          (json["children"] as List?)
              ?.map((e) => CategoryItem.fromJSON(e as Map<String, dynamic>))
              .toList() ??
          <CategoryItem>[],
    );
  }
}
