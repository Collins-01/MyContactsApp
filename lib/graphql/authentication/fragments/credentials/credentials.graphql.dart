import 'package:gql/ast.dart';

class Fragment$Credentials {
  Fragment$Credentials({
    required this.token,
    this.$__typename = 'AccountCredentials',
  });

  factory Fragment$Credentials.fromJson(Map<String, dynamic> json) {
    final l$token = json['token'];
    final l$$__typename = json['__typename'];
    return Fragment$Credentials(
      token: (l$token as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String token;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$token = token;
    _resultData['token'] = l$token;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$token = token;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$token,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Credentials) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Credentials on Fragment$Credentials {
  CopyWith$Fragment$Credentials<Fragment$Credentials> get copyWith =>
      CopyWith$Fragment$Credentials(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$Credentials<TRes> {
  factory CopyWith$Fragment$Credentials(
    Fragment$Credentials instance,
    TRes Function(Fragment$Credentials) then,
  ) = _CopyWithImpl$Fragment$Credentials;

  factory CopyWith$Fragment$Credentials.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Credentials;

  TRes call({
    String? token,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Credentials<TRes>
    implements CopyWith$Fragment$Credentials<TRes> {
  _CopyWithImpl$Fragment$Credentials(
    this._instance,
    this._then,
  );

  final Fragment$Credentials _instance;

  final TRes Function(Fragment$Credentials) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? token = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Credentials(
        token: token == _undefined || token == null
            ? _instance.token
            : (token as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Credentials<TRes>
    implements CopyWith$Fragment$Credentials<TRes> {
  _CopyWithStubImpl$Fragment$Credentials(this._res);

  TRes _res;

  call({
    String? token,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionCredentials = FragmentDefinitionNode(
  name: NameNode(value: 'Credentials'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'AccountCredentials'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'token'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: '__typename'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ]),
);
const documentNodeFragmentCredentials = DocumentNode(definitions: [
  fragmentDefinitionCredentials,
]);
