import 'package:ecom/repo/products_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/products_provider.dart';

class AllProductsScreen extends ConsumerStatefulWidget {
  const AllProductsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllProductsState();
}

class _AllProductsState extends ConsumerState<AllProductsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ref.read to call a function
    // ref.read is used in a function
    Future.microtask(() {
      ref.read(productsProvider.notifier).getAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final productsNotifier = ref.watch(productsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      body: productsNotifier.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: productsNotifier.allProductsList.length,
              itemBuilder: (context, index) {
                final product = productsNotifier.allProductsList[index];
                return ListTile(
                  title: Text(product.title!),
                  subtitle: Text(product.price.toString()),
                );
              },
            ),
    );
  }
}
