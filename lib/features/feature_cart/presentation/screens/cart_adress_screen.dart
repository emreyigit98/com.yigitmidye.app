import 'package:firebase_app/features/feature_adress/domain/entity/adress_entity.dart';
import 'package:firebase_app/features/feature_cart/presentation/bloc/cart_bloc.dart';
import 'package:firebase_app/features/feature_cart/presentation/event/cart_event.dart';
import 'package:firebase_app/features/feature_cart/presentation/state/adress_status.dart';
import 'package:firebase_app/features/feature_cart/presentation/state/cart_state.dart';
import 'package:firebase_app/features/feature_cart/presentation/state/cart_status.dart';
import 'package:firebase_app/features/feature_cart/presentation/widgets/card/adress_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class CartAdressScreen extends StatefulWidget {
  const CartAdressScreen({super.key});

  @override
  State<CartAdressScreen> createState() => _CartAdressScreenState();
}

class _CartAdressScreenState extends State<CartAdressScreen> {
  AdressEntity? adress;

  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(GetAdressItemEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text(
          "Adres seçimi",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<CartBloc, CartState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.adressStatus is GetAdressItemFailure) {}

            if (state.adressStatus is GetAdressItemSuccess) {
              final data = state.adresses;

              if (data.isEmpty) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LottieBuilder.asset(
                        "assets/lottie/location.json",
                        width: 80,
                        height: 80,
                      ),
                      SizedBox(height: 10),
                      const Text(
                        "Devam etmek için bir teslimat adresi ekleyin.",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0XFFFA0351),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () async {
                          await context.push("/save-adress");
                          if (!context.mounted) return;
                          context.read<CartBloc>().add(GetAdressItemEvent());
                        },
                        child: Text("Adres ekle"),
                      ),
                    ],
                  ),
                );
              }

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Kayıtlı Adreslerim",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await context.push("/save-adress");
                            if (!context.mounted) return;
                            context.read<CartBloc>().add(GetAdressItemEvent());
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              border: Border.all(
                                color: Colors.grey.shade400,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.add),
                                SizedBox(width: 4),
                                Text(
                                  "Yeni Adres",
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final entity = data[index];
                          final selected = entity == adress;

                          return AdressCard(
                            entity: entity,
                            selected: selected,
                            onTap: () {
                              setState(() {
                                adress = entity;
                              });
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0XFFFA0351),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        child: Text("Devam et"),
                      ),
                    ),
                  ],
                ),
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
