class User {
  final String imagePath;
  final String name;
  final String email;
  final String weight;
  final String age;
  final String gender;
  final String fitbitToken;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.weight,
    required this.age,
    required this.gender,
    required this.fitbitToken,
  });
}