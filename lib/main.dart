import 'package:ecom/ui/all_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: Ecom()));
}

class Ecom extends StatelessWidget {
  const Ecom({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
        home: AllProductsScreen(),
    );
  }
}

