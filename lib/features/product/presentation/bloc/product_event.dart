import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class GetProductsEvent extends ProductEvent {
  final int limit;
  final int offset;

  const GetProductsEvent({required this.limit, required this.offset});

  @override
  List<Object?> get props => [limit, offset];
}
