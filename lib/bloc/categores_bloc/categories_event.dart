part of 'categories_bloc.dart';

// Events
abstract class CategoriesEvent {}
class LoadCategories extends CategoriesEvent {}


class SelectCategory extends CategoriesEvent {
  final int categoryId;


  SelectCategory({required this.categoryId});
}
abstract class ProductsEvent {}

class LoadProducts extends ProductsEvent {
  final int categoryId;

  LoadProducts(this.categoryId);
}

