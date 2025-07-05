import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:signals/signals_flutter.dart';
import 'package:source_manager/page/source_input_view.dart';
import 'package:source_manager/page/source_view_model.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class SourcePage extends StatefulWidget {
  const SourcePage({super.key});

  @override
  State<SourcePage> createState() => _SourcePageState();
}

class _SourcePageState extends State<SourcePage> {
  final viewModel = GetIt.instance.get<SourceViewModel>();

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.headlineSmall;
    var text = Text('Source Manager', style: textStyle);
    var sourceListView = Watch((_) => _buildListView());
    var leftAreaChildren = [
      SizedBox(height: 36, child: text),
      const SizedBox(height: 16),
      Expanded(child: sourceListView),
    ];
    var leftArea = Column(children: leftAreaChildren);
    var sourceInputView = Watch((_) => _buildInputView());
    var children = [
      SizedBox(width: 320, child: leftArea),
      const SizedBox(width: 16),
      Expanded(child: sourceInputView),
    ];
    var body = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(children: children),
    );
    var size = MediaQuery.of(context).size;
    var debugResultView = Watch((_) => _buildDebugResultView());
    var drawer = Drawer(
      shape: BeveledRectangleBorder(),
      width: size.width / 3,
      child: debugResultView,
    );
    return Scaffold(key: scaffoldKey, body: body, endDrawer: drawer);
  }

  Widget _buildDebugResultView() {
    return ListView.separated(
      itemCount: viewModel.results.value.length,
      itemBuilder: (context, index) {
        var result = viewModel.results.value[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(result.title),
            ),
            ListTile(
              onTap: () => viewModel.openDialog(result.html),
              title: Text('HTML'),
              subtitle: Text(
                result.html.replaceAll('\n', '').trim(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ListTile(
              onTap: () => viewModel.openDialog(JsonEncoder.withIndent('  ')
                  .convert(jsonDecode(result.json))),
              title: Text('JSON'),
              subtitle: Text(
                result.json,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      },
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }

  @override
  void initState() {
    super.initState();
    viewModel.initSignals();
  }

  Widget _buildInputView() {
    Function()? onDelete;
    if (viewModel.canDelete.value) {
      onDelete = () => viewModel.destroySource(context);
    }
    return SourceInputView(
      onCreate: viewModel.createSource,
      onDebug: viewModel.debugSource,
      onDelete: onDelete,
      onStore: (source) => viewModel.storeSource(context, source),
      source: viewModel.selectedSource.value,
      idController: viewModel.idController,
      nameController: viewModel.nameController,
      urlController: viewModel.urlController,
      enabledController: viewModel.enabledController,
      exploreEnabledController: viewModel.exploreEnabledController,
      typeController: viewModel.typeController,
      commentController: viewModel.commentController,
      headerController: viewModel.headerController,
      charsetController: viewModel.charsetController,
      searchUrlController: viewModel.searchUrlController,
      searchMethodController: viewModel.searchMethodController,
      searchBooksController: viewModel.searchBooksController,
      searchNameController: viewModel.searchNameController,
      searchAuthorController: viewModel.searchAuthorController,
      searchCategoryController: viewModel.searchCategoryController,
      searchWordCountController: viewModel.searchWordCountController,
      searchIntroductionController: viewModel.searchIntroductionController,
      searchCoverController: viewModel.searchCoverController,
      searchInformationUrlController: viewModel.searchInformationUrlController,
      searchLatestChapterController: viewModel.searchLatestChapterController,
      informationMethodController: viewModel.informationMethodController,
      informationNameController: viewModel.informationNameController,
      informationAuthorController: viewModel.informationAuthorController,
      informationCategoryController: viewModel.informationCategoryController,
      informationWordCountController: viewModel.informationWordCountController,
      informationLatestChapterController:
          viewModel.informationLatestChapterController,
      informationIntroductionController:
          viewModel.informationIntroductionController,
      informationCoverController: viewModel.informationCoverController,
      informationCatalogueUrlController:
          viewModel.informationCatalogueUrlController,
      catalogueMethodController: viewModel.catalogueMethodController,
      catalogueChaptersController: viewModel.catalogueChaptersController,
      catalogueNameController: viewModel.catalogueNameController,
      catalogueUrlController: viewModel.catalogueUrlController,
      catalogueUpdatedAtController: viewModel.catalogueUpdatedAtController,
      cataloguePaginationController: viewModel.cataloguePaginationController,
      cataloguePaginationValidationController:
          viewModel.cataloguePaginationValidationController,
      cataloguePresetController: viewModel.cataloguePresetController,
      contentMethodController: viewModel.contentMethodController,
      contentContentController: viewModel.contentContentController,
      contentPaginationController: viewModel.contentPaginationController,
      contentPaginationValidationController:
          viewModel.contentPaginationValidationController,
      exploreJsonController: viewModel.exploreJsonController,
    );
  }

  Widget _buildListView() {
    Widget child = ListView.separated(
      itemCount: viewModel.sources.value.length,
      itemBuilder: _itemBuilder,
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
    if (viewModel.sources.value.isEmpty) {
      child = const Center(child: Text('No sources'));
    }
    return Card(child: child);
  }

  Widget _itemBuilder(BuildContext context, int index) {
    var color = Theme.of(context).colorScheme.primaryContainer;
    return Watch(
      (_) => ListTile(
        onTap: () => viewModel.selectSource(index),
        selected: index == viewModel.index.value,
        selectedTileColor: color,
        shape: StadiumBorder(),
        title: Text(viewModel.sources.value[index].name),
      ),
    );
  }
}
