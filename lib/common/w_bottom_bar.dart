import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges; //별칭 주기 : 이 파일의 오브젝트에 접근가능

class BottomBar extends StatelessWidget {
  //현재 선택된 index
  //카트에 담긴 상품 갯수
  //클릭 이벤트
  final int currentIndex;
  final String cartTotal;
  final Function(int index)? onTap;

  const BottomBar(
      {super.key,
      required this.currentIndex,
      required this.cartTotal,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex, // 현재 index 값 전달
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'Catalog',
          ),
          BottomNavigationBarItem(
            icon: badges.Badge(
              badgeContent: Text(//badgeContent를 text로 할거야 
                cartTotal,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              child: const Icon(Icons.shopping_cart),
            ),
            label: 'Cart',
          ),
        ]);
  }
}
