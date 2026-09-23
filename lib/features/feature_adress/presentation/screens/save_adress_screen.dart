import 'package:firebase_app/features/feature_adress/domain/entity/adress_entity.dart';
import 'package:firebase_app/features/feature_adress/presentation/bloc/adress_bloc.dart';
import 'package:firebase_app/features/feature_adress/presentation/event/adress_event.dart';
import 'package:firebase_app/features/feature_adress/presentation/state/adress_state.dart';
import 'package:firebase_app/features/feature_adress/presentation/state/adress_status.dart';
import 'package:firebase_app/features/feature_adress/presentation/widget/sheet/select_neigh_sheet.dart';
import 'package:firebase_app/features/feature_adress/presentation/widget/text_fields/adress_location_textfield.dart';
import 'package:firebase_app/features/feature_adress/presentation/widget/text_fields/note_textfield.dart';
import 'package:firebase_app/features/feature_adress/presentation/widget/text_fields/user_info_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SaveAdressScreen extends StatefulWidget {
  const SaveAdressScreen({super.key});

  @override
  State<SaveAdressScreen> createState() => _SaveAdressScreenState();
}

class _SaveAdressScreenState extends State<SaveAdressScreen> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final cityController = TextEditingController(text: "Balıkesir");
  final districtController = TextEditingController(text: "Bandırma");
  final neighController = TextEditingController();
  final streetController = TextEditingController();
  final apartmentController = TextEditingController();
  final builderController = TextEditingController();
  final noteController = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    cityController.dispose();
    districtController.dispose();
    neighController.dispose();
    streetController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text(
          "Yeni adres ekle",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 14,
            fontWeight: FontWeight.w600,
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
        child: BlocConsumer<AdressBloc, AdressState>(
          listener: (context, state) {
            if (state.status is SaveAdressSuccess) {
              context.pop();
            }
          },
          builder: (context, state) {
            final loading = state.status is SaveAdressLoading;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Expanded(
                    child: Form(
                      key: key,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Siparişlerinizin doğru adrese ulaşması için lütfen adres bilgilerinizi eksiksiz doldurun.",
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: UserInfoTextfield(
                                    controller: nameController,
                                    title: "Adınız",
                                    labelText: "Adınızı girin",
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: UserInfoTextfield(
                                    controller: surnameController,
                                    title: "Soyadınız",
                                    labelText: "Soyadınızı girin",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: AdressLocationTextfield(
                                    title: "İl",
                                    suffixIcon: Icon(Icons.arrow_drop_down),
                                    prefixIcon: Icon(
                                      Icons.location_on_outlined,
                                    ),
                                    hintText: null,
                                    readOnly: true,
                                    color: Colors.grey.shade200,
                                    controller: cityController,
                                    onTap: null,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: AdressLocationTextfield(
                                    title: "İl",
                                    hintText: null,
                                    suffixIcon: Icon(Icons.arrow_drop_down),
                                    prefixIcon: Icon(
                                      Icons.location_on_outlined,
                                    ),
                                    readOnly: true,
                                    color: Colors.grey.shade200,
                                    controller: districtController,
                                    onTap: null,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            AdressLocationTextfield(
                              title: "Mahalle",
                              hintText: "Mahalle seçin",
                              suffixIcon: Icon(Icons.arrow_drop_down),
                              prefixIcon: Icon(Icons.location_on_outlined),
                              readOnly: true,
                              color: Colors.white,
                              controller: neighController,
                              onTap: () {
                                _showBottomSheet(context, (neigh) {
                                  neighController.text = neigh;
                                  context.pop();
                                });
                              },
                            ),
                            SizedBox(height: 10),
                            AdressLocationTextfield(
                              title: "Sokak",
                              hintText: "Sokak giriniz",
                              suffixIcon: null,
                              prefixIcon: Icon(Icons.location_on_outlined),
                              readOnly: false,
                              color: Colors.white,
                              controller: streetController,
                              onTap: null,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: AdressLocationTextfield(
                                    title: "Dış Kapı",
                                    hintText: "Dış kapı numarası",
                                    suffixIcon: null,
                                    prefixIcon: Icon(
                                      Icons.door_front_door_outlined,
                                    ),
                                    readOnly: false,
                                    color: Colors.white,
                                    controller: apartmentController,
                                    onTap: null,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: AdressLocationTextfield(
                                    title: "İç Kapı",
                                    hintText: "İç kapı numarası",
                                    suffixIcon: null,
                                    prefixIcon: Icon(
                                      Icons.door_front_door_outlined,
                                    ),
                                    readOnly: false,
                                    color: Colors.white,
                                    controller: builderController,
                                    onTap: null,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            NoteTextfield(controller: noteController),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFFFA0351),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: loading
                          ? null
                          : () {
                              if (key.currentState!.validate()) {
                                final entity = AdressEntity(
                                  id: "",
                                  name: nameController.text,
                                  surname: surnameController.text,
                                  city: cityController.text,
                                  district: districtController.text,
                                  neigh: neighController.text,
                                  street: streetController.text,
                                  apartmentNo: apartmentController.text,
                                  builderNo: builderController.text,
                                  note: noteController.text,
                                );
                                context.read<AdressBloc>().add(
                                  SaveAdressEvent(entity),
                                );
                              }
                            },
                      child: loading
                          ? SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 1,
                              ),
                            )
                          : Text("Kaydet"),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context, Function(String) onChanged) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    isScrollControlled: true,
    showDragHandle: true,
    context: context,
    builder: (context) {
      return SelectNeighSheet(onChanged: onChanged);
    },
  );
}
