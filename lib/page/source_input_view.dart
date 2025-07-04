import 'package:flutter/material.dart';
import 'package:source_manager/model/source.dart';
import 'package:source_manager/page/toolbar_view.dart';
import 'package:source_manager/widget/form_item.dart';
import 'package:source_manager/widget/input.dart';
import 'package:source_manager/widget/select.dart';

class SourceInputView extends StatefulWidget {
  final void Function()? onCreate;
  final void Function()? onDebug;
  final void Function()? onDelete;
  final void Function(Source)? onStore;
  final Source source;
  const SourceInputView({
    super.key,
    this.onCreate,
    this.onDebug,
    this.onDelete,
    this.onStore,
    required this.source,
  });

  @override
  State<SourceInputView> createState() => _SourceInputViewState();
}

class _SourceInputViewState extends State<SourceInputView> {
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

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  @override
  void didUpdateWidget(covariant SourceInputView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.source != oldWidget.source) {
      _initControllers();
    }
  }

  void _initControllers() {
    idController.text = widget.source.id.toString();
    nameController.text = widget.source.name;
    urlController.text = widget.source.url;
    enabledController.text = widget.source.enabled.toString();
    exploreEnabledController.text = widget.source.exploreEnabled.toString();
    typeController.text = widget.source.type;
    commentController.text = widget.source.comment;
    headerController.text = widget.source.header;
    charsetController.text = widget.source.charset;
    searchUrlController.text = widget.source.searchUrl;
    searchMethodController.text = widget.source.searchMethod;
    searchBooksController.text = widget.source.searchBooks;
    searchNameController.text = widget.source.searchName;
    searchAuthorController.text = widget.source.searchAuthor;
    searchCategoryController.text = widget.source.searchCategory;
    searchWordCountController.text = widget.source.searchWordCount;
    searchIntroductionController.text = widget.source.searchIntroduction;
    searchCoverController.text = widget.source.searchCover;
    searchInformationUrlController.text = widget.source.searchInformationUrl;
    searchLatestChapterController.text = widget.source.searchLatestChapter;
    informationMethodController.text = widget.source.informationMethod;
    informationNameController.text = widget.source.informationName;
    informationAuthorController.text = widget.source.informationAuthor;
    informationCategoryController.text = widget.source.informationCategory;
    informationWordCountController.text = widget.source.informationWordCount;
    informationLatestChapterController.text =
        widget.source.informationLatestChapter;
    informationIntroductionController.text =
        widget.source.informationIntroduction;
    informationCoverController.text = widget.source.informationCover;
    informationCatalogueUrlController.text =
        widget.source.informationCatalogueUrl;
    catalogueMethodController.text = widget.source.catalogueMethod;
    catalogueChaptersController.text = widget.source.catalogueChapters;
    catalogueNameController.text = widget.source.catalogueName;
    catalogueUrlController.text = widget.source.catalogueUrl;
    catalogueUpdatedAtController.text = widget.source.catalogueUpdatedAt;
    cataloguePaginationController.text = widget.source.cataloguePagination;
    cataloguePaginationValidationController.text =
        widget.source.cataloguePaginationValidation;
    cataloguePresetController.text = widget.source.cataloguePreset;
    contentMethodController.text = widget.source.contentMethod;
    contentContentController.text = widget.source.contentContent;
    contentPaginationController.text = widget.source.contentPagination;
    contentPaginationValidationController.text =
        widget.source.contentPaginationValidation;
    exploreJsonController.text = widget.source.exploreJson;
  }

  @override
  void dispose() {
    idController.dispose();
    nameController.dispose();
    urlController.dispose();
    enabledController.dispose();
    exploreEnabledController.dispose();
    typeController.dispose();
    commentController.dispose();
    headerController.dispose();
    charsetController.dispose();
    searchUrlController.dispose();
    searchMethodController.dispose();
    searchBooksController.dispose();
    searchNameController.dispose();
    searchAuthorController.dispose();
    searchCategoryController.dispose();
    searchWordCountController.dispose();
    searchIntroductionController.dispose();
    searchCoverController.dispose();
    searchInformationUrlController.dispose();
    searchLatestChapterController.dispose();
    informationMethodController.dispose();
    informationNameController.dispose();
    informationAuthorController.dispose();
    informationCategoryController.dispose();
    informationWordCountController.dispose();
    informationLatestChapterController.dispose();
    informationIntroductionController.dispose();
    informationCoverController.dispose();
    informationCatalogueUrlController.dispose();
    catalogueMethodController.dispose();
    catalogueChaptersController.dispose();
    catalogueNameController.dispose();
    catalogueUrlController.dispose();
    catalogueUpdatedAtController.dispose();
    cataloguePaginationController.dispose();
    cataloguePaginationValidationController.dispose();
    cataloguePresetController.dispose();
    contentMethodController.dispose();
    contentContentController.dispose();
    contentPaginationController.dispose();
    contentPaginationValidationController.dispose();
    exploreJsonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var idInput = SMInput(
      controller: idController,
      disabled: true,
      placeholder: 'id',
    );
    var nameInput = SMInput(controller: nameController, placeholder: 'name');
    var urlInput = SMInput(controller: urlController, placeholder: 'url');
    var enabledInput = SMInput(
      controller: enabledController,
      placeholder: 'enabled',
    );
    var exploreEnabledInput = SMInput(
      controller: exploreEnabledController,
      placeholder: 'explore enabled',
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
      onCreate: widget.onCreate,
      onDebug: widget.onDebug,
      onStore: handleStore,
      onDelete: widget.onDelete,
    );
    return Column(children: [
      toolbar,
      const SizedBox(height: 16),
      Expanded(child: sourceView),
    ]);
  }

  void handleStore() {
    var updatedSource = widget.source.copyWith(
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
    widget.onStore?.call(updatedSource);
  }
}
