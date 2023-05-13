// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ContactModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;
  ContactModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });

  ContactModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? address,
  }) {
    return ContactModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactModel.fromJson(String source) =>
      ContactModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ContactModel(id: $id, name: $name, email: $email, phone: $phone, address: $address)';
  }

  @override
  bool operator ==(covariant ContactModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.address == address;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        address.hashCode;
  }
}
