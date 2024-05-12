import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ecommerce/features/cart/ui/cart.dart';
import 'package:flutter_bloc_ecommerce/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_ecommerce/features/wishlist/ui/wishlish.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text('Grocery App'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  HomeProductWishlistButtonNavigateEvent();
                },
                icon: const Icon(
                  Icons.favorite_border_rounded,
                ),
              ),
              IconButton(
                onPressed: () {
                  HomeProductCartButtonNavigateEvent();
                },
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
