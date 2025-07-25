import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object?> get props => [];
}

class LoadCategories extends CategoryEvent {
  final int limit;

  const LoadCategories({required this.limit});

  @override
  List<Object?> get props => [limit];
}
