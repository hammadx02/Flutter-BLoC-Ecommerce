part of 'wishlist_bloc.dart';


sealed class WishlistEvent {}
class WishlistInitialEvent extends WishlistEvent {

}

class RemoveFromWishlistEvent extends WishlistEvent {
  final ProductDataModel productDataModel;

  RemoveFromWishlistEvent({required this.productDataModel});
}