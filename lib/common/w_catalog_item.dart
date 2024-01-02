import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:flutter/material.dart';

class CatalogItem extends StatelessWidget {
  // 속성 색상, 타이틀 --> Catalog 라는 객체로 만들어놨음
  final Catalog catalog;
  final bool isInCart; // 카트에 담겼는지 확인
  final void Function(Catalog catalog) onPressedCatalog;

  const CatalogItem(
      {super.key,
      required this.catalog,
      required this.isInCart,
      required this.onPressedCatalog});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      //const : 메모리 효율적으로 사용
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ]),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            color: catalog.color,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Text(
              catalog.title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          InkWell(
            onTap: () {
              print("${catalog.title} : 이벤트 발생");
              onPressedCatalog(catalog);
            },
            child: Text(
              isInCart ? '✓' : 'ADD',
              style: TextStyle(
                color: isInCart ? Colors.grey : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
