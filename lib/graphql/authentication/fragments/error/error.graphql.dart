import 'package:gql/ast.dart';

class Fragment$ErrorResponse {
  Fragment$ErrorResponse({
    required this.fullMessage,
    required this.message,
    required this.property,
    this.$__typename = 'Error',
  });

  factory Fragment$ErrorResponse.fromJson(Map<String, dynamic> json) {
    final l$fullMessage = json['fullMessage'];
    final l$message = json['message'];
    final l$property = json['property'];
    final l$$__typename = json['__typename'];
    return Fragment$ErrorResponse(
      fullMessage: (l$fullMessage as String),
      message: (l$message as String),
      property: (l$property as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String fullMessage;

  final String message;

  final String property;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$fullMessage = fullMessage;
    _resultData['fullMessage'] = l$fullMessage;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$property = property;
    _resultData['property'] = l$property;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$fullMessage = fullMessage;
    final l$message = message;
    final l$property = property;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$fullMessage,
      l$message,
      l$property,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ErrorResponse) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$fullMessage = fullMessage;
    final lOther$fullMessage = other.fullMessage;
    if (l$fullMessage != lOther$fullMessage) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
      return false;
    }
    final l$property = property;
    final lOther$property = other.property;
    if (l$property != lOther$property) {
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

extension UtilityExtension$Fragment$ErrorResponse on Fragment$ErrorResponse {
  CopyWith$Fragment$ErrorResponse<Fragment$ErrorResponse> get copyWith =>
      CopyWith$Fragment$ErrorResponse(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$ErrorResponse<TRes> {
  factory CopyWith$Fragment$ErrorResponse(
    Fragment$ErrorResponse instance,
    TRes Function(Fragment$ErrorResponse) then,
  ) = _CopyWithImpl$Fragment$ErrorResponse;

  factory CopyWith$Fragment$ErrorResponse.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ErrorResponse;

  TRes call({
    String? fullMessage,
    String? message,
    String? property,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$ErrorResponse<TRes>
    implements CopyWith$Fragment$ErrorResponse<TRes> {
  _CopyWithImpl$Fragment$ErrorResponse(
    this._instance,
    this._then,
  );

  final Fragment$ErrorResponse _instance;

  final TRes Function(Fragment$ErrorResponse) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? fullMessage = _undefined,
    Object? message = _undefined,
    Object? property = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ErrorResponse(
        fullMessage: fullMessage == _undefined || fullMessage == null
            ? _instance.fullMessage
            : (fullMessage as String),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        property: property == _undefined || property == null
            ? _instance.property
            : (property as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$ErrorResponse<TRes>
    implements CopyWith$Fragment$ErrorResponse<TRes> {
  _CopyWithStubImpl$Fragment$ErrorResponse(this._res);

  TRes _res;

  call({
    String? fullMessage,
    String? message,
    String? property,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionErrorResponse = FragmentDefinitionNode(
  name: NameNode(value: 'ErrorResponse'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Error'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'fullMessage'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'message'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'property'),
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
const documentNodeFragmentErrorResponse = DocumentNode(definitions: [
  fragmentDefinitionErrorResponse,
]);
