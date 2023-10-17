import 'package:flutter/material.dart';
import 'package:fooderlich/components/grocery_tile.dart';
import 'package:fooderlich/models/models.dart';
import 'grocery_item_screen.dart';

class GroceryListScreen extends StatelessWidget {

  final GroceryManager manager;

  const GroceryListScreen({
    super.key,
    required this.manager,
  });

  @override
  Widget build(BuildContext context) {
    final groceryItems = manager.groceryItems;
    return Padding(
        padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
          itemBuilder: (context, index){
            final item = groceryItems[index];
            //TODO: Wrap in a Dismissable
            //TODO: Wrap in an InkWell
            return GroceryTile(
              key: Key(item.id),
                item: item,
              onComplete: (change){
                if(change != null){
                  manager.completeItem(index, change);
                }
              },
            );
          },
          separatorBuilder: (context, index){
            return const SizedBox(height: 16.0,);
          },
          itemCount: groceryItems.length,
      ),
    );
  }
}
