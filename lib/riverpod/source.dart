import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:source_manager/api/api.dart';
import 'package:source_manager/model/source.dart';

part 'source.g.dart';

@riverpod
class SourceNotifier extends _$SourceNotifier {
  @override
  Future<Source> build(int id) async {
    var sources = await ref.watch(sourcesNotifierProvider.future);
    var source = sources.where((element) => element.id == id).firstOrNull;
    if (source != null) return source;
    return Api().getSource(id);
  }
}

@riverpod
class SourcesNotifier extends _$SourcesNotifier {
  @override
  Future<List<Source>> build() async {
    return Api().getSources();
  }
}
