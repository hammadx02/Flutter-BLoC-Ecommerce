import 'dart:async';

import 'package:bloc/bloc.dart';


part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
   on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);
   on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
   on<HomeProductWishlistButtonNavigateEvent>(homeProductWishlistButtonNavigateEvent);
   on<HomeProductCartButtonNavigateEvent>(homeProductCartButtonNavigateEvent);
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Product Wishlist Button Clicked');
  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
      print('Product Cart Button Clicked');
  }

  FutureOr<void> homeProductWishlistButtonNavigateEvent(HomeProductWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
      print('Product Wishlist Navigate Clicked');
  }

  FutureOr<void> homeProductCartButtonNavigateEvent(HomeProductCartButtonNavigateEvent event, Emitter<HomeState> emit) {
      print('Product Cart Navigate Clicked');
  }
}
