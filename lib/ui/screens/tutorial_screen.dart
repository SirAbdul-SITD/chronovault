import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../widgets/animated_bg.dart';
import '../widgets/gold_button.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  int _page = 0;

  static const _steps = [
    _TutStep(
      icon: Icons.apps_rounded,
      title: 'READ THE EVENTS',
      body: 'Each round gives you 6 historical events out of order. Study them carefully — some are tricky!',
    ),
    _TutStep(
      icon: Icons.swap_vert_rounded,
      title: 'DRAG TO SORT',
      body: 'Press and hold any card, then drag it up or down to place it in what you think is the correct chronological order.',
    ),
    _TutStep(
      icon: Icons.timer_rounded,
      title: 'RACE THE CLOCK',
      body: 'Every round has a countdown. Answer faster to earn 3 stars. Finish with time to spare — but don\'t rush into a mistake!',
    ),
    _TutStep(
      icon: Icons.star_rounded,
      title: 'EARN STARS',
      body: 'Get all 6 events in the right order to win stars. 3 stars for speed, 2 for a solid effort, 1 for just making it. Unlock all 50 rounds!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final step = _steps[_page];
    final isLast = _page == _steps.length - 1;

    return Scaffold(
      body: AnimatedBackground(
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: AppTheme.inkMid, size: 20),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Text('HOW TO PLAY',
                          textAlign: TextAlign.center,
                          style: AppTheme.heading(size: 14, color: AppTheme.goldPrime)),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
              ),
              const Spacer(),
              // Icon
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.bgPanel,
                  border: Border.all(color: AppTheme.goldPrime.withOpacity(0.4), width: 2),
                ),
                child: Icon(step.icon, color: AppTheme.goldLight, size: 52),
              ),
              const SizedBox(height: 28),
              // Step indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_steps.length, (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: i == _page ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: i == _page
                        ? AppTheme.goldPrime
                        : AppTheme.inkFaint.withOpacity(0.4),
                  ),
                )),
              ),
              const SizedBox(height: 28),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    Text(step.title,
                        textAlign: TextAlign.center,
                        style: AppTheme.heading(size: 18, color: AppTheme.goldPrime)),
                    const SizedBox(height: 14),
                    Text(step.body,
                        textAlign: TextAlign.center,
                        style: AppTheme.body(size: 15, color: AppTheme.inkMid)),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 28, 32),
                child: Row(
                  children: [
                    if (_page > 0)
                      Expanded(
                        child: OutlineButton(
                          label: 'BACK',
                          onTap: () => setState(() => _page--),
                        ),
                      ),
                    if (_page > 0) const SizedBox(width: 12),
                    Expanded(
                      child: GoldButton(
                        label: isLast ? 'GOT IT!' : 'NEXT',
                        onTap: () {
                          if (isLast) {
                            Navigator.pop(context);
                          } else {
                            setState(() => _page++);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TutStep {
  final IconData icon;
  final String title;
  final String body;
  const _TutStep({required this.icon, required this.title, required this.body});
}
