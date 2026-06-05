import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'theme.dart';
import 'models/workout.dart';
import 'services/storage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Cycle> _cycles;
  bool _isLoading = true;
  bool _isEditMode = false;
  String _backupJson = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final data = await WorkoutStorage.loadCycles();
    setState(() {
      _cycles = data;
      _isLoading = false;
    });
  }

  void _enterEditMode() {
    setState(() {
      _backupJson = jsonEncode(_cycles.map((c) => c.toJson()).toList());
      _isEditMode = true;
    });
  }

  void _cancelEdits() {
    final List<dynamic> backupList = jsonDecode(_backupJson) as List<dynamic>;
    setState(() {
      _cycles = backupList.map((item) => Cycle.fromJson(item as Map<String, dynamic>)).toList();
      _isEditMode = false;
    });
  }

  Future<void> _saveEdits() async {
    setState(() {
      _isLoading = true;
    });
    await WorkoutStorage.saveCycles(_cycles);
    setState(() {
      _isEditMode = false;
      _isLoading = false;
    });
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Workout plan saved successfully!',
            style: TextStyle(fontFamily: AppTheme.fontFamily),
          ),
          backgroundColor: AppTheme.accentDeep,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _changeSets(Exercise exercise, int delta) {
    int currentSets = int.tryParse(exercise.sets) ?? 3;
    int newSets = (currentSets + delta).clamp(1, 99);
    setState(() {
      exercise.sets = newSets.toString();
    });
  }

  void _changeReps(Exercise exercise, int delta) {
    String repsStr = exercise.reps.trim().toLowerCase();
    
    if (repsStr.endsWith('s')) {
      // Handles seconds (e.g. '40s')
      int currentReps = int.tryParse(repsStr.replaceAll('s', '')) ?? 30;
      // Change seconds by steps of 5
      int newReps = (currentReps + (delta * 5)).clamp(5, 300);
      setState(() {
        exercise.reps = '${newReps}s';
      });
    } else {
      // Handles standard count (e.g. '10')
      int currentReps = int.tryParse(repsStr) ?? 10;
      int newReps = (currentReps + delta).clamp(1, 999);
      setState(() {
        exercise.reps = newReps.toString();
      });
    }
  }

  void _deleteExercise(WorkoutDay day, Exercise exercise) {
    setState(() {
      day.exercises.remove(exercise);
    });
  }

  void _addExercise(WorkoutDay day) {
    setState(() {
      day.exercises.add(
        Exercise(
          name: 'New Exercise',
          sets: '3',
          reps: '10',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: AppTheme.backgroundDecoration,
          ),
          // Radial overlay
          AppTheme.radialBackgroundOverlay(),
          
          // Main Content or Loader
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(AppTheme.accent),
                  ),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 90.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Hero Section Card (matching CSS style.css)
                        _buildHeroSection(),
                        const SizedBox(height: 24.0),
                        
                        // Cycles List
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _cycles.length,
                          separatorBuilder: (context, index) => const SizedBox(height: 20.0),
                          itemBuilder: (context, index) {
                            return _buildCycleCard(_cycles[index]);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
      
      // Floating Action Button for entering edit mode
      floatingActionButton: !_isEditMode && !_isLoading
          ? FloatingActionButton.extended(
              onPressed: _enterEditMode,
              backgroundColor: AppTheme.accentDeep,
              icon: const Icon(Icons.edit, color: Colors.white),
              label: const Text(
                'Edit Plan',
                style: TextStyle(
                  fontFamily: AppTheme.fontFamily,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,

      // Sticky Bottom Navigation Bar for saving/canceling edits
      bottomNavigationBar: _isEditMode && !_isLoading
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: const Border(
                  top: BorderSide(
                    color: AppTheme.line,
                    width: 1.0,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _cancelEdits,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppTheme.muted),
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontFamily: AppTheme.fontFamily,
                          color: AppTheme.muted,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _saveEdits,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.accentDeep,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: const Text(
                        'Save Plan',
                        style: TextStyle(
                          fontFamily: AppTheme.fontFamily,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }

  Widget _buildHeroSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFFFFAF2).withOpacity(0.96),
            const Color(0xFFF9EBD8).withOpacity(0.82),
          ],
        ),
        borderRadius: BorderRadius.circular(28.0),
        border: Border.all(
          color: Colors.white.withOpacity(0.5),
          width: 1.0,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppTheme.shadow,
            blurRadius: 50,
            offset: Offset(0, 18),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'WORKOUT SPLIT',
            style: AppTheme.eyebrowStyle,
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Simple Plan V1',
            style: AppTheme.heroTitleStyle,
          ),
          const SizedBox(height: 12.0),
          const Text(
            'Each cycle contains 3 training days: Pull, Push, and Leg/Core.',
            style: AppTheme.heroDescriptionStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildCycleCard(Cycle cycle) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.panel,
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: Colors.white.withOpacity(0.65),
          width: 1.0,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppTheme.shadow,
            blurRadius: 50,
            offset: Offset(0, 18),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cycle Header
              InkWell(
                onTap: () {
                  setState(() {
                    cycle.isExpanded = !cycle.isExpanded;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cycle.name,
                            style: AppTheme.cycleTitleStyle,
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            cycle.note,
                            style: AppTheme.cycleNoteStyle,
                          ),
                        ],
                      ),
                    ),
                    _buildToggleButton(cycle.isExpanded),
                  ],
                ),
              ),
              
              // Collapsible Day List
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                alignment: Alignment.topCenter,
                child: cycle.isExpanded
                    ? Column(
                        children: [
                          const SizedBox(height: 16.0),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cycle.days.length,
                            separatorBuilder: (context, index) => const SizedBox(height: 14.0),
                            itemBuilder: (context, index) {
                              return _buildDayCard(cycle.days[index]);
                            },
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDayCard(WorkoutDay day) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: AppTheme.panelStrong,
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(
          color: AppTheme.line,
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Day Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _isEditMode
                    ? TextFormField(
                        initialValue: day.name,
                        style: AppTheme.dayTitleStyle.copyWith(
                          color: AppTheme.accentDeep,
                        ),
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.accent),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.accentDeep, width: 2.0),
                          ),
                        ),
                        onChanged: (value) {
                          day.name = value;
                        },
                      )
                    : InkWell(
                        onTap: () {
                          setState(() {
                            day.isExpanded = !day.isExpanded;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            day.name,
                            style: AppTheme.dayTitleStyle,
                          ),
                        ),
                      ),
              ),
              _buildToggleButton(day.isExpanded, small: true, onTap: () {
                setState(() {
                  day.isExpanded = !day.isExpanded;
                });
              }),
            ],
          ),
          
          // Collapsible Exercise List
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: day.isExpanded
                ? Column(
                    children: [
                      const SizedBox(height: 12.0),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: day.exercises.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 8.0),
                        itemBuilder: (context, index) {
                          return _buildExerciseCard(day, day.exercises[index]);
                        },
                      ),
                      
                      // Add Exercise Button (Edit Mode only)
                      if (_isEditMode) ...[
                        const SizedBox(height: 12.0),
                        TextButton.icon(
                          onPressed: () => _addExercise(day),
                          icon: const Icon(Icons.add, color: AppTheme.accentDeep, size: 18),
                          label: const Text(
                            'Add Exercise',
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              color: AppTheme.accentDeep,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            backgroundColor: AppTheme.badgeBg,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(color: AppTheme.line),
                            ),
                          ),
                        ),
                      ],
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseCard(WorkoutDay day, Exercise exercise) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: AppTheme.line,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          // Left Side: Name and Badges
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _isEditMode
                    ? TextFormField(
                        initialValue: exercise.name,
                        style: AppTheme.exerciseNameStyle,
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.line),
                          ),
                        ),
                        onChanged: (value) {
                          exercise.name = value;
                        },
                      )
                    : Text(
                        exercise.name,
                        style: AppTheme.exerciseNameStyle.copyWith(
                          decoration: exercise.isCompleted
                              ? TextDecoration.lineThrough
                              : null,
                          color: exercise.isCompleted
                              ? AppTheme.muted
                              : AppTheme.text,
                        ),
                      ),
                const SizedBox(height: 8.0),
                
                // Sets and Reps adjustments
                Row(
                  children: [
                    _isEditMode
                        ? _buildEditableMetaBadge(
                            'Sets: ${exercise.sets}',
                            onMinus: () => _changeSets(exercise, -1),
                            onPlus: () => _changeSets(exercise, 1),
                          )
                        : _buildMetaBadge('Sets: ${exercise.sets}'),
                    const SizedBox(width: 8.0),
                    _isEditMode
                        ? _buildEditableMetaBadge(
                            'Reps: ${exercise.reps}',
                            onMinus: () => _changeReps(exercise, -1),
                            onPlus: () => _changeReps(exercise, 1),
                          )
                        : _buildMetaBadge('Reps: ${exercise.reps}'),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(width: 8.0),
          
          // Right Side: Action Checkbox (Normal) or Delete Icon (Edit)
          _isEditMode
              ? IconButton(
                  onPressed: () => _deleteExercise(day, exercise),
                  icon: const Icon(
                    Icons.delete_outline,
                    color: AppTheme.accentDeep,
                    size: 24,
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      exercise.isCompleted = !exercise.isCompleted;
                    });
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: exercise.isCompleted ? AppTheme.accent : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: exercise.isCompleted ? AppTheme.accent : AppTheme.line,
                        width: 1.5,
                      ),
                    ),
                    child: exercise.isCompleted
                        ? const Icon(
                            Icons.check,
                            size: 18,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildMetaBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: AppTheme.badgeBg,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: AppTheme.line,
          width: 1.0,
        ),
      ),
      child: Text(
        label,
        style: AppTheme.badgeStyle,
      ),
    );
  }

  Widget _buildEditableMetaBadge(
    String label, {
    required VoidCallback onMinus,
    required VoidCallback onPlus,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: AppTheme.badgeBg,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: AppTheme.line,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onMinus,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Icon(Icons.remove, size: 14, color: AppTheme.accentDeep),
            ),
          ),
          Text(
            label,
            style: AppTheme.badgeStyle,
          ),
          GestureDetector(
            onTap: onPlus,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Icon(Icons.add, size: 14, color: AppTheme.accentDeep),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(bool isExpanded, {bool small = false, VoidCallback? onTap}) {
    final double size = small ? 28.0 : 34.0;
    final widget = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: AppTheme.line,
          width: 1.0,
        ),
      ),
      child: Center(
        child: AnimatedRotation(
          turns: isExpanded ? 0.0 : -0.25, // rotated -90 degrees when collapsed
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeInOut,
          child: Icon(
            Icons.keyboard_arrow_down,
            size: small ? 18 : 22,
            color: AppTheme.accentDeep,
          ),
        ),
      ),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(size),
        child: widget,
      );
    }
    return widget;
  }
}
