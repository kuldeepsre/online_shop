import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_tracker/order_tracker.dart';



enum OrderTrackerStatus {
  initial,
  loading,
  loaded,
  error,
}

class OrderTrackerState {
  final OrderTrackerStatus status;
  final List<TextDto> orderList;
  final List<TextDto> shippedList;
  final List<TextDto> outOfDeliveryList;
  final List<TextDto> deliveredList;
  final String? error;

  const OrderTrackerState({
    required this.status,
    this.orderList = const [],
    this.shippedList = const [],
    this.outOfDeliveryList = const [],
    this.deliveredList = const [],
    this.error,
  });

  OrderTrackerState copyWith({
    OrderTrackerStatus? status,
    List<TextDto>? orderList,
    List<TextDto>? shippedList,
    List<TextDto>? outOfDeliveryList,
    List<TextDto>? deliveredList,
    String? error,
  }) {
    return OrderTrackerState(
      status: status ?? this.status,
      orderList: orderList ?? this.orderList,
      shippedList: shippedList ?? this.shippedList,
      outOfDeliveryList: outOfDeliveryList ?? this.outOfDeliveryList,
      deliveredList: deliveredList ?? this.deliveredList,
      error: error ?? this.error,
    );
  }
}

class OrderTrackerEvent {}

class FetchOrderData extends OrderTrackerEvent {}

class OrderTrackerBloc extends Bloc<OrderTrackerEvent, OrderTrackerState> {
  OrderTrackerBloc() : super(OrderTrackerState(status: OrderTrackerStatus.initial));

  @override
  void onEvent(OrderTrackerEvent event) {
    if (event is FetchOrderData) {
      _fetchOrderData();
    }
  }

  void _fetchOrderData() async {
    try {
      // Simulating data loading from an asset file
      final String jsonString = await rootBundle.loadString('assets/order_data.json');
      final Map<String, dynamic> data = json.decode(jsonString);

      final orderList = (data['order'] as List)
          .map((item) => TextDto(item['text'], item['date']))
          .toList();
      final shippedList = (data['shipped'] as List)
          .map((item) => TextDto(item['text'], item['date']))
          .toList();
      final outOfDeliveryList = (data['out_of_delivery'] as List)
          .map((item) => TextDto(item['text'], item['date']))
          .toList();
      final deliveredList = (data['delivered'] as List)
          .map((item) => TextDto(item['text'], item['date']))
          .toList();

      // Emit a new state with the updated data
      emit(state.copyWith(
        status: OrderTrackerStatus.loaded,
        orderList: orderList,
        shippedList: shippedList,
        outOfDeliveryList: outOfDeliveryList,
        deliveredList: deliveredList,
      ));
    } catch (e) {
      // Handle errors
      emit(state.copyWith(status: OrderTrackerStatus.error, error: 'Failed to load data: $e'));
    }
  }
}
