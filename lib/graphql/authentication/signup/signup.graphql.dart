import '../../schema.graphql.dart';
import '../fragments/error/error.graphql.dart';
import '../fragments/user_login_data/user_login_data.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Mutation$SignUp {
  factory Variables$Mutation$SignUp({Input$UserRegisterInput? userInput}) =>
      Variables$Mutation$SignUp._({
        if (userInput != null) r'userInput': userInput,
      });

  Variables$Mutation$SignUp._(this._$data);

  factory Variables$Mutation$SignUp.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('userInput')) {
      final l$userInput = data['userInput'];
      result$data['userInput'] = l$userInput == null
          ? null
          : Input$UserRegisterInput.fromJson(
              (l$userInput as Map<String, dynamic>));
    }
    return Variables$Mutation$SignUp._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$UserRegisterInput? get userInput =>
      (_$data['userInput'] as Input$UserRegisterInput?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('userInput')) {
      final l$userInput = userInput;
      result$data['userInput'] = l$userInput?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$SignUp<Variables$Mutation$SignUp> get copyWith =>
      CopyWith$Variables$Mutation$SignUp(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$SignUp) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userInput = userInput;
    final lOther$userInput = other.userInput;
    if (_$data.containsKey('userInput') !=
        other._$data.containsKey('userInput')) {
      return false;
    }
    if (l$userInput != lOther$userInput) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userInput = userInput;
    return Object.hashAll(
        [_$data.containsKey('userInput') ? l$userInput : const {}]);
  }
}

abstract class CopyWith$Variables$Mutation$SignUp<TRes> {
  factory CopyWith$Variables$Mutation$SignUp(
    Variables$Mutation$SignUp instance,
    TRes Function(Variables$Mutation$SignUp) then,
  ) = _CopyWithImpl$Variables$Mutation$SignUp;

  factory CopyWith$Variables$Mutation$SignUp.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SignUp;

  TRes call({Input$UserRegisterInput? userInput});
}

class _CopyWithImpl$Variables$Mutation$SignUp<TRes>
    implements CopyWith$Variables$Mutation$SignUp<TRes> {
  _CopyWithImpl$Variables$Mutation$SignUp(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SignUp _instance;

  final TRes Function(Variables$Mutation$SignUp) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? userInput = _undefined}) =>
      _then(Variables$Mutation$SignUp._({
        ..._instance._$data,
        if (userInput != _undefined)
          'userInput': (userInput as Input$UserRegisterInput?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SignUp<TRes>
    implements CopyWith$Variables$Mutation$SignUp<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SignUp(this._res);

  TRes _res;

  call({Input$UserRegisterInput? userInput}) => _res;
}

class Mutation$SignUp {
  Mutation$SignUp({
    this.signup,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SignUp.fromJson(Map<String, dynamic> json) {
    final l$signup = json['signup'];
    final l$$__typename = json['__typename'];
    return Mutation$SignUp(
      signup: l$signup == null
          ? null
          : Mutation$SignUp$signup.fromJson((l$signup as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SignUp$signup? signup;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$signup = signup;
    _resultData['signup'] = l$signup?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$signup = signup;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$signup,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SignUp) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$signup = signup;
    final lOther$signup = other.signup;
    if (l$signup != lOther$signup) {
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

extension UtilityExtension$Mutation$SignUp on Mutation$SignUp {
  CopyWith$Mutation$SignUp<Mutation$SignUp> get copyWith =>
      CopyWith$Mutation$SignUp(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SignUp<TRes> {
  factory CopyWith$Mutation$SignUp(
    Mutation$SignUp instance,
    TRes Function(Mutation$SignUp) then,
  ) = _CopyWithImpl$Mutation$SignUp;

  factory CopyWith$Mutation$SignUp.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SignUp;

  TRes call({
    Mutation$SignUp$signup? signup,
    String? $__typename,
  });
  CopyWith$Mutation$SignUp$signup<TRes> get signup;
}

class _CopyWithImpl$Mutation$SignUp<TRes>
    implements CopyWith$Mutation$SignUp<TRes> {
  _CopyWithImpl$Mutation$SignUp(
    this._instance,
    this._then,
  );

  final Mutation$SignUp _instance;

  final TRes Function(Mutation$SignUp) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? signup = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SignUp(
        signup: signup == _undefined
            ? _instance.signup
            : (signup as Mutation$SignUp$signup?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$SignUp$signup<TRes> get signup {
    final local$signup = _instance.signup;
    return local$signup == null
        ? CopyWith$Mutation$SignUp$signup.stub(_then(_instance))
        : CopyWith$Mutation$SignUp$signup(local$signup, (e) => call(signup: e));
  }
}

class _CopyWithStubImpl$Mutation$SignUp<TRes>
    implements CopyWith$Mutation$SignUp<TRes> {
  _CopyWithStubImpl$Mutation$SignUp(this._res);

  TRes _res;

  call({
    Mutation$SignUp$signup? signup,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$SignUp$signup<TRes> get signup =>
      CopyWith$Mutation$SignUp$signup.stub(_res);
}

const documentNodeMutationSignUp = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SignUp'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userInput')),
        type: NamedTypeNode(
          name: NameNode(value: 'UserRegisterInput'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'signup'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'userInput'),
            value: EnumValueNode(name: NameNode(value: 'UserRegisterInput')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FragmentSpreadNode(
            name: NameNode(value: 'ErrorResponse'),
            directives: [],
          ),
          FragmentSpreadNode(
            name: NameNode(value: 'UserLoginData'),
            directives: [],
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionErrorResponse,
  fragmentDefinitionUserLoginData,
]);

class Mutation$SignUp$signup {
  Mutation$SignUp$signup({
    required this.status,
    this.$__typename = 'RegisterUserPayload',
  });

  factory Mutation$SignUp$signup.fromJson(Map<String, dynamic> json) {
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Mutation$SignUp$signup(
      status: (l$status as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$status = status;
    _resultData['status'] = l$status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SignUp$signup) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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

extension UtilityExtension$Mutation$SignUp$signup on Mutation$SignUp$signup {
  CopyWith$Mutation$SignUp$signup<Mutation$SignUp$signup> get copyWith =>
      CopyWith$Mutation$SignUp$signup(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SignUp$signup<TRes> {
  factory CopyWith$Mutation$SignUp$signup(
    Mutation$SignUp$signup instance,
    TRes Function(Mutation$SignUp$signup) then,
  ) = _CopyWithImpl$Mutation$SignUp$signup;

  factory CopyWith$Mutation$SignUp$signup.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SignUp$signup;

  TRes call({
    int? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SignUp$signup<TRes>
    implements CopyWith$Mutation$SignUp$signup<TRes> {
  _CopyWithImpl$Mutation$SignUp$signup(
    this._instance,
    this._then,
  );

  final Mutation$SignUp$signup _instance;

  final TRes Function(Mutation$SignUp$signup) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SignUp$signup(
        status: status == _undefined || status == null
            ? _instance.status
            : (status as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SignUp$signup<TRes>
    implements CopyWith$Mutation$SignUp$signup<TRes> {
  _CopyWithStubImpl$Mutation$SignUp$signup(this._res);

  TRes _res;

  call({
    int? status,
    String? $__typename,
  }) =>
      _res;
}
