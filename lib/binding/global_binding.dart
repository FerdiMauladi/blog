import 'package:blog/data/network_core.dart';
import 'package:blog/data/repository/repository.dart';
import 'package:blog/data/repository/repository_impl.dart';
import 'package:blog/data/storage_core.dart';
import 'package:get/get.dart';


class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NetworkCore>(NetworkCore(), permanent: true);
    Get.put<StorageCore>(StorageCore(), permanent: true);
    Get.put<Repository>(RepositoryImpl(), permanent: true);
  }
}