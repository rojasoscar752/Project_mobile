import 'package:calc_app/models/features_model.dart';
import 'package:calc_app/utils/constants.dart';
import 'package:calc_app/utils/utils.dart';
import 'package:calc_app/widgets/add_expenses/create_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calc_app/providers/expenses_provider.dart';

class AdminCategory extends StatelessWidget {
  const AdminCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final fList = context.watch<ExpensesProvider>().flist;

    return ListView.builder(
        itemCount: fList.length,
        itemBuilder: (context, i) {
          var item = fList[i];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(item.icon.toIcon(),
                  size: 35.0, color: item.color.toColor()),
              title: Text(item.category),
              trailing: const Icon(
                Icons.edit,
                size: 25.0,
              ),
              onTap: () {
                Navigator.pop(context);
                _createCategory(context, item);
              },
            ),
          );
        });
  }

  _createCategory(BuildContext context, FeaturesModel fModel) {
    var features = FeaturesModel(
        id: fModel.id,
        category: fModel.category,
        color: fModel.color,
        icon: fModel.icon);
    showModalBottomSheet(
        shape: Constants.bottomSheet(),
        context: context,
        builder: (_) => CreateCategory(fModel: features));
  }
}
