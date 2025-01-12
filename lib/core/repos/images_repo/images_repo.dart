import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/core/errors/failures.dart';

abstract class ImagesRepo {
  Future<Either<Failure,String>> upLoadImage(File image);
}
