class UserProfile {
  final String name;
  final int age;
  final String email;
  String? profileImageUrl;
  
  UserProfile({
    required this.name,
    required this.age,
    required this.email,
    this.profileImageUrl,
  });
  
  UserProfile.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      age = json['age'],
      email = json['email'],
      profileImageUrl = json['profileImageUrl'];
  
  Map<String, dynamic> toJson() => {
    'name': name,
    'age': age,
    'email': email,
    'profileImageUrl': profileImageUrl,
  };
  
  @override
  String toString() => 'UserProfile(name: $name, age: $age, email: $email)';
}