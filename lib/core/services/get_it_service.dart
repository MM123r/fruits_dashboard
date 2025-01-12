
import 'package:fruits_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruits_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_dashboard/core/repos/product_repo/product_repo_impl.dart';
import 'package:fruits_dashboard/core/services/data_service.dart';
import 'package:fruits_dashboard/core/services/firestore_service.dart';
import 'package:fruits_dashboard/core/services/storage_service.dart';
import 'package:fruits_dashboard/core/services/supabase_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {                       // Switch Service
  getIt.registerSingleton<StorageService>(SupabaseStorageService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt.registerSingleton<ImagesRepo>(ImagesRepoImpl(getIt.get<StorageService>()));
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(
      getIt.get<DatabaseService>(),
    )
    
    );
 
}