import 'package:calc_app/models/features_model.dart';
import 'package:calc_app/providers/db_features.dart';
import 'package:flutter/foundation.dart';

class ExpensesProvider extends ChangeNotifier {
  List<FeaturesModel> flist = [];

  addNewFeature(FeaturesModel newFeature) async {
    final id = await DBFeatures.db.addNewFeature(newFeature);
    newFeature.id = id;
    flist.add(newFeature);
    notifyListeners();
  }

  getAllFeatures() async {
    final response = await DBFeatures.db.getAllFeatures();
    flist = [...response];
    notifyListeners();
  }

  updateFeatures(FeaturesModel features) async {
    await DBFeatures.db.updateFeatures(features);
    getAllFeatures();
  }
}
