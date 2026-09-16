import 'package:firebase_app/core/extensions/snackbar_extension.dart';
import 'package:firebase_app/features/feature_cart/presentation/bloc/set_cart_cubit.dart';
import 'package:firebase_app/features/feature_cart/presentation/state/set_cart_state.dart';
import 'package:firebase_app/features/feature_home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class ProductSheetContent extends StatefulWidget {
  final ProductEntity product;
  const ProductSheetContent({super.key, required this.product});

  @override
  State<ProductSheetContent> createState() => _ProductSheetContentState();
}

class _ProductSheetContentState extends State<ProductSheetContent> {

  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 220,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          widget.product.productImg,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.product.productName,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.product.productTitle,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            BlocConsumer<SetCartCubit, SetCartState>(
              listener: (context, state) {
                if(state is SetCartSuccess) {
                  
                  context.showSnackBar(message: "Ürün başarılı şekilde sepete eklendi.");  
                  context.pop();
                }
                if(state is SetCartError) {
                  Fluttertoast.showToast(msg: state.message,toastLength: Toast.LENGTH_LONG);
                }
              },
              builder: (context, state) {

                final totalPrice = quantity * widget.product.productPrice;
                final loading = state is SetCartLoading;
                
                return SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            "Toplam tutar",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("${totalPrice.toStringAsFixed(2)} \u20Ba"),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: quantity > 1
                                    ? () {
                                        setState(() {
                                          if (quantity > 1) {
                                            quantity--;
                                          }
                                        });
                                      }
                                    : null,
                                icon: SvgPicture.asset(
                                  "assets/icons/minus_icon.svg",
                                  width: 24,
                                  height: 24,
                                  colorFilter: ColorFilter.mode(
                                    quantity <= 1
                                        ? Colors.grey.shade600
                                        : Colors.black,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              SizedBox(width: 4),
                              Text("$quantity"),
                              SizedBox(width: 4),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                icon: SvgPicture.asset(
                                  "assets/icons/plus_icon.svg",
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 40),
                          Expanded(child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: Color(0xFFFA0351),
                              foregroundColor: Colors.white,
                            ),
                            onPressed: loading ? null : () {
                              context.read<SetCartCubit>().setCartItem(quantity, widget.product.productId);
                            },
                            child: loading ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 1,color: Colors.white),
                            ) : Text("Sepete ekle"),
                          )),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}