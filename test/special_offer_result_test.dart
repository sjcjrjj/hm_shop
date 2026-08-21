import 'package:hm_shop/viewmodels/home.dart';

void main() {
  final result = SpecialOfferResult.fromJSON({
    'id': '897682543',
    'title': '特惠推荐',
    'subTypes': [
      {
        'id': '912000341',
        'title': '抢先尝鲜',
        'goodsItems': {
          'counts': 459,
          'pageSize': 10,
          'pages': 46,
          'page': 1,
          'items': [
            {
              'id': '1750713979497349120',
              'name': '测试商品',
              'desc': null,
              'price': '1566.00',
              'picture': 'https://example.com/p1.png',
              'orderNum': 15,
            },
          ],
        },
      },
    ],
  });

  if (result.title != '特惠推荐' || result.subTypes.length != 1) {
    throw StateError('Special offer root parsing failed');
  }

  final goods = result.subTypes.first.goodsItems;
  if (goods.counts != 459 ||
      goods.items.length != 1 ||
      goods.items.first.desc != '' ||
      goods.items.first.orderNum != 15) {
    throw StateError('Special offer goods parsing failed');
  }
}
