import 'package:firebase_app/features/feature_home/presentation/widgets/spacing/home_spacing.dart';
import 'package:firebase_app/features/feature_home/presentation/widgets/title/home_title.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            HomeTitle(title: "Kategoriler"),
            HomeSpacing(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 36,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ChoiceChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      label: Text("Midye'ler"),
                      selected: false,
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  itemCount: 4,
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
                    return GestureDetector(
                      onTap: () => _showProductSheet(context),
                      child: SizedBox(
                        width: 160,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    "assets/images/mussel_five.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "50(adet karışık.) midye dolma",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "Inter",
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "500.00 Tl",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "Inter",
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  itemCount: 10,
                ),
              ),
            ),
            HomeSpacing(),
            HomeTitle(title: "Midye'ler"),
            HomeSpacing(),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverGrid.builder(
                itemCount: 5,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.15,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _showProductSheet(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                "assets/images/mussel_tree.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "50(adet karışık.) midye dolma",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Inter",
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "500.00 Tl",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Inter",
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showProductSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    showDragHandle: true,
    context: context,
    builder: (context) {
      return ProductSheetContent();
    },
  );
}

class ProductSheetContent extends StatefulWidget {
  const ProductSheetContent({super.key});

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
                        child: Image.asset(
                          "assets/images/mussel_five.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "50(adet karışık.) midye dolma",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "50 adet karışık(7-8 cm.) aralığında midye dolma limon ile gönderim yapılır.",
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
            Container(color: Colors.grey, width: double.infinity, height: 100),
          ],
        ),
      ),
    );
  }
}