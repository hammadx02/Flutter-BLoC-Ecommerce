part of 'home_bloc.dart';

sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
 final ProductDataModel clickedProduct;

  HomeProductWishlistButtonClickedEvent({required this.clickedProduct});
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeProductCartButtonClickedEvent({required this.clickedProduct});
}

class HomeProductWishlistButtonNavigateEvent extends HomeEvent {}

class HomeProductCartButtonNavigateEvent extends HomeEvent {}
