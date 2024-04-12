import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:order_tracker/order_tracker.dart';




class OderTracker extends StatefulWidget {
  const OderTracker({Key? key}) : super(key: key);

  @override
  State<OderTracker> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OderTracker> {
  List<TextDto> orderList = [];
  List<TextDto> shippedList = [];
  List<TextDto> outOfDeliveryList = [];
  List<TextDto> deliveredList = [];

  Future<void> fetchData() async {
    final String jsonString = await rootBundle.loadString('assets/order_data.json');
    final Map<String, dynamic> data = json.decode(jsonString);
    setState(() {
      orderList = (data['order'] as List)
          .map((item) => TextDto(item['text'], item['date']))
          .toList();
      shippedList = (data['shipped'] as List)
          .map((item) => TextDto(item['text'], item['date']))
          .toList();
      outOfDeliveryList = (data['out_of_delivery'] as List)
          .map((item) => TextDto(item['text'], item['date']))
          .toList();
      deliveredList = (data['delivered'] as List)
          .map((item) => TextDto(item['text'], item['date']))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Tracker Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: OrderTracker(
          status: Status.delivered,
          activeColor: Colors.green,
          inActiveColor: Colors.grey[300],
          orderTitleAndDateList: orderList,
          shippedTitleAndDateList: shippedList,
          outOfDeliveryTitleAndDateList: outOfDeliveryList,
          deliveredTitleAndDateList: deliveredList,
        ),
      ),
    );
  }
}
