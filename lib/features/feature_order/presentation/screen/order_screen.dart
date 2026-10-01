import 'package:firebase_app/features/feature_order/presentation/bloc/orders_cubit.dart';
import 'package:firebase_app/features/feature_order/presentation/state/order_state.dart';
import 'package:firebase_app/features/feature_order/presentation/widget/card/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Siparişlerim",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: BlocBuilder<OrdersCubit, OrderState>(
          builder: (context, state) {
            return switch (state) {
              GetOrderIdle() => SizedBox.shrink(),
              GetOrderLoading() => Center(child: CircularProgressIndicator()),
              GetOrderSuccess(:final orders) =>
                orders.isEmpty
                    ? Center(child: Text("Boş"))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child: Text(
                              "Son 10 siparişinizi buradan görüntüleyebilirsiniz.",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 14,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: orders.length,
                              itemBuilder: (context, index) {
                                final order = state.orders[index];
                                return OrderCard(order: order);
                              },
                            ),
                          ),
                        ],
                      ),
              GetOrderFailure(:final message) => Center(child: Text(message)),
            };
          },
        ),
      ),
    );
  }
}
