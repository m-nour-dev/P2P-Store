import 'package:flutter/material.dart';

class FilterSortBottuns extends StatelessWidget {
  const FilterSortBottuns(
      {super.key, required this.myLabel, required this.myIcon});
  final Text myLabel;
  final Icon myIcon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 25,
        child: ElevatedButton.icon(
          onPressed: () {},
          label: Text(
            'filter',
            style: TextStyle(fontSize: 12),
          ),
          icon: Icon(Icons.filter_alt, size: 14),
          style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
              foregroundColor: Colors.grey,
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              side: BorderSide(color: Colors.grey)),
        ));
  }
}
