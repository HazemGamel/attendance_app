
import 'package:equatable/equatable.dart';

class onbordingEntites extends Equatable {
  final String image;
  final String description;

  const onbordingEntites({
    required this.image,
    required this.description}
      );

  @override
  // TODO: implement props
  List<Object?> get props => [image,description];

}