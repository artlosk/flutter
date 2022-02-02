import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_redux/actions/cart_action.dart';
import 'package:state_redux/actions/tab_action.dart';
import 'package:state_redux/models/product_data.dart';
import 'package:state_redux/states/common_state.dart';
import 'package:state_redux/views/product_info.dart';

class ProductItem extends StatelessWidget {
  final ProductData product;
  final bool btnMore;

  const ProductItem({Key? key, required this.product, required this.btnMore})
      : super(key: key);

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
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset('assets/images/${product.image}',
                  height: 150, width: double.infinity, fit: BoxFit.contain),
            ),
          ),
          const Divider(thickness: 1),
          Container(
            height: 40,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5.0),
            color: Colors.white,
            child: Text(
              product.title,
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
                    text: product.price.toInt().toString(),
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
          SizedBox(
            height: 40,
            child: ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(
                  const Size(double.infinity, 30),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                ),
              ),
              child: const Text(
                'Добавить в корзину',
                style: TextStyle(fontSize: 12),
              ),
              onPressed: () {
                StoreProvider.of<CommonState>(context)
                    .dispatch(AddProductAction(product));
                StoreProvider.of<CommonState>(context)
                    .dispatch(ChangeCartLabelAction());
              },
            ),
          ),
          if (btnMore)
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
          if (btnMore)
            SizedBox(
              height: 30,
              child: ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                    const Size(double.infinity, 30),
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
                      builder: (_) => ProductInfo(product: product)));
                },
              ),
            ),
        ],
      ),
    );
  }
}
