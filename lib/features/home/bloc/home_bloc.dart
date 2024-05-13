import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_ecommerce/data/cart_items.dart';
import 'package:flutter_bloc_ecommerce/data/grocery_data.dart';
import 'package:flutter_bloc_ecommerce/data/wishlist_items.dart';
import 'package:flutter_bloc_ecommerce/features/home/models/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishlistButtonNavigateEvent>(
        homeProductWishlistButtonNavigateEvent);
    on<HomeProductCartButtonNavigateEvent>(homeProductCartButtonNavigateEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(
      HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map(
              (e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl'],
              ),
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Product Wishlist Button Clicked');
    wishlistItems.add(event.clickedProduct);
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Product Cart Button Clicked');
    cartItems.add(event.clickedProduct);
  }

  FutureOr<void> homeProductWishlistButtonNavigateEvent(
      HomeProductWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Product Wishlist Navigate Clicked');
  }

  FutureOr<void> homeProductCartButtonNavigateEvent(
      HomeProductCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Product Cart Navigate Clicked');
  }
}
