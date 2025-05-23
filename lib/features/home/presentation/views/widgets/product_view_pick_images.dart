import 'package:flutter/material.dart';

import '../../../../../core/widgets/images_horizontal_list_view.dart';
import '../../manager/product/product_bloc.dart';

class ProductViewsPickImages extends StatelessWidget {
  const ProductViewsPickImages({super.key, required this.productBloc});
  final ProductBloc productBloc;

  @override
  Widget build(BuildContext context) {
    return ImagesHorizontalListView(
      horizontal: 24,
      children: productBloc.images!
          .asMap()
          .entries
          .map((e) => ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    Image.file(e.value,
                        height: 100, width: 100, fit: BoxFit.cover),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: GestureDetector(
                        onTap: () =>
                            productBloc.add(RemovePickImageEvent(e.key)),
                        child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.close, size: 16)),
                      ),
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }
}
