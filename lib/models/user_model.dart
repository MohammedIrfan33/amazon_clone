// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String uaerId;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;
  final String name;

  UserModel({required this.name ,required this.uaerId, required this.email, required this.password, required this.address, required this.type, required this.token});



  

 



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uaerId': uaerId,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
      'token': token,
      'name': name,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uaerId: map['uaerId'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      address: map['address'] as String,
      type: map['type'] as String,
      token: map['token'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());


   factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uaerId: json['_id'],
      email: json['email'],
      password: json['password'],
      address: json['address'],
      type: json['type'],
      token: json['token'],
      name: json['name'],
    );
  }

}
