import 'package:flutter/material.dart';
import 'package:source_manager/model/source.dart';
import 'package:source_manager/page/toolbar_view.dart';
import 'package:source_manager/widget/form_item.dart';
import 'package:source_manager/widget/input.dart';
import 'package:source_manager/widget/select.dart';

class SourceInputView extends StatelessWidget {
  final void Function()? onCreate;
  final void Function()? onDebug;
  final void Function()? onDelete;
  final void Function(Source)? onStore;
  final Source source;

  final TextEditingController idController;

  final TextEditingController nameController;
  final TextEditingController urlController;
  final TextEditingController enabledController;
  final TextEditingController exploreEnabledController;
  final TextEditingController typeController;
  final TextEditingController commentController;
  final TextEditingController headerController;
  final TextEditingController charsetController;
  final TextEditingController searchUrlController;
  final TextEditingController searchMethodController;
  final TextEditingController searchBooksController;
  final TextEditingController searchNameController;
  final TextEditingController searchAuthorController;
  final TextEditingController searchCategoryController;
  final TextEditingController searchWordCountController;
  final TextEditingController searchIntroductionController;
  final TextEditingController searchCoverController;
  final TextEditingController searchInformationUrlController;
  final TextEditingController searchLatestChapterController;
  final TextEditingController informationMethodController;
  final TextEditingController informationNameController;
  final TextEditingController informationAuthorController;
  final TextEditingController informationCategoryController;
  final TextEditingController informationWordCountController;
  final TextEditingController informationLatestChapterController;
  final TextEditingController informationIntroductionController;
  final TextEditingController informationCoverController;
  final TextEditingController informationCatalogueUrlController;
  final TextEditingController catalogueMethodController;
  final TextEditingController catalogueChaptersController;
  final TextEditingController catalogueNameController;
  final TextEditingController catalogueUrlController;
  final TextEditingController catalogueUpdatedAtController;
  final TextEditingController cataloguePaginationController;
  final TextEditingController cataloguePaginationValidationController;
  final TextEditingController cataloguePresetController;
  final TextEditingController contentMethodController;
  final TextEditingController contentContentController;
  final TextEditingController contentPaginationController;
  final TextEditingController contentPaginationValidationController;
  final TextEditingController exploreJsonController;

  const SourceInputView({
    super.key,
    this.onCreate,
    this.onDebug,
    this.onDelete,
    this.onStore,
    required this.source,
    required this.idController,
    required this.nameController,
    required this.urlController,
    required this.enabledController,
    required this.exploreEnabledController,
    required this.typeController,
    required this.commentController,
    required this.headerController,
    required this.charsetController,
    required this.searchUrlController,
    required this.searchMethodController,
    required this.searchBooksController,
    required this.searchNameController,
    required this.searchAuthorController,
    required this.searchCategoryController,
    required this.searchWordCountController,
    required this.searchIntroductionController,
    required this.searchCoverController,
    required this.searchInformationUrlController,
    required this.searchLatestChapterController,
    required this.informationMethodController,
    required this.informationNameController,
    required this.informationAuthorController,
    required this.informationCategoryController,
    required this.informationWordCountController,
    required this.informationLatestChapterController,
    required this.informationIntroductionController,
    required this.informationCoverController,
    required this.informationCatalogueUrlController,
    required this.catalogueMethodController,
    required this.catalogueChaptersController,
    required this.catalogueNameController,
    required this.catalogueUrlController,
    required this.catalogueUpdatedAtController,
    required this.cataloguePaginationController,
    required this.cataloguePaginationValidationController,
    required this.cataloguePresetController,
    required this.contentMethodController,
    required this.contentContentController,
    required this.contentPaginationController,
    required this.contentPaginationValidationController,
    required this.exploreJsonController,
  });

