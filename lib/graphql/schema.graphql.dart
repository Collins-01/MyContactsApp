class Input$ContactInput {
  factory Input$ContactInput({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? address,
    bool? discarded,
  }) =>
      Input$ContactInput._({
        if (id != null) r'id': id,
        if (name != null) r'name': name,
        if (phone != null) r'phone': phone,
        if (email != null) r'email': email,
        if (address != null) r'address': address,
        if (discarded != null) r'discarded': discarded,
      });

  Input$ContactInput._(this._$data);

  factory Input$ContactInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('id')) {
      final l$id = data['id'];
      result$data['id'] = (l$id as String?);
    }
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('phone')) {
      final l$phone = data['phone'];
      result$data['phone'] = (l$phone as String?);
    }
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('address')) {
      final l$address = data['address'];
      result$data['address'] = (l$address as String?);
    }
    if (data.containsKey('discarded')) {
      final l$discarded = data['discarded'];
      result$data['discarded'] = (l$discarded as bool?);
    }
    return Input$ContactInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get id => (_$data['id'] as String?);
  String? get name => (_$data['name'] as String?);
  String? get phone => (_$data['phone'] as String?);
  String? get email => (_$data['email'] as String?);
  String? get address => (_$data['address'] as String?);
  bool? get discarded => (_$data['discarded'] as bool?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('id')) {
      final l$id = id;
      result$data['id'] = l$id;
    }
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('phone')) {
      final l$phone = phone;
      result$data['phone'] = l$phone;
    }
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('address')) {
      final l$address = address;
      result$data['address'] = l$address;
    }
    if (_$data.containsKey('discarded')) {
      final l$discarded = discarded;
      result$data['discarded'] = l$discarded;
    }
    return result$data;
  }

  CopyWith$Input$ContactInput<Input$ContactInput> get copyWith =>
      CopyWith$Input$ContactInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ContactInput) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (_$data.containsKey('id') != other._$data.containsKey('id')) {
      return false;
    }
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (_$data.containsKey('phone') != other._$data.containsKey('phone')) {
      return false;
    }
    if (l$phone != lOther$phone) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (_$data.containsKey('address') != other._$data.containsKey('address')) {
      return false;
    }
    if (l$address != lOther$address) {
      return false;
    }
    final l$discarded = discarded;
    final lOther$discarded = other.discarded;
    if (_$data.containsKey('discarded') !=
        other._$data.containsKey('discarded')) {
      return false;
    }
    if (l$discarded != lOther$discarded) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$phone = phone;
    final l$email = email;
    final l$address = address;
    final l$discarded = discarded;
    return Object.hashAll([
      _$data.containsKey('id') ? l$id : const {},
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('phone') ? l$phone : const {},
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('address') ? l$address : const {},
      _$data.containsKey('discarded') ? l$discarded : const {},
    ]);
  }
}

abstract class CopyWith$Input$ContactInput<TRes> {
  factory CopyWith$Input$ContactInput(
    Input$ContactInput instance,
    TRes Function(Input$ContactInput) then,
  ) = _CopyWithImpl$Input$ContactInput;

  factory CopyWith$Input$ContactInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ContactInput;

  TRes call({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? address,
    bool? discarded,
  });
}

class _CopyWithImpl$Input$ContactInput<TRes>
    implements CopyWith$Input$ContactInput<TRes> {
  _CopyWithImpl$Input$ContactInput(
    this._instance,
    this._then,
  );

  final Input$ContactInput _instance;

  final TRes Function(Input$ContactInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? phone = _undefined,
    Object? email = _undefined,
    Object? address = _undefined,
    Object? discarded = _undefined,
  }) =>
      _then(Input$ContactInput._({
        ..._instance._$data,
        if (id != _undefined) 'id': (id as String?),
        if (name != _undefined) 'name': (name as String?),
        if (phone != _undefined) 'phone': (phone as String?),
        if (email != _undefined) 'email': (email as String?),
        if (address != _undefined) 'address': (address as String?),
        if (discarded != _undefined) 'discarded': (discarded as bool?),
      }));
}

