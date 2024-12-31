import 'dart:ffi';

import 'package:dzienniczek_baristy/logics/brew_data_logic.dart';
import 'package:dzienniczek_baristy/logics/register_logic.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> AddNewPost(BrewData brewData) async {
  final db = await loadDatabase();
  final prefs = await SharedPreferences.getInstance();
  final userIdString = prefs.getString('user_id');
  if (userIdString == null) {
    throw Exception("User ID not found in SharedPreferences.");
  }

  final userId = int.tryParse(userIdString);
  if (userId == null) {
    throw Exception("Invalid User ID format.");
  }

  print("User ID: $userId");
  await db.transaction((txn) async{
    int postId = await txn.insert('users_post', {
      'user_id': userId,
      'rating': brewData.selectedRating,
      'brew_date': brewData.brewDate,
      'brew_method' : brewData.brewMethod,
    });
    txn.insert('post_origin_details', {
      'post_id': postId,
      'country_origin': brewData.originCountry,
      'region': brewData.originFarm,
      'processing': brewData.originProcessing,
      'variety': brewData.originVariety,
      'roast_date': brewData.originRoastDate,
      'roastery': brewData.originRoastery,
      'roast_type': brewData.originRoastType,
      'farm_alt': brewData.originFarmAlt,
    });
    txn.insert('post_notes', {
      'post_id': postId,
      'origin_notes': brewData.originNotes,
      'brew_notes': brewData.brewNotes,
      'sensory_notes': '',
    });
    txn.insert('brew_details', {
      'post_id': postId,
      'coarsness': brewData.brewCoarsness,
      'coffee_weight': brewData.brewCoffeeGrams,
      'water_weight': brewData.brewWaterGrams,
      'water_temp': brewData.brewWaterTemp,
      'total_weight': '',
      'total_time': brewData.brewTotalTime,
      'tds_value': '',
    });

  });
}