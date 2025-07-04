import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:signals/signals_flutter.dart';
import 'package:source_manager/page/source_input_view.dart';
import 'package:source_manager/model/source.dart';
import 'package:source_manager/page/source_view_model.dart';

class SourcePage extends StatefulWidget {
  const SourcePage({super.key});

  @override
  State<SourcePage> createState() => _SourcePageState();
}

class _SourceListView extends StatelessWidget {
  final void Function(int)? onSelected;
  final int selectedIndex;
  final List<Source> sources;
  const _SourceListView({
    this.onSelected,
    required this.selectedIndex,
    required this.sources,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = ListView.separated(
      itemCount: sources.length,
      itemBuilder: (context, index) => _itemBuilder(context, sources, index),
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
    return Card(child: child);
  }

  void handleTap(int index) {
    onSelected?.call(index);
  }

  Widget _itemBuilder(BuildContext context, List<Source> sources, int index) {
    return ListTile(
      onTap: () => handleTap(index),
      selected: index == selectedIndex,
      selectedTileColor: Theme.of(context).colorScheme.primaryContainer,
      shape: StadiumBorder(),
      title: Text(sources[index].name),
    );
  }
}

class _SourcePageState extends State<SourcePage> {
  bool debugging = false;

  int? id;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final viewModel = GetIt.instance.get<SourceViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.initSignals();
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.headlineSmall;
    var text = Text('Source Manager', style: textStyle);
    var logo = SizedBox(height: 36, child: text);
    var sourceListView = Watch(
      (_) => _SourceListView(
        onSelected: viewModel.selectSource,
        selectedIndex: viewModel.index.value,
        sources: viewModel.sources.value,
      ),
    );
    var leadingChildren = [
      logo,
      const SizedBox(height: 16),
      Expanded(child: sourceListView),
    ];
    var leading = Column(children: leadingChildren);
    var bodyChildren = [
      SizedBox(width: 320, child: leading),
      const SizedBox(width: 16),
      Expanded(
        child: Watch(
          (_) => SourceInputView(
            onCreate: viewModel.createSource,
            onDebug: debugSource,
            onStore: (source) => viewModel.storeSource(context, source),
            onDelete: viewModel.canDelete.value
                ? () => viewModel.destroySource(context)
                : null,
            source: viewModel.selectedSource.value,
          ),
        ),
      ),
    ];
    var body = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(children: bodyChildren),
    );
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: body,
      endDrawer: Drawer(
        shape: BeveledRectangleBorder(),
        width: size.width / 2,
      ),
    );
  }

  void createSource() {}

  void destroySource() {}

  void debugSource() {
    _scaffoldKey.currentState!.openEndDrawer();
  }
}