class _CopyWithStubImpl$Input$ContactInput<TRes>
    implements CopyWith$Input$ContactInput<TRes> {
  _CopyWithStubImpl$Input$ContactInput(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? address,
    bool? discarded,
  }) =>
      _res;
}

class Input$UserRegisterInput {
  factory Input$UserRegisterInput({
    String? email,
    String? password,
    String? passwordConfirmation,
  }) =>
      Input$UserRegisterInput._({
        if (email != null) r'email': email,
        if (password != null) r'password': password,
        if (passwordConfirmation != null)
          r'passwordConfirmation': passwordConfirmation,
      });

  Input$UserRegisterInput._(this._$data);

  factory Input$UserRegisterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('password')) {
      final l$password = data['password'];
      result$data['password'] = (l$password as String?);
    }
    if (data.containsKey('passwordConfirmation')) {
      final l$passwordConfirmation = data['passwordConfirmation'];
      result$data['passwordConfirmation'] = (l$passwordConfirmation as String?);
    }
    return Input$UserRegisterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get email => (_$data['email'] as String?);
  String? get password => (_$data['password'] as String?);
  String? get passwordConfirmation =>
      (_$data['passwordConfirmation'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('password')) {
      final l$password = password;
      result$data['password'] = l$password;
    }
    if (_$data.containsKey('passwordConfirmation')) {
      final l$passwordConfirmation = passwordConfirmation;
      result$data['passwordConfirmation'] = l$passwordConfirmation;
    }
    return result$data;
  }

  CopyWith$Input$UserRegisterInput<Input$UserRegisterInput> get copyWith =>
      CopyWith$Input$UserRegisterInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$UserRegisterInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (_$data.containsKey('password') !=
        other._$data.containsKey('password')) {
      return false;
    }
    if (l$password != lOther$password) {
      return false;
    }
    final l$passwordConfirmation = passwordConfirmation;
    final lOther$passwordConfirmation = other.passwordConfirmation;
    if (_$data.containsKey('passwordConfirmation') !=
        other._$data.containsKey('passwordConfirmation')) {
      return false;
    }
    if (l$passwordConfirmation != lOther$passwordConfirmation) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$password = password;
    final l$passwordConfirmation = passwordConfirmation;
    return Object.hashAll([
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('password') ? l$password : const {},
      _$data.containsKey('passwordConfirmation')
          ? l$passwordConfirmation
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$UserRegisterInput<TRes> {
  factory CopyWith$Input$UserRegisterInput(
    Input$UserRegisterInput instance,
    TRes Function(Input$UserRegisterInput) then,
  ) = _CopyWithImpl$Input$UserRegisterInput;

  factory CopyWith$Input$UserRegisterInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UserRegisterInput;

  TRes call({
    String? email,
    String? password,
    String? passwordConfirmation,
  });
}

class _CopyWithImpl$Input$UserRegisterInput<TRes>
    implements CopyWith$Input$UserRegisterInput<TRes> {
  _CopyWithImpl$Input$UserRegisterInput(
    this._instance,
    this._then,
  );

  final Input$UserRegisterInput _instance;

  final TRes Function(Input$UserRegisterInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? email = _undefined,
    Object? password = _undefined,
    Object? passwordConfirmation = _undefined,
  }) =>
      _then(Input$UserRegisterInput._({
        ..._instance._$data,
        if (email != _undefined) 'email': (email as String?),
        if (password != _undefined) 'password': (password as String?),
        if (passwordConfirmation != _undefined)
          'passwordConfirmation': (passwordConfirmation as String?),
      }));
}

class _CopyWithStubImpl$Input$UserRegisterInput<TRes>
    implements CopyWith$Input$UserRegisterInput<TRes> {
  _CopyWithStubImpl$Input$UserRegisterInput(this._res);

  TRes _res;

  call({
    String? email,
    String? password,
    String? passwordConfirmation,
  }) =>
      _res;
}

const possibleTypesMap = <String, Set<String>>{};
