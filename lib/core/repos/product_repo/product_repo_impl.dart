import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/core/errors/failures.dart';
import 'package:fruits_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_dashboard/core/services/data_service.dart';
import 'package:fruits_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruits_dashboard/features/add_product/data/models/add_product_input_model.dart';
import 'package:fruits_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, void>> addProduct(
      AddProductInputEntity addProductInputEntity) async {
    try {
      await databaseService.addData(
          path: BackendEndpoint.productsCollection,
          data:
              AddProductInputModel.fromEntity(addProductInputEntity).toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("نأسف لقد فشل اضافة المنتج"));
    }
  }
}
