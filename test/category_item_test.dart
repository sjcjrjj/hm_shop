import 'package:hm_shop/viewmodels/home.dart';

void main() {
  final category = CategoryItem.fromJSON({
    'id': '1',
    'name': '服装',
    'picture': 'https://example.com/category.png',
    'children': [
      {
        'id': '2',
        'name': '裙装',
        'picture': 'https://example.com/child.png',
        'children': null,
      },
    ],
  });

  if (category.children.length != 1 || category.children.first.name != '裙装') {
    throw StateError('Nested category parsing failed');
  }
}
