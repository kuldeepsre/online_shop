part of 'categories_bloc.dart';


abstract class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}


class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<Category> categories;
  final int? selectedCategoryId;

  CategoriesLoaded(this.categories, this.selectedCategoryId);
}

class CategoriesError extends CategoriesState {}

abstract class ProductsState {}
class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;

  ProductsLoaded(this.products);
}

class ProductsError extends ProductsState {}
