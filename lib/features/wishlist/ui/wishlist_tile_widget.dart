import 'package:flutter/material.dart';
import 'package:flutter_bloc_ecommerce/features/home/models/home_product_data_model.dart';
import 'package:flutter_bloc_ecommerce/features/wishlist/bloc/wishlist_bloc.dart';


class WishlistTileWidget extends StatefulWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;
  const WishlistTileWidget(
      {super.key, required this.productDataModel, required this.wishlistBloc});

  @override
  State<WishlistTileWidget> createState() => _WishlistTileWidgetState();
}

class _WishlistTileWidgetState extends State<WishlistTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black,),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  widget.productDataModel.imageUrl,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            widget.productDataModel.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(widget.productDataModel.description),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${widget.productDataModel.price}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      widget.wishlistBloc.add(
                        RemoveFromWishlistEvent(
                          productDataModel: widget.productDataModel,
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.favorite,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
