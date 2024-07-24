import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  // TODO: implement your AuthEntity
  final String id;
  final String email;

  const AuthEntity({required this.id, required this.email});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
