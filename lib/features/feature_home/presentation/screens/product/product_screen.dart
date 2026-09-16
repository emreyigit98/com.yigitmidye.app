import 'package:firebase_app/core/injection/injection.dart';
import 'package:firebase_app/core/session/presentation/cubit/display_name_cubit.dart';
import 'package:firebase_app/core/session/presentation/cubit/session_cubit.dart';
import 'package:firebase_app/core/session/presentation/state/session_state.dart';
import 'package:firebase_app/features/feature_cart/presentation/bloc/cart_count_cubit.dart';
import 'package:firebase_app/features/feature_cart/presentation/bloc/set_cart_cubit.dart';
import 'package:firebase_app/features/feature_home/domain/entities/product_entity.dart';
import 'package:firebase_app/features/feature_home/presentation/bloc/home_bloc.dart';
import 'package:firebase_app/features/feature_home/presentation/event/home_event.dart';
import 'package:firebase_app/features/feature_home/presentation/state/home_state.dart';
import 'package:firebase_app/features/feature_home/presentation/widgets/app_bar/login_message.dart';
import 'package:firebase_app/features/feature_home/presentation/widgets/app_bar/update_message.dart';
import 'package:firebase_app/features/feature_home/presentation/widgets/app_bar/welcome_message.dart';
import 'package:firebase_app/features/feature_home/presentation/widgets/card/grid_card.dart';
import 'package:firebase_app/features/feature_home/presentation/widgets/card/horizontal_card.dart';
import 'package:firebase_app/features/feature_home/presentation/widgets/drawer/drawer_content.dart';
import 'package:firebase_app/features/feature_home/presentation/widgets/sheet/product_content_sheet.dart';
import 'package:firebase_app/features/feature_home/presentation/widgets/sheet/update_name_sheet.dart';
import 'package:firebase_app/features/feature_home/presentation/widgets/spacing/home_spacing.dart';
import 'package:firebase_app/features/feature_home/presentation/widgets/title/home_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            actions: [
              BlocBuilder<CartCountCubit, int>(
                builder: (context, state) {
                  return Badge.count(
                    count: state,
                    isLabelVisible: state > 0,
                    backgroundColor: Color(0XFFFA0351),
                    textColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        context.push("/cart");
                      },
                      icon: Icon(LucideIcons.shoppingBag200),
                    ),
                  );
                },
              ),
              SizedBox(width: 20),
            ],
            title: state is Authenticated
                ? state.user.displayName == null
                      ? UpdateMessage(
                          onTap: () => _showUpdataNameSheet(context),
                        )
                      : WelcomeMessage(
                          displayName: state.user.displayName ?? "",
                        )
                : LoginMessage(
                    onTap: () {
                      context.push("/input-phone");
                    },
                  ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Container(height: 1, color: Colors.grey),
            ),
          ),
          drawer: state is Authenticated
              ? Drawer(
                  backgroundColor: Colors.white,
                  child: DrawerContent(
                    displayName: state.user.displayName,
                    goHome: () => context.pop(),
                    signOut: () {
                      context.pop();
                      context.read<SessionCubit>().signOut();
                    },
                  ),
                )
              : null,
          body: SafeArea(
            child: BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {},
              builder: (context, state) {
                return CustomScrollView(
                  slivers: [
                    HomeSpacing(),
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
                                    color: selected
                                        ? Colors.white
                                        : Colors.black,
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
                        height: 180,
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
      },
    );
  }
}

void _showProductSheet(BuildContext context, ProductEntity product) {
  showModalBottomSheet(
    isScrollControlled: true,
    showDragHandle: true,
    context: context,
    builder: (context) {
      return BlocProvider(
        create: (context) => servisLocarator<SetCartCubit>(),
        child: ProductSheetContent(product: product),
      );
    },
  );
}

void _showUpdataNameSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    isScrollControlled: true,
    showDragHandle: true,
    context: context,
    builder: (context) {
      return BlocProvider(
        create: (context) => servisLocarator<DisplayNameCubit>(),
        child: UpdateNameSheet(),
      );
    },
  );
}
