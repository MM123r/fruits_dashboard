import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/utils/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileChanged});
  final ValueChanged<File?> onFileChanged;
  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? fileImage;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          isLoading = true;
          setState(() {});
          try {
            await prickImage();
          } on Exception catch (e) {
            // TODO
          }
          isLoading = false;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              //height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.primaryColor,
                  )),
              child: fileImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(fileImage!))
                  : const Icon(
                      Icons.image_outlined,
                      size: 100,
                    ),
            ),
            Visibility(
              visible: fileImage != null,
              child: IconButton(
                  onPressed: () {
                    fileImage = null;
                    widget.onFileChanged(fileImage);
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: AppColors.redColor,
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future<void> prickImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    fileImage = File(image!.path);

    widget.onFileChanged(fileImage!);
  }
}
