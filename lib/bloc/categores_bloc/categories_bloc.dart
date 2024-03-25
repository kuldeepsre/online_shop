import 'package:bloc/bloc.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../model_response/Category.dart';

part 'categories_event.dart';
part 'categories_state.dart';

// Bloc for categories
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {

  CategoriesBloc() : super(CategoriesLoading()) {


    on<LoadCategories>((event, emit) async {
      try {
        final List<dynamic> categoriesJson = [
          {"id": 1, "name": "Electronics"},
          {"id": 2, "name": "Clothing"},
          {"id": 3, "name": "Books"},
          {"id": 4, "name": "Home Appliances"}
        ];
        final List<Category> categories = categoriesJson
            .map((data) => Category.fromJson(data))
            .toList();
        emit(CategoriesLoaded(categories, null));
      } catch (e) {
        emit(CategoriesError());
      }
    });

    on<SelectCategory>((event, emit) {
      final currentState = state;
      if (currentState is CategoriesLoaded) {
        emit(CategoriesLoaded(currentState.categories, event.categoryId));


       // Dispatch event with category ID
      }
    });

  }
}

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final int categoryId;

  ProductsBloc(this.categoryId) : super(ProductsLoading()){

    on<LoadProducts>((event, emit) async {
      try {
        final List<Product> products = List.generate(
          10,
              (index) => Product(
            id: index + 1,
            name: 'Product ${index + 1}',
            description: 'Sample Description ${index + 1}',
            price: 10.0 + index.toDouble(),
            categoryId: event.categoryId,
          ),
        );

        print("categoryId  ${ event.categoryId}");
        emit(ProductsLoaded(products));

      } catch (e) {

        emit(ProductsError());
      }
    });




  }


}