import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashboard/core/helper_functions/build_bar.dart';
import 'package:fruits_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:fruits_dashboard/features/add_product/presentation/manger/cubit/add_product_cubit.dart';
import 'package:fruits_dashboard/features/add_product/presentation/widgets/add_product_view_body.dart';

class AddProductViewBodyblocBuilder extends StatelessWidget {
  const AddProductViewBodyblocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSucceess) {
          buildBar(context, "Product Added Successfully");
          log("Successfully");
        }
        if (state is AddProductFailure) {
          buildBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is AddProductLoading,
            child: const AddProductViewBody());
      },
    );
  }
}
