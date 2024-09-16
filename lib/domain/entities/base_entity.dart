import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

abstract class BaseEntity extends Equatable {
  final String id;
  final DateTime createdAt;

  BaseEntity({
    String? id,
    DateTime? createdAt, // Thêm required createdAt
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now();

  @override
  List<Object?> get props => [id, createdAt];
}
