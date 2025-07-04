import 'package:flutter/material.dart';
import 'package:signals/signals.dart';
import 'package:source_manager/api/api.dart';
import 'package:source_manager/model/source.dart';
import 'package:source_manager/page/source_page.dart';
import 'package:source_manager/util/dialog_util.dart';
import 'package:source_manager/util/toast_util.dart';

class SourceViewModel {
  final sources = signal(<Source>[]);
  final index = signal(-1);

  late final canDelete = computed(() {
    return index.value >= 0 && index.value < sources.value.length;
  });
  late final selectedSource = computed(() {
    if (sources.value.isEmpty) return Source();
    if (index.value < 0) return Source();
    if (index.value >= sources.value.length) return Source();
    return sources.value[index.value];
  });

  void createSource() {
    index.value = sources.value.length;
  }

  void debugSource() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  Future<void> destroySource(BuildContext context) async {
    var result = await DialogUtil.instance.confirm(
      'Delete Source',
      'Are you sure you want to delete this source?',
    );
    if (result == false) return;
    try {
      await Api().destroySource(selectedSource.value.id);
      sources.value = await Api().getSources();
      index.value = 0;
      if (!context.mounted) return;
      ToastUtil.instance.message('Source deleted successfully');
    } catch (e) {
      if (!context.mounted) return;
      ToastUtil.instance.notification('Error', e.toString());
    }
  }

  Future<void> initSignals() async {
    sources.value = await Api().getSources();
    if (sources.value.isNotEmpty) {
      index.value = 0;
    }
  }

  void selectSource(int index) {
    this.index.value = index;
  }

  Future<void> storeSource(BuildContext context, Source source) async {
    if (source.name.isEmpty) {
      ToastUtil.instance.notification('Warning', 'Please enter a source name');
      return;
    }
    if (source.id != 0) {
      await _updateSource(context, source);
      return;
    }
    try {
      await Api().storeSource(source);
      sources.value = await Api().getSources();
      if (!context.mounted) return;
      ToastUtil.instance.message('Source stored successfully');
    } catch (e) {
      if (!context.mounted) return;
      ToastUtil.instance.notification('Error', e.toString());
    }
  }

  Future<void> _updateSource(BuildContext context, Source source) async {
    try {
      await Api().updateSource(source);
      sources.value = await Api().getSources();
      if (!context.mounted) return;
      ToastUtil.instance.message('Source updated successfully');
    } catch (e) {
      if (!context.mounted) return;
      ToastUtil.instance.notification('Error', e.toString());
    }
  }
}
