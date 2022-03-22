import 'package:flutter/material.dart';
import 'package:layer_business/layer_business.dart';
import 'package:lesson12/item_list.dart';
import 'package:lesson12/preloader.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class StreamView extends StatelessWidget {
  StreamView({Key? key, required this.tab});

  final int tab;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ListBlocState>(
      stream: context.read<ListBloc>().state,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final state = snapshot.data;
          return state!.map<Widget>(
            loading: (_) => Preloader(),
            loaded: (state) {
              return ItemList(list: state.userData, tab: tab);
            }
          );
        } else {
          return Preloader();
        }
      },
    );
  }
}
