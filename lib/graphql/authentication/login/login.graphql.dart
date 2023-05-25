import '../fragments/credentials/credentials.graphql.dart';
import '../fragments/error/error.graphql.dart';
import '../fragments/user_login_data/user_login_data.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Mutation$Login {
  factory Variables$Mutation$Login({
    required String email,
    required String password,
  }) =>
      Variables$Mutation$Login._({
        r'email': email,
        r'password': password,
      });

  Variables$Mutation$Login._(this._$data);

  factory Variables$Mutation$Login.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    return Variables$Mutation$Login._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);
  String get password => (_$data['password'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    final l$password = password;
    result$data['password'] = l$password;
    return result$data;
  }

  CopyWith$Variables$Mutation$Login<Variables$Mutation$Login> get copyWith =>
      CopyWith$Variables$Mutation$Login(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$Login) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$password = password;
    return Object.hashAll([
      l$email,
      l$password,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$Login<TRes> {
  factory CopyWith$Variables$Mutation$Login(
    Variables$Mutation$Login instance,
    TRes Function(Variables$Mutation$Login) then,
  ) = _CopyWithImpl$Variables$Mutation$Login;

  factory CopyWith$Variables$Mutation$Login.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$Login;

  TRes call({
    String? email,
    String? password,
  });
}

class _CopyWithImpl$Variables$Mutation$Login<TRes>
    implements CopyWith$Variables$Mutation$Login<TRes> {
  _CopyWithImpl$Variables$Mutation$Login(
    this._instance,
    this._then,
  );

  final Variables$Mutation$Login _instance;

  final TRes Function(Variables$Mutation$Login) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? email = _undefined,
    Object? password = _undefined,
  }) =>
      _then(Variables$Mutation$Login._({
        ..._instance._$data,
        if (email != _undefined && email != null) 'email': (email as String),
        if (password != _undefined && password != null)
          'password': (password as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$Login<TRes>
    implements CopyWith$Variables$Mutation$Login<TRes> {
  _CopyWithStubImpl$Variables$Mutation$Login(this._res);

  TRes _res;

  call({
    String? email,
    String? password,
  }) =>
      _res;
}

class Mutation$Login {
  Mutation$Login({
    this.login,
    this.$__typename = 'Mutation',
  });

  factory Mutation$Login.fromJson(Map<String, dynamic> json) {
    final l$login = json['login'];
    final l$$__typename = json['__typename'];
    return Mutation$Login(
      login: l$login == null
          ? null
          : Mutation$Login$login.fromJson((l$login as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$Login$login? login;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$login = login;
    _resultData['login'] = l$login?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$login = login;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$login,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$Login) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$login = login;
    final lOther$login = other.login;
    if (l$login != lOther$login) {
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

extension UtilityExtension$Mutation$Login on Mutation$Login {
  CopyWith$Mutation$Login<Mutation$Login> get copyWith =>
      CopyWith$Mutation$Login(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$Login<TRes> {
  factory CopyWith$Mutation$Login(
    Mutation$Login instance,
    TRes Function(Mutation$Login) then,
  ) = _CopyWithImpl$Mutation$Login;

  factory CopyWith$Mutation$Login.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Login;

  TRes call({
    Mutation$Login$login? login,
    String? $__typename,
  });
  CopyWith$Mutation$Login$login<TRes> get login;
}

class _CopyWithImpl$Mutation$Login<TRes>
    implements CopyWith$Mutation$Login<TRes> {
  _CopyWithImpl$Mutation$Login(
    this._instance,
    this._then,
  );

  final Mutation$Login _instance;

  final TRes Function(Mutation$Login) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? login = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$Login(
        login: login == _undefined
            ? _instance.login
            : (login as Mutation$Login$login?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$Login$login<TRes> get login {
    final local$login = _instance.login;
    return local$login == null
        ? CopyWith$Mutation$Login$login.stub(_then(_instance))
        : CopyWith$Mutation$Login$login(local$login, (e) => call(login: e));
  }
}

class _CopyWithStubImpl$Mutation$Login<TRes>
    implements CopyWith$Mutation$Login<TRes> {
  _CopyWithStubImpl$Mutation$Login(this._res);

  TRes _res;

  call({
    Mutation$Login$login? login,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$Login$login<TRes> get login =>
      CopyWith$Mutation$Login$login.stub(_res);
}

const documentNodeMutationLogin = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'Login'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'email')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'password')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'login'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'email'),
            value: VariableNode(name: NameNode(value: 'email')),
          ),
          ArgumentNode(
            name: NameNode(value: 'password'),
            value: VariableNode(name: NameNode(value: 'password')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: '__typename'),
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
          FragmentSpreadNode(
            name: NameNode(value: 'ErrorResponse'),
            directives: [],
          ),
          FragmentSpreadNode(
            name: NameNode(value: 'Credentials'),
            directives: [],
          ),
          FragmentSpreadNode(
            name: NameNode(value: 'UserLoginData'),
            directives: [],
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
  fragmentDefinitionCredentials,
  fragmentDefinitionUserLoginData,
]);

class Mutation$Login$login {
  Mutation$Login$login({
    this.$__typename = 'UserLoginPayload',
    required this.status,
  });

  factory Mutation$Login$login.fromJson(Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$status = json['status'];
    return Mutation$Login$login(
      $__typename: (l$$__typename as String),
      status: (l$status as int),
    );
  }

  final String $__typename;

  final int status;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$status = status;
    _resultData['status'] = l$status;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$status = status;
    return Object.hashAll([
      l$$__typename,
      l$status,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$Login$login) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$Login$login on Mutation$Login$login {
  CopyWith$Mutation$Login$login<Mutation$Login$login> get copyWith =>
      CopyWith$Mutation$Login$login(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$Login$login<TRes> {
  factory CopyWith$Mutation$Login$login(
    Mutation$Login$login instance,
    TRes Function(Mutation$Login$login) then,
  ) = _CopyWithImpl$Mutation$Login$login;

  factory CopyWith$Mutation$Login$login.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Login$login;

  TRes call({
    String? $__typename,
    int? status,
  });
}

class _CopyWithImpl$Mutation$Login$login<TRes>
    implements CopyWith$Mutation$Login$login<TRes> {
  _CopyWithImpl$Mutation$Login$login(
    this._instance,
    this._then,
  );

  final Mutation$Login$login _instance;

  final TRes Function(Mutation$Login$login) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $__typename = _undefined,
    Object? status = _undefined,
  }) =>
      _then(Mutation$Login$login(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as int),
      ));
}

class _CopyWithStubImpl$Mutation$Login$login<TRes>
    implements CopyWith$Mutation$Login$login<TRes> {
  _CopyWithStubImpl$Mutation$Login$login(this._res);

  TRes _res;

  call({
    String? $__typename,
    int? status,
  }) =>
      _res;
}
