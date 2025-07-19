
import 'package:bloc/bloc.dart';
import '../../domain/usecases/category_usecase.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoryBloc(this.getCategoriesUseCase) : super(CategoryInitial()) {
    on<LoadCategories>((event, emit) async {
      emit(CategoryLoading());
      try {
        final categories = await getCategoriesUseCase(limit: event.limit);
        emit(CategoryLoaded(categories));
      } catch (e) {
        emit(CategoryError('Failed to load categories: ${e.toString()}'));
      }
    });
  }
}
