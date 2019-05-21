import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable()
class User extends Object {
final int id;
final String email;
@JsonKey(name :'first_name')
final String firstName;
@JsonKey(name :'last_name')
final String lastName;
final String avatar;
User(this.id,this.email,this.firstName,this.avatar,this.lastName);
factory User.fromJson(Map<String,dynamic > json) => _$UserFromJson(json) ;
Map<String , dynamic > toJson()=> _$UserToJson(this);
}



