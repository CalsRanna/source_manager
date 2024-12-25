// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sourceNotifierHash() => r'8e740ad9ef7ba429db0e2969184259bfafd59728';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$SourceNotifier
    extends BuildlessAutoDisposeAsyncNotifier<Source> {
  late final int id;

  FutureOr<Source> build(
    int id,
  );
}

/// See also [SourceNotifier].
@ProviderFor(SourceNotifier)
const sourceNotifierProvider = SourceNotifierFamily();

/// See also [SourceNotifier].
class SourceNotifierFamily extends Family<AsyncValue<Source>> {
  /// See also [SourceNotifier].
  const SourceNotifierFamily();

  /// See also [SourceNotifier].
  SourceNotifierProvider call(
    int id,
  ) {
    return SourceNotifierProvider(
      id,
    );
  }

  @override
  SourceNotifierProvider getProviderOverride(
    covariant SourceNotifierProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'sourceNotifierProvider';
}

/// See also [SourceNotifier].
class SourceNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SourceNotifier, Source> {
  /// See also [SourceNotifier].
  SourceNotifierProvider(
    int id,
  ) : this._internal(
          () => SourceNotifier()..id = id,
          from: sourceNotifierProvider,
          name: r'sourceNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sourceNotifierHash,
          dependencies: SourceNotifierFamily._dependencies,
          allTransitiveDependencies:
              SourceNotifierFamily._allTransitiveDependencies,
          id: id,
        );

  SourceNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  FutureOr<Source> runNotifierBuild(
    covariant SourceNotifier notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(SourceNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: SourceNotifierProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SourceNotifier, Source>
      createElement() {
    return _SourceNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SourceNotifierProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SourceNotifierRef on AutoDisposeAsyncNotifierProviderRef<Source> {
  /// The parameter `id` of this provider.
  int get id;
}

class _SourceNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SourceNotifier, Source>
    with SourceNotifierRef {
  _SourceNotifierProviderElement(super.provider);

  @override
  int get id => (origin as SourceNotifierProvider).id;
}

String _$sourcesNotifierHash() => r'5a532ca79026c843bcbd3a950089a68044905296';

/// See also [SourcesNotifier].
@ProviderFor(SourcesNotifier)
final sourcesNotifierProvider =
    AutoDisposeAsyncNotifierProvider<SourcesNotifier, List<Source>>.internal(
  SourcesNotifier.new,
  name: r'sourcesNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sourcesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SourcesNotifier = AutoDisposeAsyncNotifier<List<Source>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
