import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/products/presentation/manager/toggle_favorite_cart_cubit.dart';
import 'package:p2p_store/features/products/presentation/pages/search_page.dart';

class DealOfTheDay extends StatelessWidget {
  const DealOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromARGB(255, 67, 146, 249),
      ),
      child: Stack(children: [
        Positioned(
          right: 15,
          top: 10,
          bottom: 10,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                      value: context.read<ToggleFavoriteCartCubit>(),
                      child: SearchPage(
                          selectedCategory:
                              'groceries')), 
                ),
              );
            },
            icon: Icon(Icons.arrow_forward_outlined),
            label: const Text('View all'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 6),
              backgroundColor: Color.fromARGB(255, 67, 146, 249),
              foregroundColor: Colors.white,
              iconAlignment: IconAlignment.end,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
        Positioned(
            left: 15,
            top: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deal of the Day',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
                Text(
                  'Available for a limited time',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ))
      ]),
    );
  }
}
