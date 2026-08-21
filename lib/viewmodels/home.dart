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

class GoodsItem {
  String id;
  String name;
  String desc;
  String price;
  String picture;
  int orderNum;

  GoodsItem({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  factory GoodsItem.fromJSON(Map<String, dynamic> json) {
    return GoodsItem(
      id: json["id"]?.toString() ?? "",
      name: json["name"]?.toString() ?? "",
      desc: json["desc"]?.toString() ?? "",
      price: json["price"]?.toString() ?? "",
      picture: json["picture"]?.toString() ?? "",
      orderNum: int.tryParse(json["orderNum"]?.toString() ?? "0") ?? 0,
    );
  }
}

class GoodsItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<GoodsItem> items;

  GoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    this.items = const [],
  });

  factory GoodsItems.fromJSON(Map<String, dynamic> json) {
    return GoodsItems(
      counts: int.tryParse(json["counts"]?.toString() ?? "0") ?? 0,
      pageSize: int.tryParse(json["pageSize"]?.toString() ?? "0") ?? 0,
      pages: int.tryParse(json["pages"]?.toString() ?? "0") ?? 0,
      page: int.tryParse(json["page"]?.toString() ?? "0") ?? 0,
      items:
          (json["items"] as List?)
              ?.map((e) => GoodsItem.fromJSON(e as Map<String, dynamic>))
              .toList() ??
          <GoodsItem>[],
    );
  }
}

class SubType {
  String id;
  String title;
  GoodsItems goodsItems;

  SubType({required this.id, required this.title, required this.goodsItems});

  factory SubType.fromJSON(Map<String, dynamic> json) {
    return SubType(
      id: json["id"]?.toString() ?? "",
      title: json["title"]?.toString() ?? "",
      goodsItems: GoodsItems.fromJSON(
        json["goodsItems"] as Map<String, dynamic>? ?? <String, dynamic>{},
      ),
    );
  }
}

class SpecialOfferResult {
  String id;
  String title;
  List<SubType> subTypes;

  SpecialOfferResult({
    required this.id,
    required this.title,
    this.subTypes = const [],
  });

  factory SpecialOfferResult.fromJSON(Map<String, dynamic> json) {
    return SpecialOfferResult(
      id: json["id"]?.toString() ?? "",
      title: json["title"]?.toString() ?? "",
      subTypes:
          (json["subTypes"] as List?)
              ?.map((e) => SubType.fromJSON(e as Map<String, dynamic>))
              .toList() ??
          <SubType>[],
    );
  }
}
