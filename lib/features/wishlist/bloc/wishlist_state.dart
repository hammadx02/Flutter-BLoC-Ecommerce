part of 'wishlist_bloc.dart';


abstract class WishlistState {}

final class WishlistInitial extends WishlistState {}


abstract class WishlistActionState {}



class WishlistSuccessState extends WishlistState {

  final List<ProductDataModel> WishlistItems;

  WishlistSuccessState({required this.WishlistItems});

}