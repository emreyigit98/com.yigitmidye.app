import 'package:firebase_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class SelectNeighSheet extends StatelessWidget {
  
  final Function(String) onChanged;
  const SelectNeighSheet({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final neigh = Constants.neigh;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView.builder(
          itemCount: neigh.length,
          itemBuilder: (context, index) {
            final neighBorhood = neigh[index];
            return ListTile(
              title: Text(neighBorhood),
              onTap: () => onChanged(neighBorhood),
            );
          },
        ),
      ),
    );
  }
}