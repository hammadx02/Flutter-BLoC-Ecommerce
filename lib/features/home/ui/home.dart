import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ecommerce/features/cart/ui/cart.dart';
import 'package:flutter_bloc_ecommerce/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_ecommerce/features/home/ui/product_tile_widget.dart';
import 'package:flutter_bloc_ecommerce/features/wishlist/ui/wishlish.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const Cart()),
            ),
          );
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const Wishlist()),
            ),
          );
        }
        else if (state is HomeProductItemCartedActionState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item added to cart'),),);
        } else if (state is HomeProductItemWishlistedActionState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item added to wishlist'),),);
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: const Text('Grocery App'),
              
                actions: [
                  IconButton(
                    onPressed: () {
                      HomeProductWishlistButtonNavigateEvent();
                    },
                    icon: const Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      HomeProductCartButtonNavigateEvent();
                    },
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                        color: Colors.white,
                    ),
                  ),
                ],
              ),
              body: ListView.builder( itemCount: successState.products.length,itemBuilder: (context, index) {
                    return ProductTileWidget(
                        productDataModel: successState.products[index],
                        homeBloc: homeBloc);
                  })
             
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Some error occured'),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
