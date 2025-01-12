import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruits_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruits_dashboard/features/add_product/presentation/manger/cubit/add_product_cubit.dart';
import 'package:fruits_dashboard/features/add_product/presentation/widgets/image_field.dart';
import 'package:fruits_dashboard/features/add_product/presentation/widgets/is_featured_check_box.dart';
import 'package:fruits_dashboard/features/add_product/presentation/widgets/is_organic_check_box.dart';
import 'package:gap/gap.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String name, code, description;
  late num price, expirationMonths, numberOfCaloires, unitAmount;
  File? image;
  bool isFeatured = false;
  bool isOrganic = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                  onSaved: (value) {
                    name = value!;
                  },
                  hintText: "Product name",
                  textInputType: TextInputType.text),
              const Gap(16),
              CustomTextFormField(
                  onSaved: (value) {
                    price = num.parse(value!);
                  },
                  hintText: "Product price",
                  textInputType: TextInputType.number),
              const Gap(16),
              CustomTextFormField(
                  onSaved: (value) {
                    expirationMonths = num.parse(value!);
                  },
                  hintText: "Expiration Moths",
                  textInputType: TextInputType.number),
              const Gap(16),
              CustomTextFormField(
                  onSaved: (value) {
                    numberOfCaloires = num.parse(value!);
                  },
                  hintText: "Number Of Caloires",
                  textInputType: TextInputType.number),
              const Gap(16),
              CustomTextFormField(
                  onSaved: (value) {
                    unitAmount = num.parse(value!);
                  },
                  hintText: "Unit Amount",
                  textInputType: TextInputType.number),
              const Gap(16),
              CustomTextFormField(
                  onSaved: (value) {
                    code = value!.toLowerCase();
                  },
                  hintText: "Product Code",
                  textInputType: TextInputType.number),
              const Gap(16),
              CustomTextFormField(
                onSaved: (value) {
                  description = value!;
                },
                hintText: "Product Description",
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              const Gap(16),
              IsOrganicCheckBox(
                onChanged: (value) {
                  isOrganic = value;
                },
              ),
              const Gap(16),
              IsFeaturedCheckBox(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),
              const Gap(16),
              ImageField(
                onFileChanged: (image) {
                  this.image = image;
                },
              ),
              const Gap(25),
              CustomButton(
                  text: "Add Product",
                  onPressed: () {
                    if (image != null) {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        AddProductInputEntity input = AddProductInputEntity(
                          name: name,
                          reviews: [],
                          isOrganic: isOrganic,
                          code: code,
                          description: description,
                          expirationsMonths: expirationMonths.toInt(),
                          numberOfCalories: numberOfCaloires.toInt(),
                          unitAmount: unitAmount.toInt(),
                          price: price,
                          image: image!,
                          isFeatured: isFeatured,
                        );
                        context.read<AddProductCubit>().addProduct(input);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    } else {
                      showError(context);
                    }
                  }),
              const Gap(25),
            ],
          ),
        ),
      ),
    );
  }
}

void showError(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text("من فضلك ادخل صوره "),
  ));
}
