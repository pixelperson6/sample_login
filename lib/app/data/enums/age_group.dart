enum AgeGroup {
  under9('under 9'),
  nineTo13('9 - 13'),
  forteenTo17('14 - 17'),
  eighteenTo24('18 - 24'),
  twentyfiveTo30('25 - 30'),
  thirtyoneTo40('31 - 40'),
  fortyoneTo50('41 - 50'),
  above50('above 50');

  final String range;

  const AgeGroup(this.range);
}
