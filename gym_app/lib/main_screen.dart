import 'dart:ui';
import 'package:flutter/material.dart';
import 'theme.dart';
import 'models/workout.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Cycle> _cycles;

  @override
  void initState() {
    super.initState();
    _cycles = getInitialWorkoutData();
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
          
          // Main Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
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
          InkWell(
            onTap: () {
              setState(() {
                day.isExpanded = !day.isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    day.name,
                    style: AppTheme.dayTitleStyle,
                  ),
                ),
                _buildToggleButton(day.isExpanded, small: true),
              ],
            ),
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
                          return _buildExerciseCard(day.exercises[index]);
                        },
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseCard(Exercise exercise) {
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
          // Left: Name & Badges
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
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
                Row(
                  children: [
                    _buildMetaBadge('Sets: ${exercise.sets}'),
                    const SizedBox(width: 8.0),
                    _buildMetaBadge('Reps: ${exercise.reps}'),
                  ],
                ),
              ],
            ),
          ),
          
          // Right: Circular Tap Checkbox
          GestureDetector(
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

  Widget _buildToggleButton(bool isExpanded, {bool small = false}) {
    final double size = small ? 28.0 : 34.0;
    return Container(
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
  }
}
