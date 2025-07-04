import 'package:get_it/get_it.dart';
import 'package:source_manager/page/source_view_model.dart';

class DI {
  void ensureInitialized() {
    GetIt.instance
        .registerLazySingleton<SourceViewModel>(() => SourceViewModel());
  }
}
