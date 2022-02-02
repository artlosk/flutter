import 'package:state_redux/actions/cart_action.dart';
import 'package:state_redux/actions/tab_action.dart';
import 'package:state_redux/models/cart_product.dart';
import 'package:state_redux/states/common_state.dart';
import 'package:state_redux/views/product_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CartItem extends StatelessWidget {
  final CartProduct product;

  const CartItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26, width: 2.0),
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5.0),
            color: Colors.white,
            child: Text(
              product.product.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5.0),
            color: Colors.white,
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: product.product.price.toInt().toString(),
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(text: ' RUB')
                ],
              ),
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity / 50, 30),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0))),
                      ),
                    ),
                    child: const Text(
                      'Удалить',
                      style: TextStyle(fontSize: 12),
                    ),
                    onPressed: () {
                      StoreProvider.of<CommonState>(context)
                          .dispatch(DeleteProductAction(product.product.id));
                      StoreProvider.of<CommonState>(context)
                          .dispatch(ChangeCartLabelAction());
                    },
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity / 50, 30),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0))),
                      ),
                    ),
                    child: const Text(
                      'Подробнее',
                      style: TextStyle(fontSize: 12),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) =>
                              ProductInfo(product: product.product)));
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  const TextSpan(text: 'Кол-во добавленного товара: '),
                  TextSpan(
                      text: product.qty.toInt().toString(),
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
