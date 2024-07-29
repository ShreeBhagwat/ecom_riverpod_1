import 'dart:developer';

import 'package:ecom/modals/products.dart';
import 'package:ecom/netwroking/api_endpoints.dart';
import 'package:ecom/netwroking/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsRepo {
  final Ref ref;

  ProductsRepo(this.ref);

  Future<List<Products>> getAllProducts() async {
    try {
      final response = await ref
          .read(dioClientProvider)
          .get(APIEndpoints.GetProductsEndPoint);
      if (response.statusCode == 200) {
        final List<Products> productsList = [];
        final List<dynamic> products = response.data['products'];
        products.forEach((element) {
          productsList.add(Products.fromJson(element));
        });
        return productsList;
      } else {
        return Future.error(response.statusMessage!);
      }
    } catch (e) {
      log(e.toString());
      return Future.error(e);
    }
  }
}

final productsRepoProvider = Provider<ProductsRepo>((ref) => ProductsRepo(ref));
