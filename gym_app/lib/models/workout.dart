class Exercise {
  String name;
  String sets;
  String reps;
  bool isCompleted;

  Exercise({
    required this.name,
    required this.sets,
    required this.reps,
    this.isCompleted = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'sets': sets,
      'reps': reps,
      'isCompleted': isCompleted,
    };
  }

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      name: json['name'] as String,
      sets: json['sets'] as String,
      reps: json['reps'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }
}

class WorkoutDay {
  String name;
  List<Exercise> exercises;
  bool isExpanded;

  WorkoutDay({
    required this.name,
    required this.exercises,
    this.isExpanded = true,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'exercises': exercises.map((e) => e.toJson()).toList(),
      'isExpanded': isExpanded,
    };
  }

  factory WorkoutDay.fromJson(Map<String, dynamic> json) {
    return WorkoutDay(
      name: json['name'] as String,
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
          .toList(),
      isExpanded: json['isExpanded'] as bool? ?? true,
    );
  }
}

class Cycle {
  String name;
  String note;
  List<WorkoutDay> days;
  bool isExpanded;

  Cycle({
    required this.name,
    required this.note,
    required this.days,
    this.isExpanded = true,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'note': note,
      'days': days.map((d) => d.toJson()).toList(),
      'isExpanded': isExpanded,
    };
  }

  factory Cycle.fromJson(Map<String, dynamic> json) {
    return Cycle(
      name: json['name'] as String,
      note: json['note'] as String,
      days: (json['days'] as List<dynamic>)
          .map((d) => WorkoutDay.fromJson(d as Map<String, dynamic>))
          .toList(),
      isExpanded: json['isExpanded'] as bool? ?? true,
    );
  }
}

