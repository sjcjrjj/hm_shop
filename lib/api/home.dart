import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((
    item,
  ) {
    return BannerItem.fromJSON(item as Map<String, dynamic>);
  }).toList();
}

Future<List<CategoryItem>> getCategoryListAPI() async {
  return ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((
    item,
  ) {
    return CategoryItem.fromJSON(item as Map<String, dynamic>);
  }).toList();
}

Future<SpecialOfferResult> getProductListAPI() async {
  final result = await dioRequest.get(HttpConstants.PRODUCT_LIST);
  return SpecialOfferResult.fromJSON(result as Map<String, dynamic>);
}
