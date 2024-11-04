import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rentalin_id/app/data/models/motor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/models/motorcycle.dart';

class ManageMotorcycleController extends GetxController {
  // Stream<List<Motorcycle>> getMotorcycles() {
  //   return FirebaseFirestore.instance
  //       .collection('Manage MotorCycle')
  //       .snapshots()
  //       .map((snapshot) => snapshot.docs
  //           .map((doc) => Motorcycle.fromJson(doc.data(), doc.id))
  //           .toList());
  // }

//   Stream<List<Motorcycle>> getMotorcycles() {
//   return FirebaseFirestore.instance.collection('motorcycles').snapshots().map(
//     (snapshot) => snapshot.docs.map(
//       (doc) {
//         final data = doc.data() as Map<String, dynamic>;
//         return Motorcycle(
//           id: doc.id,
//           make: data['make'],
//           model: data['model'],
//           year: data['year'],
//         );
//       },
//     ).toList(),
//   );
// }


  //TODO: Implement ManageMotorcycleController
  //  static const String _baseUrl = 'http://10.0.2.2:4300/';
  // static const String _category = 'motor';

  // RxList<Datum> data = RxList<Datum>([]);
  // RxBool isLoading = false.obs;

  // @override
  // void onInit() async {
  //   await fetchArticles();
  //   super.onInit();
  // }

  // Future<void> fetchArticles() async{
  //   try {
  //     isLoading.value = true;
  //     final response = await http.get(Uri.parse('${_baseUrl}$_category'));
  //     print(response);

  //     if (response.statusCode == 200) {
  //       final jsonData = response.body;
  //       final result = Motor.fromJson(json.decode(jsonData));
  //       data.value = result.data;
  //       // articles.value = articlesResult.articles;
  //     }else{
  //       print('Request failed with status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('An error occurred :$e');
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
  // static const String _baseUrl = 'http://10.0.2.2:4300/';
  // static const String _category = 'motor';

  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // var motorcycle = {}.obs;

  // RxList<Datum> data = RxList<Datum>([]);
  // RxBool isLoading = false.obs;

  // @override
  // void onInit() async {
  //   await fetchArticles();
  //   super.onInit();
  // }

  // Future<void> fetchMotorcycleDetails(String motorcycleId) async {
  //   try {
  //     var documentSnapshot = await _firestore
  //         .collection('Manage Motorcycle')
  //         .doc(motorcycleId)
  //         .get();
  //     motorcycle.value = documentSnapshot.data() ?? {};
  //   } catch (e) {
  //     print("Error fetching motorcycle details: $e");
  //   }
  // }

  // Future<void> deleteMotorcycle(String id) async {
  //   try {
  //     await _firestore.collection('Manage Motorcycle').doc(id).delete();
  //     Get.back();  // Navigate back after deletion
  //     Get.snackbar('Success', 'Motorcycle deleted successfully');
  //   } catch (e) {
  //     Get.snackbar('Error', 'Failed to delete data: $e');
  //   }
  // }

  // Future<void> fetchArticles() async{
  //   try {
  //     isLoading.value = true;
  //     final response = await http.get(Uri.parse('${_baseUrl}$_category'));
  //     print(response);

  //     if (response.statusCode == 200) {
  //       final jsonData = response.body;
  //       final result = Motor.fromJson(json.decode(jsonData));
  //       data.value = result.data;
  //       // articles.value = articlesResult.articles;
  //     }else{
  //       print('Request failed with status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('An error occurred :$e');
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

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
