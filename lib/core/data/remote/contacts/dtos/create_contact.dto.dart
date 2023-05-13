// ignore_for_file: public_member_api_docs, sort_constructors_first
class CreateContactDto {
  final String name;
  final String phone;
  final String address;
  final String email;
  CreateContactDto({
    required this.name,
    required this.phone,
    required this.address,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'address': address,
      'email': email,
    };
  }
}
