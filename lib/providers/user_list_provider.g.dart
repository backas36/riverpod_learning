// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userListHash() => r'bd4ae94297582d8fb1447fa6cee783937d6a5c33';

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

/// See also [userList].
@ProviderFor(userList)
const userListProvider = UserListFamily();

/// See also [userList].
class UserListFamily extends Family<User> {
  /// See also [userList].
  const UserListFamily();

  /// See also [userList].
  UserListProvider call(int id, int age, {String? username}) {
    return UserListProvider(id, age, username: username);
  }

  @override
  UserListProvider getProviderOverride(covariant UserListProvider provider) {
    return call(provider.id, provider.age, username: provider.username);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userListProvider';
}

/// See also [userList].
class UserListProvider extends AutoDisposeProvider<User> {
  /// See also [userList].
  UserListProvider(int id, int age, {String? username})
    : this._internal(
        (ref) => userList(ref as UserListRef, id, age, username: username),
        from: userListProvider,
        name: r'userListProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$userListHash,
        dependencies: UserListFamily._dependencies,
        allTransitiveDependencies: UserListFamily._allTransitiveDependencies,
        id: id,
        age: age,
        username: username,
      );

  UserListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.age,
    required this.username,
  }) : super.internal();

  final int id;
  final int age;
  final String? username;

  @override
  Override overrideWith(User Function(UserListRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: UserListProvider._internal(
        (ref) => create(ref as UserListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        age: age,
        username: username,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<User> createElement() {
    return _UserListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserListProvider &&
        other.id == id &&
        other.age == age &&
        other.username == username;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, age.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserListRef on AutoDisposeProviderRef<User> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `age` of this provider.
  int get age;

  /// The parameter `username` of this provider.
  String? get username;
}

class _UserListProviderElement extends AutoDisposeProviderElement<User>
    with UserListRef {
  _UserListProviderElement(super.provider);

  @override
  int get id => (origin as UserListProvider).id;
  @override
  int get age => (origin as UserListProvider).age;
  @override
  String? get username => (origin as UserListProvider).username;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
