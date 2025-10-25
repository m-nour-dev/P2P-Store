import 'package:flutter/material.dart';

class FilterSortButtons extends StatelessWidget {
  final String myLabel;
  final Icon myIcon;
  final Function(String)? onOptionSelected;

  const FilterSortButtons({
    super.key,
    required this.myLabel,
    required this.myIcon,
    this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: PopupMenuButton<String>(
        onSelected: onOptionSelected,
        itemBuilder: (context) {
          if (myLabel.toLowerCase() == 'sort') {
            return const [
              PopupMenuItem(
                value: 'price_low_to_high',
                child: Text('From cheapest to most expensive'),
              ),
              PopupMenuItem(
                value: 'price_high_to_low',
                child: Text('From most expensive to cheapest'),
              ),
              PopupMenuItem(
                value: 'newest_first',
                child: Text('Newest to oldest'),
              ),
              PopupMenuItem(
                value: 'oldest_first',
                child: Text('Oldest to newest'),
              ),
            ];
          } else if (myLabel.toLowerCase() == 'filter') {
            return const [
              PopupMenuItem(
                value: 'in_stock',
                child: Text('In stock only'),
              ),
              PopupMenuItem(
                value: 'high_rating',
                child: Text('Highest rated'),
              ),
            ];
          } else {
            return const [];
          }
        },
        child: ElevatedButton.icon(
          onPressed: null,
          label: Text(myLabel, style: const TextStyle(fontSize: 12)),
          icon: myIcon,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.onTertiary,
            foregroundColor: Colors.grey,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            side: const BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
