import 'package:flutter/material.dart';

import '../../../../../core/widgets/images_horizontal_list_view.dart';
import '../../manager/add_product/add_product_bloc.dart';

class AddProductViewImages extends StatelessWidget {
  const AddProductViewImages({super.key, required this.addProduct});

  final AddProductBloc addProduct;

  @override
  Widget build(BuildContext context) {
    return ImagesHorizontalListView(
      horizontal: 24,
      children: addProduct.images!
          .asMap()
          .entries
          .map((e) => ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    Image.file(e.value,
                        height: 100, width: 100, fit: BoxFit.fill),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: GestureDetector(
                        onTap: () => addProduct.add(RemoveImageEvent(e.key)),
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