  @override
  Widget build(BuildContext context) {
    var idInput = SMInput(
      controller: idController,
      disabled: true,
      placeholder: 'id',
    );
    var nameInput = SMInput(controller: nameController, placeholder: 'name');
    var urlInput = SMInput(controller: urlController, placeholder: 'url');
    var enabledInput = SMSelect(
      controller: enabledController,
      options: [
        SMSelectOption(label: 'true', value: 'true'),
        SMSelectOption(label: 'false', value: 'false'),
      ],
    );
    var exploreEnabledInput = SMSelect(
      controller: exploreEnabledController,
      options: [
        SMSelectOption(label: 'true', value: 'true'),
        SMSelectOption(label: 'false', value: 'false'),
      ],
    );
    var typeInput = SMSelect(
      controller: typeController,
      options: [SMSelectOption(label: 'book', value: 'book')],
    );
    var commentInput = SMInput(
      controller: commentController,
      placeholder: 'comment',
    );
    var headerInput = SMInput(
      controller: headerController,
      placeholder: 'header',
    );
    var charsetInput = SMSelect(
      controller: charsetController,
      options: [
        SMSelectOption(label: 'gbk', value: 'gbk'),
        SMSelectOption(label: 'utf8', value: 'utf8'),
      ],
    );
    var searchUrlInput = SMInput(
      controller: searchUrlController,
      placeholder: 'search url',
    );
    var searchMethodInput = SMSelect(
      controller: searchMethodController,
      options: [
        SMSelectOption(label: 'get', value: 'get'),
        SMSelectOption(label: 'post', value: 'post'),
      ],
    );
    var searchBooksInput = SMInput(
      controller: searchBooksController,
      placeholder: 'search books',
    );
    var searchNameInput = SMInput(
      controller: searchNameController,
      placeholder: 'search name',
    );
    var searchAuthorInput = SMInput(
      controller: searchAuthorController,
      placeholder: 'search author',
    );
    var searchCategoryInput = SMInput(
      controller: searchCategoryController,
      placeholder: 'search category',
    );
    var searchWordCountInput = SMInput(
      controller: searchWordCountController,
      placeholder: 'search word count',
    );
    var searchIntroductionInput = SMInput(
      controller: searchIntroductionController,
      placeholder: 'search introduction',
    );
    var searchCoverInput = SMInput(
      controller: searchCoverController,
      placeholder: 'search cover',
    );
    var searchInformationUrlInput = SMInput(
      controller: searchInformationUrlController,
      placeholder: 'search information url',
    );
    var searchLatestChapterInput = SMInput(
      controller: searchLatestChapterController,
      placeholder: 'search latest chapter',
    );
    var informationMethodInput = SMSelect(
      controller: informationMethodController,
      options: [
        SMSelectOption(label: 'get', value: 'get'),
        SMSelectOption(label: 'post', value: 'post'),
      ],
    );
    var informationNameInput = SMInput(
      controller: informationNameController,
      placeholder: 'information name',
    );
    var informationAuthorInput = SMInput(
      controller: informationAuthorController,
      placeholder: 'information author',
    );
    var informationCategoryInput = SMInput(
      controller: informationCategoryController,
      placeholder: 'information category',
    );
    var informationWordCountInput = SMInput(
      controller: informationWordCountController,
      placeholder: 'information word count',
    );
    var informationLatestChapterInput = SMInput(
      controller: informationLatestChapterController,
      placeholder: 'information latest chapter',
    );
    var informationIntroductionInput = SMInput(
      controller: informationIntroductionController,
      placeholder: 'information introduction',
    );
    var informationCoverInput = SMInput(
      controller: informationCoverController,
      placeholder: 'information cover',
    );
    var informationCatalogueUrlInput = SMInput(
      controller: informationCatalogueUrlController,
      placeholder: 'information catalogue url',
    );
    var catalogueMethodInput = SMSelect(
      controller: catalogueMethodController,
      options: [
        SMSelectOption(label: 'get', value: 'get'),
        SMSelectOption(label: 'post', value: 'post'),
      ],
    );
    var catalogueChaptersInput = SMInput(
      controller: catalogueChaptersController,
      placeholder: 'catalogue chapters',
    );
    var catalogueNameInput = SMInput(
      controller: catalogueNameController,
      placeholder: 'catalogue name',
    );
    var catalogueUrlInput = SMInput(
      controller: catalogueUrlController,
      placeholder: 'catalogue url',
    );
    var catalogueUpdatedAtInput = SMInput(
      controller: catalogueUpdatedAtController,
      placeholder: 'catalogue updated at',
    );
    var cataloguePaginationInput = SMInput(
      controller: cataloguePaginationController,
      placeholder: 'catalogue pagination',
    );
    var cataloguePaginationValidationInput = SMInput(
      controller: cataloguePaginationValidationController,
      placeholder: 'catalogue pagination validation',
    );
    var cataloguePresetInput = SMInput(
      controller: cataloguePresetController,
      placeholder: 'catalogue preset',
    );
    var contentMethodInput = SMSelect(
      controller: contentMethodController,
      options: [
        SMSelectOption(label: 'get', value: 'get'),
        SMSelectOption(label: 'post', value: 'post'),
      ],
    );
    var contentContentInput = SMInput(
      controller: contentContentController,
      placeholder: 'content content',
    );
    var contentPaginationInput = SMInput(
      controller: contentPaginationController,
      placeholder: 'content pagination',
    );
    var contentPaginationValidationInput = SMInput(
      controller: contentPaginationValidationController,
      placeholder: 'content pagination validation',
    );
    var exploreJsonInput = SMInput(
      controller: exploreJsonController,
      placeholder: 'explore json',
    );
    var children = [
      SMFormItem(label: 'id', child: idInput),
      SMFormItem(label: 'name', child: nameInput),
      SMFormItem(label: 'url', child: urlInput),
      SMFormItem(label: 'enabled', child: enabledInput),
      SMFormItem(label: 'explore enabled', child: exploreEnabledInput),
      SMFormItem(label: 'type', child: typeInput),
      SMFormItem(label: 'comment', child: commentInput),
      SMFormItem(label: 'header', child: headerInput),
      SMFormItem(label: 'charset', child: charsetInput),
      SMFormItem(label: 'search url', child: searchUrlInput),
      SMFormItem(label: 'search method', child: searchMethodInput),
      SMFormItem(label: 'search books', child: searchBooksInput),
      SMFormItem(label: 'search name', child: searchNameInput),
      SMFormItem(label: 'search author', child: searchAuthorInput),
      SMFormItem(label: 'search category', child: searchCategoryInput),
      SMFormItem(label: 'search word count', child: searchWordCountInput),
      SMFormItem(label: 'search introduction', child: searchIntroductionInput),
      SMFormItem(label: 'search cover', child: searchCoverInput),
      SMFormItem(
        label: 'search information url',
        child: searchInformationUrlInput,
      ),
      SMFormItem(
        label: 'search latest chapter',
        child: searchLatestChapterInput,
      ),
      SMFormItem(label: 'information method', child: informationMethodInput),
      SMFormItem(label: 'information name', child: informationNameInput),
      SMFormItem(label: 'information author', child: informationAuthorInput),
      SMFormItem(
        label: 'information category',
        child: informationCategoryInput,
      ),
      SMFormItem(
        label: 'information word count',
        child: informationWordCountInput,
      ),
      SMFormItem(
        label: 'information latest chapter',
        child: informationLatestChapterInput,
      ),
      SMFormItem(
        label: 'information introduction',
        child: informationIntroductionInput,
      ),
      SMFormItem(label: 'information cover', child: informationCoverInput),
      SMFormItem(
        label: 'information catalogue url',
        child: informationCatalogueUrlInput,
      ),
      SMFormItem(label: 'catalogue method', child: catalogueMethodInput),
      SMFormItem(label: 'catalogue chapters', child: catalogueChaptersInput),
      SMFormItem(label: 'catalogue name', child: catalogueNameInput),
      SMFormItem(label: 'catalogue url', child: catalogueUrlInput),
      SMFormItem(label: 'catalogue updated at', child: catalogueUpdatedAtInput),
      SMFormItem(
        label: 'catalogue pagination',
        child: cataloguePaginationInput,
      ),
      SMFormItem(
        label: 'catalogue pagination validation',
        child: cataloguePaginationValidationInput,
      ),
      SMFormItem(label: 'catalogue preset', child: cataloguePresetInput),
      SMFormItem(label: 'content method', child: contentMethodInput),
      SMFormItem(label: 'content content', child: contentContentInput),
      SMFormItem(label: 'content pagination', child: contentPaginationInput),
      SMFormItem(
        label: 'content pagination validation',
        child: contentPaginationValidationInput,
      ),
      SMFormItem(label: 'explore json', child: exploreJsonInput),
    ];
    var listView = Focus(
      focusNode: FocusNode(),
      autofocus: true,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        children: children,
      ),
    );
    var sourceView = Card(child: listView);
    var toolbar = ToolbarView(
      onCreate: handleCreate(),
      onDebug: handleDebug(),
      onStore: handleStore,
      onDelete: handleDelete(),
    );
    return Column(children: [
      toolbar,
      const SizedBox(height: 16),
      Expanded(child: sourceView),
    ]);
  }

  Function()? handleCreate() {
    if (source.id == 0) return null;
    return onCreate;
  }

  Function()? handleDebug() {
    if (source.id == 0) return null;
    return onDebug;
  }

  Function()? handleDelete() {
    if (source.id == 0) return null;
    return onDelete;
  }

  void handleStore() {
    var updatedSource = source.copyWith(
      id: int.parse(idController.text),
      name: nameController.text,
      url: urlController.text,
      enabled: enabledController.text == 'true',
      exploreEnabled: exploreEnabledController.text == 'true',
      type: typeController.text,
      comment: commentController.text,
      header: headerController.text,
      charset: charsetController.text,
      searchUrl: searchUrlController.text,
      searchMethod: searchMethodController.text,
      searchBooks: searchBooksController.text,
      searchName: searchNameController.text,
      searchAuthor: searchAuthorController.text,
      searchCategory: searchCategoryController.text,
      searchWordCount: searchWordCountController.text,
      searchIntroduction: searchIntroductionController.text,
      searchCover: searchCoverController.text,
      searchInformationUrl: searchInformationUrlController.text,
      searchLatestChapter: searchLatestChapterController.text,
      informationMethod: informationMethodController.text,
      informationName: informationNameController.text,
      informationAuthor: informationAuthorController.text,
      informationCategory: informationCategoryController.text,
      informationWordCount: informationWordCountController.text,
      informationLatestChapter: informationLatestChapterController.text,
      informationIntroduction: informationIntroductionController.text,
      informationCover: informationCoverController.text,
      informationCatalogueUrl: informationCatalogueUrlController.text,
      catalogueMethod: catalogueMethodController.text,
      catalogueChapters: catalogueChaptersController.text,
      catalogueName: catalogueNameController.text,
      catalogueUrl: catalogueUrlController.text,
      catalogueUpdatedAt: catalogueUpdatedAtController.text,
      cataloguePagination: cataloguePaginationController.text,
      cataloguePaginationValidation:
          cataloguePaginationValidationController.text,
      cataloguePreset: cataloguePresetController.text,
      contentMethod: contentMethodController.text,
      contentContent: contentContentController.text,
      contentPagination: contentPaginationController.text,
      contentPaginationValidation: contentPaginationValidationController.text,
      exploreJson: exploreJsonController.text,
    );
    onStore?.call(updatedSource);
  }
}
