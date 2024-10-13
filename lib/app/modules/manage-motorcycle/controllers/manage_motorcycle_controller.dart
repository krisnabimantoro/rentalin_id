import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rentalin_id/app/data/models/motor.dart';

class ManageMotorcycleController extends GetxController {
  //TODO: Implement ManageMotorcycleController
   static const String _baseUrl = 'http://10.0.2.2:4300/';
  static const String _category = 'motor';
  
  RxList<Datum> data = RxList<Datum>([]);
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    await fetchArticles();
    super.onInit();
  }

  Future<void> fetchArticles() async{
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${_baseUrl}$_category'));
      print(response);

      if (response.statusCode == 200) {
        final jsonData = response.body;
        final result = Motor.fromJson(json.decode(jsonData));
        data.value = result.data;
        // articles.value = articlesResult.articles;
      }else{
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred :$e');
    } finally {
      isLoading.value = false;
    }
  }
  

  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
}
