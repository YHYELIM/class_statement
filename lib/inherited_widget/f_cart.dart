import 'package:class_statement/common/d_show_alert_dialog.dart';
import 'package:class_statement/common/w_catalog_item.dart';
import 'package:class_statement/inherited_widget/state_management/inh_cart_widget.dart';
import 'package:flutter/material.dart';

import '../common/models/vo_catalog.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print("여기는 Cart Build 실행");
    //BuildContext 안에서 사용해야한다
    InheritedCartWidget? inheritedCartWidget = InheritedCartWidget.of(context);
    // 방어적 코드 처리
    return inheritedCartWidget == null
        ? CustomDialogManager.createAlert(context, '경고', '잘못된접근', () {})
        //리턴 타입은 위젯으로 반환하기 때문에 createAlert 위젯 만들어서 반환
        : Column(
            children: [
              //카탈로그 아이템
              Expanded(
                flex: 5,
                child: ListView.builder(
                    itemCount: inheritedCartWidget.cartList.length,
                    itemBuilder: (context, index) {
                      //하나에 오브젝트만 뽑자
                      Catalog catalog = inheritedCartWidget.cartList[index];
                      return CatalogItem(
                          catalog: catalog,
                          isInCart: true,
                          onPressedCatalog:
                              inheritedCartWidget.onPressedCatalog);
                    }),
              ),

              //구분선
              const Divider(
                height: 1,
                thickness: 1,
                color: Colors.green,
              ),
              //합계
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    'SUM :${inheritedCartWidget.cartList.length}',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          );
  }
}
