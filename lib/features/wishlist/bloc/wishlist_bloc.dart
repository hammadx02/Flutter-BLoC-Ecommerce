import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_ecommerce/data/wishlist_items.dart';
import 'package:flutter_bloc_ecommerce/features/home/models/home_product_data_model.dart';
part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
      on<WishlistInitialEvent>(wishlistInitialEvent);
    on<RemoveFromWishlistEvent>(removeFromWishlistEvent);
  }




  
  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(WishlistItems: wishlistItems));

  }

  FutureOr<void> removeFromWishlistEvent(RemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.productDataModel);
    emit(WishlistSuccessState(WishlistItems: wishlistItems));
  }
}

