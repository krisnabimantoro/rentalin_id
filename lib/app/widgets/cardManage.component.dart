// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:rentalin_id/app/data/constant/color.dart';
// import 'package:rentalin_id/app/data/models/motor.dart';
// import 'package:rentalin_id/app/modules/manage-motorcycle/controllers/manage_motorcycle_controller.dart';
// import 'package:rentalin_id/app/modules/manage-motorcycle/models/motorcycle.dart';
// import 'package:rentalin_id/app/modules/manage-motorcycle/views/detail_manage_motorcycle_view.dart';

// class CardManageMotor extends StatelessWidget {
//   final Datum dataLoad;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final ManageMotorcycleController controller = Get.put(ManageMotorcycleController());
//   final String motorcycleId;

//   Stream<QuerySnapshot> getTasks() {
//     return firestore.collection('Manage MotorCycle').snapshots();
//   }

//   CardManageMotor({
//     super.key,
//     required this.dataLoad,
//     required this.motorcycleId,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<DocumentSnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('Manage MotorCycle')
//           .doc(motorcycleId)
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }

//         if (!snapshot.hasData || !snapshot.data!.exists) {
//           return Text("Motorcycle data not available.");
//         }

//         var data = snapshot.data!;
//         return InkWell(
//           onTap: () {
//             controller.fetchMotorcycleDetails(motorcycleId);
//             Get.to(
//               DetailManageMotorcycleView(
//                 dataLoad: dataLoad, // Pass document snapshot data
//                 motorcycleId: motorcycleId,
//               ),
//               arguments: data,
//             );
//           },
//           child: Container(
//             width: 344,
//             height: 95,
//             margin: EdgeInsets.only(top: 15),
//             padding: EdgeInsets.fromLTRB(5, 5, 15, 5),
//             decoration: BoxDecoration(
//               color: tdWhite,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: -3,
//                   blurRadius: 6,
//                   offset: Offset(0, 2),
//                 ),
//               ],
//               borderRadius: BorderRadius.all(Radius.circular(8)),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       width: 103,
//                       height: 85,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(
//                               "assets/img/img1.jpg"),
//                           fit: BoxFit.cover,
//                         ),
//                         borderRadius: const BorderRadius.all(Radius.circular(8)),
//                       ),
//                     ),
//                     SizedBox(width: 12),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           data['Merk Motor'] ?? '',
//                           style: const TextStyle(fontSize: 10),
//                         ),
//                         Text(
//                           data['Motor Name'] ?? '',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           data['Plat Motor'] ?? '',
//                           style: TextStyle(fontSize: 11, color: tdGrey),
//                         ),
//                         const SizedBox(height: 10),
//                         Row(
//                           children: [
//                             Text(
//                               data['price/Day']?.toString() ?? '',
//                               style: TextStyle(
//                                   color: tdBlue, fontWeight: FontWeight.w700),
//                             ),
//                             Text(
//                               "/Day",
//                               style: TextStyle(color: tdGrey),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Container(
//                       width: 33,
//                       height: 33,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage("assets/icon/chevron-right.png"),
//                         ),
//                         color: tdBlue,
//                         borderRadius: BorderRadius.all(Radius.circular(8)),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }