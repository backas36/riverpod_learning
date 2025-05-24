// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_up_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$startupHash() => r'499486296707b22623e3dfdac6d9d98c087d8d6d';

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

/// See also [startup].
@ProviderFor(startup)
const startupProvider = StartupFamily();

/// See also [startup].
class StartupFamily extends Family<AsyncValue<void>> {
  /// See also [startup].
  const StartupFamily();

  /// See also [startup].
  StartupProvider call({required String flavour}) {
    return StartupProvider(flavour: flavour);
  }

  @override
  StartupProvider getProviderOverride(covariant StartupProvider provider) {
    return call(flavour: provider.flavour);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'startupProvider';
}

/// See also [startup].
class StartupProvider extends FutureProvider<void> {
  /// See also [startup].
  StartupProvider({required String flavour})
    : this._internal(
        (ref) => startup(ref as StartupRef, flavour: flavour),
        from: startupProvider,
        name: r'startupProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$startupHash,
        dependencies: StartupFamily._dependencies,
        allTransitiveDependencies: StartupFamily._allTransitiveDependencies,
        flavour: flavour,
      );

  StartupProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.flavour,
  }) : super.internal();

  final String flavour;

  @override
  Override overrideWith(FutureOr<void> Function(StartupRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: StartupProvider._internal(
        (ref) => create(ref as StartupRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        flavour: flavour,
      ),
    );
  }

  @override
  FutureProviderElement<void> createElement() {
    return _StartupProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StartupProvider && other.flavour == flavour;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, flavour.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StartupRef on FutureProviderRef<void> {
  /// The parameter `flavour` of this provider.
  String get flavour;
}

class _StartupProviderElement extends FutureProviderElement<void>
    with StartupRef {
  _StartupProviderElement(super.provider);

  @override
  String get flavour => (origin as StartupProvider).flavour;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
