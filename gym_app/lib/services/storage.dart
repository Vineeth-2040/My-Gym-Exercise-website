import 'dart:convert';
import 'dart:io';
import '../models/workout.dart';

class WorkoutStorage {
  static Future<File> get _localFile async {
    String path;
    if (Platform.isAndroid) {
      path = '/data/data/com.gym.cycleplanner/files';
    } else {
      path = Directory.current.path;
    }
    
    final dir = Directory(path);
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    
    return File('$path/workout_data_v2.json');
  }

  // Load cycles from local file
  static Future<List<Cycle>> loadCycles() async {
    try {
      final file = await _localFile;
      if (await file.exists()) {
        final jsonString = await file.readAsString();
        final List<dynamic> jsonList = jsonDecode(jsonString) as List<dynamic>;
        return jsonList
            .map((item) => Cycle.fromJson(item as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      print("Error loading workout data: $e");
    }
    
    // Return default data if loading fails or file doesn't exist
    return getInitialWorkoutData();
  }

  // Save cycles to local file
  static Future<void> saveCycles(List<Cycle> cycles) async {
    try {
      final file = await _localFile;
      final jsonList = cycles.map((c) => c.toJson()).toList();
      final jsonString = jsonEncode(jsonList);
      await file.writeAsString(jsonString);
    } catch (e) {
      print("Error saving workout data: $e");
    }
  }
}
