import 'package:firebase_app/core/constants/constants.dart';
import 'package:firebase_app/core/entity/payment_entity.dart';
import 'package:firebase_app/core/extensions/snackbar_extension.dart';
import 'package:firebase_app/features/feature_cart/presentation/bloc/cart_bloc.dart';
import 'package:firebase_app/features/feature_cart/presentation/event/cart_event.dart';
import 'package:firebase_app/features/feature_cart/presentation/state/cart_state.dart';
import 'package:firebase_app/features/feature_cart/presentation/state/order_status.dart';
import 'package:firebase_app/features/feature_cart/presentation/widgets/card/payment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentEntity? entity;

  @override
  Widget build(BuildContext context) {
    final payments = Constants.payments;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text(
          "Ödeme seçimi",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state.orderStatus is OrderSetSuccess) {
            context.go("/result");
          }
          if (state.orderStatus is OrderSetFailure) {
            final message = state.orderStatus as OrderSetFailure;
            context.showSnackBar(message: message.message);
          }
        },
        builder: (context, state) {
          final loading = state.orderStatus is OrderSetLoading;

          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: payments.length,
                      itemBuilder: (context, index) {
                        final payment = payments[index];
                        final selected = payment == entity;
                        return PaymentCard(
                          entity: payment,
                          selected: selected,
                          onTap: () {
                            setState(() {
                              entity = payment;
                            });
                            context.read<CartBloc>().add(
                              UpdatePaymentEvent(entity),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFFFA0351),
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: Colors.grey.shade200,
                      minimumSize: Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: loading
                        ? null
                        : () {
                            if (entity == null) {
                              context.showSnackBar(
                                message: "Lütfen ödeme yöntemi seçin",
                              );
                            } else {
                              context.read<CartBloc>().add(SetOrderItemEvent());
                            }
                          },
                    child: loading
                        ? SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                              color: Colors.white,
                            ),
                          )
                        : Text("Siparişi tamamla"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
