import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/helper.dart';
import '../../manager/add_product/add_product_bloc.dart';
import 'add_product_list_view_and_button_section.dart';
import 'add_product_view_images.dart';

class AddProductViewBody extends StatelessWidget {
  const AddProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final addProduct = context.read<AddProductBloc>();
    return BlocConsumer<AddProductBloc, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          addProduct.add(ProductDefaultEvent());
          Helper.customSnackBar(context, message: "Product added successfully");
        }
      },
      builder: (context, state) {
        return Form(
          key: addProduct.formKey,
          child: Column(
            children: [
              if (addProduct.images != null && addProduct.images!.isNotEmpty)
                AddProductViewImages(addProduct: addProduct),
              if (addProduct.images != null && addProduct.images!.isNotEmpty)
                const SizedBox(height: 24),
              AddProductListViewAndButtonSection(addProduct: addProduct)
            ],
          ),
        );
      },
    );
  }
}
