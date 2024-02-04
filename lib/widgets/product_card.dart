import 'package:auto_ch_tech_assesment/core/app_export.dart';
import 'package:auto_ch_tech_assesment/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  ProductCard(
      {Key? key,
      required this.makes,
      this.widthFactor = 2.5,
      this.tagWidthFactor = 70,
      this.isWishlist = false})
      : super(key: key);

  final double widthFactor;
  final double tagWidthFactor;
  final MakeList makes;
  final bool isWishlist;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: makes);
      },
      child: Stack(
        children: [
          CustomImageView(),
          SizedBox(
            width: MediaQuery.of(context).size.width / widthFactor,
            height: 180,
            child: Image.network(
              makes.imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: tagWidthFactor,
            child: Container(
              width: MediaQuery.of(context).size.width / widthFactor,
              height: 50,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
            ),
          ),
          Positioned(
            top: 5,
            left: 5,
            right: tagWidthFactor + 5,
            child: Container(
              width: 5,
              height: 40,
              decoration: const BoxDecoration(color: Colors.black),
              child: Row(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Text(
                          makes.name!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      Text(
                        '₦${makes.id}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  // Expanded(
                  //     flex: 5,
                  //     child: BlocBuilder<CartBloc, CartState>(
                  //       builder: (context, state) {
                  //         if (state is CartLoading) {
                  //           return const CircularProgressIndicator();
                  //         }
                  //         if (state is CartLoaded) {
                  //           return IconButton(
                  //               onPressed: () {
                  //                 context
                  //                     .read<CartBloc>()
                  //                     .add(CartProductAdded(products));
                  //               },
                  //               icon: const Icon(
                  //                 Icons.add_circle_rounded,
                  //                 color: Colors.white,
                  //               ));
                  //         } else {
                  //           return const Text('something went wrong');
                  //         }
                  //       },
                  //     )),
                  // isWishlist
                  //     ? BlocBuilder<WishlistBloc, WishlistState>(
                  //         builder: (context, state) {
                  //           return IconButton(
                  //               onPressed: () {
                  //                 context
                  //                     .read<WishlistBloc>()
                  //                     .add(RemoveFreomWishlist(products));
                  //               },
                  //               icon: const Icon(
                  //                 Icons.delete,
                  //                 color: Colors.white,
                  //               ));
                  //         },
                  //       )
                  //     : const SizedBox(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
