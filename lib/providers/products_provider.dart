import 'dart:developer';

import 'package:ecom/modals/products.dart';
import 'package:ecom/repo/products_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsController {
  final bool isLoading;
  final List<Products> allProductsList;
  final String? errorMessage;
  final bool? isError;

  ProductsController({
    required this.isLoading,
    required this.allProductsList,
    this.errorMessage,
    this.isError,
  });

  ProductsController copyWith({
    bool? isLoading,
    List<Products>? allProductsList,
    String? errorMessage,
    bool? isError,
  }) {
    return ProductsController(
      isLoading: isLoading ?? this.isLoading,
      allProductsList: allProductsList ?? this.allProductsList,
      errorMessage: errorMessage ?? this.errorMessage,
      isError: isError ?? this.isError,
    );
  }
}

class ProductsProvider extends StateNotifier<ProductsController> {
  ProductsProvider(this.ref)
      : super(ProductsController(isLoading: false, allProductsList: []));

  final Ref ref;
  Future getAllProducts() async {
    state = state.copyWith(isLoading: true);
    final data = await ref.read(productsRepoProvider).getAllProducts();
    state = state.copyWith(
      isLoading: false,
      allProductsList: data,
      isError: false,
      errorMessage: null,
    );
  }
}

final productsProvider =
    StateNotifierProvider<ProductsProvider, ProductsController>(
        (ref) => ProductsProvider(ref));
