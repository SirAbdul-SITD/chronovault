class VaultEvent {
  final int year;
  final String label;
  const VaultEvent({required this.year, required this.label});

  String get displayYear {
    if (year < 0) return '${year.abs()} BC';
    if (year < 100) return 'c. $year AD';
    return year.toString();
  }
}

class VaultRound {
  final int id;
  final int tier; // 1=Apprentice 2=Scholar 3=Historian 4=Grandmaster
  final String category;
  final int timeLimitSecs;
  final List<VaultEvent> events;

  const VaultRound({
    required this.id,
    required this.tier,
    required this.category,
    required this.timeLimitSecs,
    required this.events,
  });

  String get tierLabel {
    switch (tier) {
      case 1: return 'APPRENTICE';
      case 2: return 'SCHOLAR';
      case 3: return 'HISTORIAN';
      case 4: return 'GRANDMASTER';
      default: return 'APPRENTICE';
    }
  }
}

enum CheckResult { correct, wrong, timeout }

class RoundResult {
  final int roundId;
  final int stars;          // 0-3
  final int timeTaken;      // seconds used
  final bool isNewBest;
  const RoundResult({
    required this.roundId,
    required this.stars,
    required this.timeTaken,
    required this.isNewBest,
  });
}
