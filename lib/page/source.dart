import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:source_manager/component/source_view.dart';
import 'package:source_manager/model/source.dart';
import 'package:source_manager/page/component/toolbar.dart';
import 'package:source_manager/riverpod/source.dart';

class SourcePage extends StatefulWidget {
  const SourcePage({super.key});

  @override
  State<SourcePage> createState() => _SourcePageState();
}

class _SourceListView extends ConsumerWidget {
  final int selectedIndex;
  final void Function(int, int)? onSelected;
  const _SourceListView({required this.selectedIndex, this.onSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider = sourcesNotifierProvider;
    var state = ref.watch(provider);
    var view = switch (state) {
      AsyncData(:final value) => _buildData(value),
      AsyncError(:final error) => _buildError(error),
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
      _ => const SizedBox(),
    };
    return Card(child: view);
  }

  void handleTap(Source source, int index) {
    onSelected?.call(index, source.id);
  }

  Widget _buildData(List<Source> sources) {
    return ListView.separated(
      itemCount: sources.length,
      itemBuilder: (context, index) => _itemBuilder(context, sources, index),
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }

  Center _buildError(Object error) {
    var view = SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Text(error.toString(), textAlign: TextAlign.center),
    );
    return Center(child: view);
  }

  Widget _itemBuilder(BuildContext context, List<Source> sources, int index) {
    return ListTile(
      onTap: () => handleTap(sources[index], index),
      selected: index == selectedIndex,
      selectedTileColor: Theme.of(context).colorScheme.primaryContainer,
      shape: StadiumBorder(),
      title: Text(sources[index].id.toString()),
    );
  }
}

class _SourcePageState extends State<SourcePage> {
  bool debugging = false;
  int selectedIndex = -1;
  int? id;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.headlineSmall;
    var text = Text('Source Manager', style: textStyle);
    var logo = SizedBox(height: 36, child: text);
    var sourceListView = _SourceListView(
      onSelected: handleSelected,
      selectedIndex: selectedIndex,
    );
    var leadingChildren = [
      logo,
      const SizedBox(height: 16),
      Expanded(child: sourceListView),
    ];
    var leading = Column(children: leadingChildren);
    var toolbar = Toolbar(onCreate: createSource, onDebug: debugSource);
    var sourceView = _SourceView(id: id);
    var contentChildren = [
      toolbar,
      const SizedBox(height: 16),
      Expanded(child: sourceView),
    ];
    var content = Column(children: contentChildren);
    var bodyChildren = [
      SizedBox(width: 320, child: leading),
      const SizedBox(width: 16),
      Expanded(child: content),
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

  void createSource() {
    setState(() {
      selectedIndex = -1;
      id = 0;
    });
  }

  void handleSelected(int index, int id) {
    setState(() {
      selectedIndex = index;
      this.id = id;
    });
  }

  void debugSource() {
    _scaffoldKey.currentState!.openEndDrawer();
  }
}

class _SourceView extends ConsumerWidget {
  final int? id;
  const _SourceView({this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (id == null) return SourceView();
    var provider = SourceNotifierProvider(id!);
    var state = ref.watch(provider);
    return switch (state) {
      AsyncData(:final value) => _buildData(value),
      AsyncError(:final error) => _buildError(error),
      AsyncLoading() => _buildLoading(),
      _ => const SizedBox(),
    };
  }

  Widget _buildData(Source source) {
    return SourceView(source: source);
  }

  Center _buildError(Object error) {
    return Center(child: SingleChildScrollView(child: Text(error.toString())));
  }

  Center _buildLoading() => const Center(child: CircularProgressIndicator());
}
