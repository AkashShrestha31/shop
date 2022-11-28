import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetLoginData extends LoginEvent {
  final String username;
  final String password;

  GetLoginData(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}
