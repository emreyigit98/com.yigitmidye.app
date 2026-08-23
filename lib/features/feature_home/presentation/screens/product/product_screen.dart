import 'package:firebase_app/features/feature_home/domain/entities/product_entity.dart';
import 'package:firebase_app/features/feature_home/presentation/bloc/home_bloc.dart';
import 'package:firebase_app/features/feature_home/presentation/event/home_event.dart';
import 'package:firebase_app/features/feature_home/presentation/state/home_state.dart';
import 'package:firebase_app/features/feature_home/presentation/widgets/card/grid_card.dart';
import 'package:firebase_app/features/feature_home/presentation/widgets/card/horizontal_card.dart';
import 'package:firebase_app/features/feature_home/presentation/widgets/spacing/home_spacing.dart';
import 'package:firebase_app/features/feature_home/presentation/widgets/title/home_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: .start,
          children: [
            Text("İyi akşamlar'Emre",style: TextStyle(
              fontFamily: "Inter",
              fontSize: 10,
              fontWeight: FontWeight.w600
            ),),
            Text("Bugün canın midye mi çekti? 🦪",style: TextStyle(
              fontSize: 12
            ),)
          ],
        ),
        ),
      drawer: Drawer(),
      body: SafeArea(
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                HomeTitle(title: "Kategoriler"),
                HomeSpacing(),

                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 30,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        final category = state.categories[index];
                        final selected = category == state.initialCategory;

                        return GestureDetector(
                          onTap: () {
                            context.read<HomeBloc>().add(
                              SelectedCategoryEvent(category),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: selected
                                  ? Color(0xfffa0351)
                                  : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              category.categoryName,
                              style: TextStyle(
                                color: selected ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 8),
                    ),
                  ),
                ),

                HomeSpacing(),
                HomeTitle(title: "Kampanya'lı ürünler"),
                HomeSpacing(),

                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 150,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final product = state.campaignProducts[index];
                        return HorizontalCard(
                          onTap: () => _showProductSheet(context, product),
                          productEntity: product,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 8),
                      itemCount: state.campaignProducts.length,
                    ),
                  ),
                ),

                HomeSpacing(),
                HomeTitle(title: "${state.initialCategory?.categoryName}"),
                HomeSpacing(),

                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  sliver: SliverGrid.builder(
                    itemCount: state.filterProducts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.15,
                    ),
                    itemBuilder: (context, index) {
                      final product = state.filterProducts[index];
                      return GridCard(
                        onTap: () => _showProductSheet(context, product),
                        productEntity: product,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

void _showProductSheet(BuildContext context, ProductEntity product) {
  showModalBottomSheet(
    isScrollControlled: true,
    showDragHandle: true,
    context: context,
    builder: (context) {
      return ProductSheetContent(product: product);
    },
  );
}

class ProductSheetContent extends StatefulWidget {
  final ProductEntity product;
  const ProductSheetContent({super.key, required this.product});

  @override
  State<ProductSheetContent> createState() => _ProductSheetContentState();
}

class _ProductSheetContentState extends State<ProductSheetContent> {
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
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text("Toplam tutar",style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      )),
                      Text("${10.toStringAsFixed(2)} \u20Ba"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/minus_icon.svg",
                              width: 24,
                              height: 24,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text("1"),
                          SizedBox(width: 4),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/plus_icon.svg",
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          ),
                          backgroundColor: Color(0xFFFA0351),
                          foregroundColor: Colors.white
                        ),
                        onPressed: () {},
                        child: Text("Sepete ekle"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
