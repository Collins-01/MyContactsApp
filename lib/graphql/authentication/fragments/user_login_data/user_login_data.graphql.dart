import 'package:gql/ast.dart';

class Fragment$UserLoginData {
  Fragment$UserLoginData({
    this.createdAt,
    this.email,
    required this.id,
    this.status,
    this.tokens,
    this.updatedAt,
    this.$__typename = 'User',
  });

  factory Fragment$UserLoginData.fromJson(Map<String, dynamic> json) {
    final l$createdAt = json['createdAt'];
    final l$email = json['email'];
    final l$id = json['id'];
    final l$status = json['status'];
    final l$tokens = json['tokens'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Fragment$UserLoginData(
      createdAt: (l$createdAt as String?),
      email: (l$email as String?),
      id: (l$id as String),
      status: (l$status as String?),
      tokens: (l$tokens as String?),
      updatedAt: (l$updatedAt as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? createdAt;

  final String? email;

  final String id;

  final String? status;

  final String? tokens;

  final String? updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$tokens = tokens;
    _resultData['tokens'] = l$tokens;
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createdAt = createdAt;
    final l$email = email;
    final l$id = id;
    final l$status = status;
    final l$tokens = tokens;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createdAt,
      l$email,
      l$id,
      l$status,
      l$tokens,
      l$updatedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$UserLoginData) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$tokens = tokens;
    final lOther$tokens = other.tokens;
    if (l$tokens != lOther$tokens) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
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

extension UtilityExtension$Fragment$UserLoginData on Fragment$UserLoginData {
  CopyWith$Fragment$UserLoginData<Fragment$UserLoginData> get copyWith =>
      CopyWith$Fragment$UserLoginData(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$UserLoginData<TRes> {
  factory CopyWith$Fragment$UserLoginData(
    Fragment$UserLoginData instance,
    TRes Function(Fragment$UserLoginData) then,
  ) = _CopyWithImpl$Fragment$UserLoginData;

  factory CopyWith$Fragment$UserLoginData.stub(TRes res) =
      _CopyWithStubImpl$Fragment$UserLoginData;

  TRes call({
    String? createdAt,
    String? email,
    String? id,
    String? status,
    String? tokens,
    String? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$UserLoginData<TRes>
    implements CopyWith$Fragment$UserLoginData<TRes> {
  _CopyWithImpl$Fragment$UserLoginData(
    this._instance,
    this._then,
  );

  final Fragment$UserLoginData _instance;

  final TRes Function(Fragment$UserLoginData) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createdAt = _undefined,
    Object? email = _undefined,
    Object? id = _undefined,
    Object? status = _undefined,
    Object? tokens = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$UserLoginData(
        createdAt: createdAt == _undefined
            ? _instance.createdAt
            : (createdAt as String?),
        email: email == _undefined ? _instance.email : (email as String?),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        status: status == _undefined ? _instance.status : (status as String?),
        tokens: tokens == _undefined ? _instance.tokens : (tokens as String?),
        updatedAt: updatedAt == _undefined
            ? _instance.updatedAt
            : (updatedAt as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$UserLoginData<TRes>
    implements CopyWith$Fragment$UserLoginData<TRes> {
  _CopyWithStubImpl$Fragment$UserLoginData(this._res);

  TRes _res;

  call({
    String? createdAt,
    String? email,
    String? id,
    String? status,
    String? tokens,
    String? updatedAt,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionUserLoginData = FragmentDefinitionNode(
  name: NameNode(value: 'UserLoginData'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'User'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'email'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'status'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'tokens'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'updatedAt'),
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
const documentNodeFragmentUserLoginData = DocumentNode(definitions: [
  fragmentDefinitionUserLoginData,
]);
