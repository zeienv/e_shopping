import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/product_usecase.dart';
import 'product_event.dart';
import 'product_state.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase getProductsUseCase;

  ProductBloc(this.getProductsUseCase) : super(ProductInitial()) {
    on<GetProductsEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final result = await getProductsUseCase(
          limit: event.limit,
          offset: event.offset,
        );
        print('Fetched products count: \n${result.length}');
        emit(ProductSuccess(result.map((e) => e.toEntity()).toList()));
      } catch (e) {
        print('Product fetch error: \n$e');
        emit(ProductError(e.toString()));
      }
    });
  }
}