// Global data list recreated from app.js
List<Cycle> getInitialWorkoutData() {
  return [
    Cycle(
      name: 'Cycle 1',
      note: 'Days 1-3',
      days: [
        WorkoutDay(
          name: 'Day 1: Push',
          exercises: [
            Exercise(name: 'chest machine', sets: '4', reps: '8'),
            Exercise(name: 'lateral raise', sets: '3', reps: '10'),
            Exercise(name: 'overhead dumbell extension', sets: '3', reps: '8'),
            Exercise(name: 'chest dips', sets: '3', reps: '12'),
          ],
        ),
        WorkoutDay(
          name: 'Day 2: Pull',
          exercises: [
            Exercise(name: 'chest machine opposite', sets: '4', reps: '8'),
            Exercise(name: 'lat pull down', sets: '3', reps: '10'),
            Exercise(name: 'dumbell curl', sets: '3', reps: '10'),
            Exercise(name: 'biceps machine', sets: '3', reps: '12'),
          ],
        ),
        WorkoutDay(
          name: 'Day 3: Leg+Core',
          exercises: [
            Exercise(name: 'Back squats', sets: '4', reps: '8'),
            Exercise(name: 'Leg press', sets: '3', reps: '12'),
            Exercise(name: 'Lying leg curl', sets: '3', reps: '12'),
            Exercise(name: 'Calf raises', sets: '3', reps: '15'),
            Exercise(name: 'Decline situps', sets: '3', reps: '15'),
            Exercise(name: 'Hanging leg raise', sets: '3', reps: '12'),
            Exercise(name: 'Russian-twist', sets: '3', reps: '12'),
            Exercise(name: 'Plank-hold', sets: '3', reps: '30'),
          ],
        ),
      ],
    ),
    Cycle(
      name: 'Cycle 2',
      note: 'Days 4-6',
      days: [
        WorkoutDay(
          name: 'Day 1: Push',
          exercises: [
            Exercise(name: 'inclined press', sets: '3', reps: '8'),
            Exercise(name: 'barbell standing raise', sets: '3', reps: '10'),
            Exercise(name: 'cabel push down', sets: '3', reps: '12'),
            Exercise(name: 'push ups', sets: '3', reps: '10'),
          ],
        ),
        WorkoutDay(
          name: 'Day 2: Pull',
          exercises: [
            Exercise(name: 'roman deadlift', sets: '3', reps: '15'),
            Exercise(name: 'cabel curl', sets: '3', reps: '10'),
            Exercise(name: 'lower back machine', sets: '3', reps: '12'),
            Exercise(name: 'inclined dumbell curl', sets: '3', reps: '12'),
          ],
        ),
        WorkoutDay(
          name: 'Day 3: Pure core',
          exercises: [
            Exercise(name: 'Cable crunch', sets: '3', reps: '12'),
            Exercise(name: 'Side plank hip dip', sets: '3', reps: '12'),
            Exercise(name: 'Ab wheel rollout', sets: '3', reps: '15'),
            Exercise(name: 'Bicycle crunches', sets: '3', reps: '20'),
            Exercise(name: 'lying leg raise', sets: '3', reps: '20'),
          ],
        ),
      ],
    ),
    Cycle(
      name: 'Cycle 3',
      note: 'Days 7-9',
      days: [
        WorkoutDay(
          name: 'Day 1: Push',
          exercises: [
            Exercise(name: 'skull crusher', sets: '4', reps: '8'),
            Exercise(name: 'dumbell bench press', sets: '3', reps: '10'),
            Exercise(name: 'front raise', sets: '3', reps: '12'),
            Exercise(name: 'inclined supported row', sets: '3', reps: '10'),
          ],
        ),
        WorkoutDay(
          name: 'Day 2: Pull',
          exercises: [
            Exercise(name: 'pull ups', sets: '4', reps: '8'),
            Exercise(name: 'T-row', sets: '3', reps: '10'),
            Exercise(name: 'bicep machine', sets: '3', reps: '12'),
            Exercise(name: 'forarms curls', sets: '3', reps: '10'),
          ],
        ),
        WorkoutDay(
          name: 'Day 3: Leg/Core',
          exercises: [
            Exercise(name: 'leg press', sets: '4', reps: '10'),
            Exercise(name: 'romanian deadlift', sets: '3', reps: '12'),
            Exercise(name: 'lateral lunge', sets: '3', reps: '15'),
            Exercise(name: 'calf raises', sets: '3', reps: '15'),
            Exercise(name: 'Weighted crunch', sets: '3', reps: '12'),
            Exercise(name: 'Lying leg raise', sets: '3', reps: '40s'),
            Exercise(name: 'Roman chair', sets: '3', reps: '40s'),
            Exercise(name: 'Side plank hip dip', sets: '3', reps: '40s'),
          ],
        ),
      ],
    ),
    Cycle(
      name: 'Cycle 4',
      note: 'Days 10-12',
      days: [
        WorkoutDay(
          name: 'Day 1: Push',
          exercises: [
            Exercise(name: 'triceps bench dips', sets: '4', reps: '6'),
            Exercise(name: 'Lateral raises', sets: '3', reps: '10'),
            Exercise(name: 'chest machine', sets: '3', reps: '12'),
            Exercise(name: 'seated dumbell press', sets: '3', reps: '12'),
          ],
        ),
        WorkoutDay(
          name: 'Day 2: Pull',
          exercises: [
            Exercise(name: 'lower back machine', sets: '4', reps: '8'),
            Exercise(name: 'bicep machine', sets: '3', reps: '10'),
            Exercise(name: 'roman Dead lift', sets: '3', reps: '12'),
            Exercise(name: 'cabel curls', sets: '3', reps: '10'),
          ],
        ),
        WorkoutDay(
          name: 'Day 3: Core',
          exercises: [
            Exercise(name: 'hanging leg raise', sets: '3', reps: '12'),
            Exercise(name: 'russian twist weighted', sets: '3', reps: '12'),
            Exercise(name: 'ab wheel rollout', sets: '3', reps: '10'),
            Exercise(name: 'bicycle crunches', sets: '3', reps: '20'),
            Exercise(name: 'plank hold', sets: '3', reps: '45s'),
          ],
        ),
      ],
    ),
  ];
}
