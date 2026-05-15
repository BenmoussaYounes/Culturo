class QuizCategoryResult {
  final String name;
  final int correct;
  final int total;

  const QuizCategoryResult({required this.name, required this.correct, required this.total});

  double get fraction => total == 0 ? 0 : correct / total;
}
