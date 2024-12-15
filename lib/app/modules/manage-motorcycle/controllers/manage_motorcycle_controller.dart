import 'dart:ffi';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rentalin_id/app/data/models/motor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/models/motorcycle.dart';

class ManageMotorcycleController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GetStorage _storage = GetStorage();

  final RxBool isConnected = false.obs;


  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen((connectivityResults) {
// Jika connectivityResults adalah List<ConnectivityResult>, kita ambil hasil pertama
      _updateConnectionStatus(connectivityResults.first);
    });
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) async {
// kondisi dimana aplikasi mendeteksi bawha tidak ada koneksi samasekali
    if (connectivityResult == ConnectivityResult.none) {
      isConnected.value = false;
  
      _showSnackbar('Not Connected to Internet', Colors.red);
    } else {
      isConnected.value = true;

      print("tes${isConnected.value}");
      _showSnackbar('Connected to Internet', Colors.green);
      syncLocalDataToFirestore("Manage MotorCycle");
// else merupakan kondisi jika aplikasi terhubung dengan koneksi wifi atau mobile data
    }
    isConnected.refresh();
  }

  Future<void> saveData(String collection, Map<String, dynamic> data) async {
  
    if (isConnected.value) {
      try {
        await _firestore.collection(collection).add(data);
        _showSnackbar('Data saved to Firestore', Colors.green);
      } catch (e) {
        _showSnackbar('Failed to save to Firestore: $e', Colors.red);
      }
    } else {
      _storage.write(collection, data);
      print(_storage.read(collection));
      _showSnackbar('No internet. Data saved locally', Colors.orange);
    }
  }

  Future<void> syncLocalDataToFirestore(String collection) async {
    final localData = _storage.read(collection);
    print(localData);
    if (localData != null) {
      try {
        await _firestore.collection(collection).add(localData);
        _storage.remove(collection); // Clear local data after syncing
        print(localData);
        _showSnackbar('Local data synced to Firestore', Colors.blue);
      } catch (e) {
        _showSnackbar('Failed to sync local data: $e', Colors.red);
      }
    }
  }

  void _showSnackbar(String message, Color color) {
    Get.snackbar(
      'Notification',
      message,
      backgroundColor: color,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

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
