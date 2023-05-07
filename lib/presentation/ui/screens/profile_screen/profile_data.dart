class Profile {
  String name;
  String email;
  String password;
  DateTime dateofbirth;
  Profile({
    required this.name,
    required this.dateofbirth,
    required this.password,
    required this.email,
  });
  static Profile azimProfile = Profile(
    name: 'Azimjon Akhmadjonov',
    dateofbirth: DateTime(2005, 12, 29),
    email: 'akhmadjonovazim@gmail.com',
    password: 'Password',
  );
}
