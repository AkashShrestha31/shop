import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class Params extends Equatable {
  final String username;
  final String password;

  Params({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}

class Search extends Equatable {
  final String search;

  Search({required this.search});

  @override
  List<Object> get props => [search];
}

class Page extends Equatable {
  final int page;

  Page({required this.page});

  @override
  List<Object> get props => [page];
}
