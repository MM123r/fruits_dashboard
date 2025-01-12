import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_dashboard/core/services/get_it_service.dart';
import 'package:fruits_dashboard/core/utils/colors.dart';
import 'package:fruits_dashboard/features/add_product/presentation/manger/cubit/add_product_cubit.dart';
import 'package:fruits_dashboard/features/add_product/presentation/widgets/add_product_view_body_bloc_builder.dart';

class AddProductView extends StatelessWidget{
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: AppColors.whiteColor,
    appBar: AppBar(
      backgroundColor: AppColors.whiteColor,
      centerTitle: true,
      title: const Text("Add Product"),
    ),
    body: BlocProvider(
      create: (context) => AddProductCubit(
        getIt.get<ImagesRepo>(),
        getIt.get<ProductRepo>()
        ),
      child: const AddProductViewBodyblocBuilder()),
   );
  }
}
