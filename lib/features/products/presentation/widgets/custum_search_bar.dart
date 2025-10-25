import 'package:flutter/material.dart';
import 'package:p2p_store/features/products/data/models/product_models.dart';

class CustumSearchBar extends StatelessWidget {
  const CustumSearchBar({super.key, required this.products});
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (context, controller) => SizedBox(
        height: 40,
        child: SearchBar(
          controller: controller,
          hintText: 'Search any product...',
          leading: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          elevation: WidgetStateProperty.all(0),
          hintStyle: WidgetStateProperty.all(TextStyle(color: Colors.grey)),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(6)))),
          backgroundColor: WidgetStateProperty.all(
              Theme.of(context).colorScheme.onPrimaryContainer),
          side: WidgetStateProperty.resolveWith<BorderSide>((states) {
            if (states.contains(WidgetState.focused)) {
              return BorderSide(
                  color: Theme.of(context).colorScheme.primary, width: 2);
            }

            return BorderSide(color: Colors.grey, width: 0.8);
          }),
        ),
      ),
      suggestionsBuilder: (context, controller) {
        final query = controller.text;
        final suggestions = products
            .where((p) => p.title.toLowerCase().contains(query.toLowerCase()))
            .toList();

        return List.generate(suggestions.length, (index) {
          return ListTile(
            title: Text(suggestions[index].title),
          );
        });
      },
    );
  }
}
