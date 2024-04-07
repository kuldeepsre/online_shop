import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../Api_Services/api_repository.dart';
import '../../Api_Services/response_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetProductList>((event, emit) async {
      try {
        emit(ProductLoading());
        final mList = await _apiRepository.fetchProductList();
        emit(ProductLoaded(mList));
        if (mList.error != null) {
          emit(ProductError(mList.error));
        }
      } on NetworkError {
        emit(
            const ProductError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
