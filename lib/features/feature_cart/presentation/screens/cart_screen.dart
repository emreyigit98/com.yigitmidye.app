import 'package:firebase_app/core/extensions/snackbar_extension.dart';
import 'package:firebase_app/features/feature_cart/presentation/bloc/cart_bloc.dart';
import 'package:firebase_app/features/feature_cart/presentation/event/cart_event.dart';
import 'package:firebase_app/features/feature_cart/presentation/state/cart_state.dart';
import 'package:firebase_app/features/feature_cart/presentation/state/cart_status.dart';
import 'package:firebase_app/features/feature_cart/presentation/widgets/card/cart_product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(GetCartItemsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: const Text(
          "Sepetim",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<CartBloc, CartState>(
          listener: (context, state) {
            
            if (state.cartStatus is UploadCartItemFailure) {
              final message = state.cartStatus as UploadCartItemFailure;
              context.showSnackBar(message: message.exception);
            }
            if (state.cartStatus is UploadCartItemSuccess) {
              context.showSnackBar(message: "Ürün güncelleme başarılı.");
            }
            if (state.cartStatus is DeleteCartItemFailure) {
              final message = state.cartStatus as DeleteCartItemFailure;
              context.showSnackBar(message: message.exception);
            }
          },
          builder: (context, state) {
            final loading = state.cartStatus is DeleteCartItemLoading;

            if (state.cartStatus is CartItemsLoading) {
              return Center(child: CupertinoActivityIndicator());
            }
            if (state.cartStatus is CartItemsSuccess) {
              if (state.products.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LottieBuilder.asset(
                        "assets/lottie/shop.json",
                        width: 80,
                        height: 80,
                      ),
                      SizedBox(height: 20),
                      const Text("Sepetiniz boş, hadi bir şeyler seçelim!",style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700
                      )),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0XFFFA0351),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          context.pop();
                        },
                        child: Text("Keşfet"),
                      ),
                    ],
                  ),
                );
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return CartProductCart(
                          product: product,
                          minus: () {
                            if (product.quantity > 1) {
                              context.read<CartBloc>().add(
                                UploadCartItemsEvent(
                                  productId: product.productId,
                                  quantity: product.quantity - 1,
                                ),
                              );
                            }
                          },
                          plus: () {
                            context.read<CartBloc>().add(
                              UploadCartItemsEvent(
                                productId: product.productId,
                                quantity: product.quantity + 1,
                              ),
                            );
                          },
                          deleteCartItem: () {
                            context.read<CartBloc>().add(
                              DeleteCartItemEvent(product.productId),
                            );
                          },
                          loading: loading,
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 10,
                        bottom: 20,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Ara Toplam",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "${state.totalPrice.toStringAsFixed(2)} \u20ba",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Teslimat Ücreti",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "0.00 \u20ba",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Toplam",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "${state.totalPrice.toStringAsFixed(2)} \u20ba",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0XFFFA0351),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                context.push("/get-adress");
                              },
                              child: Text("Devam et"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            if (state.cartStatus is CartItemsFailure) {
              final exception = state.cartStatus as CartItemsFailure;
              return Center(child: Text(exception.exception));
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}