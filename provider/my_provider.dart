import 'package:api_provider/api/api.dart';
import 'package:api_provider/models/models.dart';
import 'package:flutter/widgets.dart';

class Provides extends ChangeNotifier {
  GetApiClass getApiClass = GetApiClass();

  CustomApiProvider<ApiDemo> customApiProvider = CustomApiProvider<ApiDemo>();

  Future<CustomApiProvider<ApiDemo>> getProvider() async {
    customApiProvider = await getApiClass.getData();
    notifyListeners();
    return customApiProvider;
  }
}
 