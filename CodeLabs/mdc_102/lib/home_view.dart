import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:mdc_101/model/product.dart';
import 'package:mdc_101/model/products_repository.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Add buttons and title
        title: const Text('SHRINE'),
        leading: IconButton(
          onPressed: () {
          }, 
          icon: const Icon(
            Icons.menu, 
            semanticLabel: 'menu',
            )
          ),
        actions: [
          IconButton(
            onPressed: () {
            }, 
            icon: const Icon(
              Icons.search, 
              semanticLabel: 'search',
              )
            ),
          IconButton(
            onPressed: () {
            }, 
            icon: const Icon(
              Icons.tune, 
              semanticLabel: 'filter',
              )
            )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2, 
        padding: const EdgeInsets.all(16.0), 
        childAspectRatio: 8.0 / 9.0, 
        children: _buildGridCards(context)
      ),
    );
  }
}

List<Card> _buildGridCards(BuildContext context) {
  List<Product> products = ProductsRepository.loadProducts(Category.all);

  if (products.isEmpty) {
    return const <Card>[];
  }

  final ThemeData theme = Theme.of(context);
  final NumberFormat formatter = NumberFormat.simpleCurrency(
    locale: Localizations.localeOf(context).toString()
  );

  return products.map((product) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(aspectRatio: 18 / 11,
          child: Center(
            child: Text('No Images')
            )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: theme.textTheme.titleLarge,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 8.0,),
                  Text(
                    formatter.format(product.price),
                    style: theme.textTheme.titleSmall,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }).toList();
}