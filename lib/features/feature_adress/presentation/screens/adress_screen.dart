import 'package:firebase_app/features/feature_adress/presentation/bloc/adress_bloc.dart';
import 'package:firebase_app/features/feature_adress/presentation/event/adress_event.dart';
import 'package:firebase_app/features/feature_adress/presentation/state/adress_state.dart';
import 'package:firebase_app/features/feature_adress/presentation/state/adress_status.dart';
import 'package:firebase_app/features/feature_adress/presentation/widget/card/adress_card.dart';
import 'package:firebase_app/features/feature_adress/presentation/widget/empty_adress/empty_adress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AdressScreen extends StatefulWidget {
  const AdressScreen({super.key});

  @override
  State<AdressScreen> createState() => _AdressScreenState();
}

class _AdressScreenState extends State<AdressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Adreslerim",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: BlocConsumer<AdressBloc, AdressState>(
          listener: (context, state) {},
          builder: (context, state) {

            if (state.status is GetAdressSuccess) {
              final data = state.adresses;
              if (data.isEmpty) {
                return EmptyAdress(
                  onPressed: () async {
                    await context.push("/save-adress");
                    if (!context.mounted) return;
                    context.read<AdressBloc>().add(GetAdressEvent());
                  },
                );
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final adress = data[index];
                        return AdressCard(entity: adress, onTap: () {
                          context.read<AdressBloc>().add(DeleteAdressEvent(adress));
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Color(0XFFFA0351),
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () async {
                         await context.push("/save-adress");
                         if(!context.mounted) return;
                         context.read<AdressBloc>().add(GetAdressEvent());
                        },
                        child: Text("Adres ekle"),
                      ),
                    ),
                  ),
                ],
              );
            }

            if (state.status is GetAdressFailure) {
              final exception = state.status as GetAdressFailure;
              return Center(child: Text(exception.message));
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}