import 'dart:io';

class GymLocation{
  final double latitude;
  final double longitude;
  final String? address;

  GymLocation({
    required this.latitude,
    required this.longitude,
    this.address,
  });
}

class Gym{
  final String id;
  final String name;
  final GymLocation? location;
  final File? image;

  Gym({
    required this.id,
    required this.name,
    this.location,
    this.image,
  });
}