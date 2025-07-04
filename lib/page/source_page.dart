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
    var drawer = Drawer(shape: BeveledRectangleBorder(), width: size.width / 3);
    return Scaffold(key: scaffoldKey, body: body, endDrawer: drawer);
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
    return ListTile(
      onTap: () => viewModel.selectSource(index),
      selected: index == viewModel.index.value,
      selectedTileColor: color,
      shape: StadiumBorder(),
      title: Text(viewModel.sources.value[index].name),
    );
  }
}
