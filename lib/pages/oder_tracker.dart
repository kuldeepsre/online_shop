import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_tracker/order_tracker.dart';
import '../bloc/OrderTrackerBloc.dart';
import '../bloc/them/ThemeCubit.dart';
import '../components/loading_page.dart';

class OderTracker  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state;
    return Scaffold(
      backgroundColor: themeState.backgroundColor,
      appBar: AppBar(
        backgroundColor: themeState.backgroundColor,
        title: const Text("Order Tracker Demo"),
      ),
      body: BlocProvider(
        create: (context) => OrderTrackerBloc(),
        child: OrderTrackerWidget(),
      ),
    );
  }
}

class OrderTrackerWidget extends StatelessWidget {
  const OrderTrackerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderTrackerBloc, OrderTrackerState>(
      builder: (context, state) {
        if (state.status == OrderTrackerStatus.loading) {
          return  Center(
            child:LoadingPage(),
          );
        } else if (state.status == OrderTrackerStatus.error) {
          return Center(

            child: Text("Error: ${state.error}"),
          );
        }
        else {

          return GestureDetector(
            onTap: (){
           //  context.read<OrderTrackerBloc>().add(SelectOrderEvent(orderId: state.oderID));

            },
            child:OrderTracker(
              status: Status.delivered,
              activeColor: Colors.green,
              inActiveColor: Colors.grey[300],
              orderTitleAndDateList: state.orderList,
              shippedTitleAndDateList: state.shippedList,
              outOfDeliveryTitleAndDateList: state.outOfDeliveryList,
              deliveredTitleAndDateList: state.deliveredList,
            ));


        }
      },
    );
  }
}


