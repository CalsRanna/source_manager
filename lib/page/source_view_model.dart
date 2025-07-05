import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:signals/signals.dart';
import 'package:source_manager/api/api.dart';
import 'package:source_manager/model/debug_result.dart';
import 'package:source_manager/model/source.dart';
import 'package:source_manager/page/source_page.dart';
import 'package:source_manager/util/dialog_util.dart';
import 'package:source_manager/util/toast_util.dart';

class SourceViewModel {
  final sources = signal(<Source>[]);
  final index = signal(-1);
  final results = signal(<DebugResult>[]);

  late final canDelete = computed(() {
    return index.value >= 0 && index.value < sources.value.length;
  });
  late final selectedSource = computed(() {
    if (sources.value.isEmpty) return Source();
    if (index.value < 0) return Source();
    if (index.value >= sources.value.length) return Source();
    return sources.value[index.value];
  });

  final idController = TextEditingController();
  final nameController = TextEditingController();
  final urlController = TextEditingController();
  final enabledController = TextEditingController();
  final exploreEnabledController = TextEditingController();
  final typeController = TextEditingController();
  final commentController = TextEditingController();
  final headerController = TextEditingController();
  final charsetController = TextEditingController();
  final searchUrlController = TextEditingController();
  final searchMethodController = TextEditingController();
  final searchBooksController = TextEditingController();
  final searchNameController = TextEditingController();
  final searchAuthorController = TextEditingController();
  final searchCategoryController = TextEditingController();
  final searchWordCountController = TextEditingController();
  final searchIntroductionController = TextEditingController();
  final searchCoverController = TextEditingController();
  final searchInformationUrlController = TextEditingController();
  final searchLatestChapterController = TextEditingController();
  final informationMethodController = TextEditingController();
  final informationNameController = TextEditingController();
  final informationAuthorController = TextEditingController();
  final informationCategoryController = TextEditingController();
  final informationWordCountController = TextEditingController();
  final informationLatestChapterController = TextEditingController();
  final informationIntroductionController = TextEditingController();
  final informationCoverController = TextEditingController();
  final informationCatalogueUrlController = TextEditingController();
  final catalogueMethodController = TextEditingController();
  final catalogueChaptersController = TextEditingController();
  final catalogueNameController = TextEditingController();
  final catalogueUrlController = TextEditingController();
  final catalogueUpdatedAtController = TextEditingController();
  final cataloguePaginationController = TextEditingController();
  final cataloguePaginationValidationController = TextEditingController();
  final cataloguePresetController = TextEditingController();
  final contentMethodController = TextEditingController();
  final contentContentController = TextEditingController();
  final contentPaginationController = TextEditingController();
  final contentPaginationValidationController = TextEditingController();
  final exploreJsonController = TextEditingController();

  void createSource() {
    index.value = sources.value.length;
    _updateControllers();
  }

  Future<void> debugSource() async {
    DialogUtil.instance.loading();
    try {
      results.value = [];
      scaffoldKey.currentState!.openEndDrawer();
      var result = await Api().debugSource(selectedSource.value.id);
      results.value = [result];
      var json = jsonDecode(result.json);
      if (json is List) {
        var url = json[0]['url'];
        var informationResult = await Api().debugSource(
          selectedSource.value.id,
          type: 'detail',
          url: url,
        );
        results.value = [result, informationResult];
        json = jsonDecode(informationResult.json);
        if (json is Map) {
          var url = json['catalogue_url'];
          var catalogueResult = await Api().debugSource(
            selectedSource.value.id,
            type: 'chapter',
            url: url,
          );
          results.value = [result, informationResult, catalogueResult];
          json = jsonDecode(catalogueResult.json);
          if (json is List) {
            var url = json[0]['url'];
            var contentResult = await Api().debugSource(
              selectedSource.value.id,
              type: 'content',
              url: url,
            );
            results.value = [
              result,
              informationResult,
              catalogueResult,
              contentResult
            ];
          }
        }
      }
      DialogUtil.instance.dismiss();
    } catch (e) {
      DialogUtil.instance.dismiss();
    }
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
      _updateControllers();
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
      _updateControllers();
    }
  }

  void selectSource(int index) {
    this.index.value = index;
    _updateControllers();
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

  void _updateControllers() {
    idController.text = selectedSource.value.id.toString();
    nameController.text = selectedSource.value.name;
    urlController.text = selectedSource.value.url;
    enabledController.text = selectedSource.value.enabled.toString();
    exploreEnabledController.text =
        selectedSource.value.exploreEnabled.toString();
    typeController.text = selectedSource.value.type;
    commentController.text = selectedSource.value.comment;
    headerController.text = selectedSource.value.header;
    charsetController.text = selectedSource.value.charset;
    searchUrlController.text = selectedSource.value.searchUrl;
    searchMethodController.text = selectedSource.value.searchMethod;
    searchBooksController.text = selectedSource.value.searchBooks;
    searchNameController.text = selectedSource.value.searchName;
    searchAuthorController.text = selectedSource.value.searchAuthor;
    searchCategoryController.text = selectedSource.value.searchCategory;
    searchWordCountController.text = selectedSource.value.searchWordCount;
    searchIntroductionController.text = selectedSource.value.searchIntroduction;
    searchCoverController.text = selectedSource.value.searchCover;
    searchInformationUrlController.text =
        selectedSource.value.searchInformationUrl;
    searchLatestChapterController.text =
        selectedSource.value.searchLatestChapter;
    informationMethodController.text = selectedSource.value.informationMethod;
    informationNameController.text = selectedSource.value.informationName;
    informationAuthorController.text = selectedSource.value.informationAuthor;
    informationCategoryController.text =
        selectedSource.value.informationCategory;
    informationWordCountController.text =
        selectedSource.value.informationWordCount;
    informationLatestChapterController.text =
        selectedSource.value.informationLatestChapter;
    informationIntroductionController.text =
        selectedSource.value.informationIntroduction;
    informationCoverController.text = selectedSource.value.informationCover;
    informationCatalogueUrlController.text =
        selectedSource.value.informationCatalogueUrl;
    catalogueMethodController.text = selectedSource.value.catalogueMethod;
    catalogueChaptersController.text = selectedSource.value.catalogueChapters;
    catalogueNameController.text = selectedSource.value.catalogueName;
    catalogueUrlController.text = selectedSource.value.catalogueUrl;
    catalogueUpdatedAtController.text = selectedSource.value.catalogueUpdatedAt;
    cataloguePaginationController.text =
        selectedSource.value.cataloguePagination;
    cataloguePaginationValidationController.text =
        selectedSource.value.cataloguePaginationValidation;
    cataloguePresetController.text = selectedSource.value.cataloguePreset;
    contentMethodController.text = selectedSource.value.contentMethod;
    contentContentController.text = selectedSource.value.contentContent;
    contentPaginationController.text = selectedSource.value.contentPagination;
    contentPaginationValidationController.text =
        selectedSource.value.contentPaginationValidation;
    exploreJsonController.text = selectedSource.value.exploreJson;
  }

  void openDialog(String content) {
    DialogUtil.instance.show(
      FractionallySizedBox(
        widthFactor: 0.6,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Text(content),
        ),
      ),
    );
  }
}
