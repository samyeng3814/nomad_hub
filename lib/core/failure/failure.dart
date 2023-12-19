import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
@override
List<Object> get props =>[];

}

class NetworkFailure extends Failure{
  final String message;
  NetworkFailure({required this.message});
}


class ServerFailure extends Failure{
  final String message;
  ServerFailure({required this.message});
}