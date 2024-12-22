import 'dart:convert';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/models/motor.dart';

import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var motors = <Motor>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;
      var fetchedMotors = await getPosts();
      motors.assignAll(fetchedMotors); // Update the observable list
    } catch (e) {
      print('Error fetching posts: $e');
    } finally {
      isLoading.value = false;
    }
  }

  static Future<List<Motor>> getPosts() async {
    var url = Uri.parse("https://mobile.mentorinaja.my.id/api/motor");
    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final List body = json.decode(response.body);
      return body.map((e) => Motor.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
