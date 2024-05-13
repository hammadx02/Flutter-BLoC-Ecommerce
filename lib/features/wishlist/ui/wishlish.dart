import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ecommerce/features/Wishlist/ui/Wishlist_tile_widget.dart';
import 'package:flutter_bloc_ecommerce/features/wishlist/bloc/wishlist_bloc.dart';


class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Wishlist Items'),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        listener: (context, state) {
          
        },
        listenWhen: (previous, current) => current is WishlistSuccessState,
        buildWhen: (previous, current) => current is! WishlistSuccessState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return WishlistTileWidget(
                    productDataModel: successState.WishlistItems[index],
                     wishlistBloc: wishlistBloc,
                  );
                },
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
