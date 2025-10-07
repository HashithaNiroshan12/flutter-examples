import 'package:flutter/material.dart';
import 'package:version_3_22_8/features/demo/presentation/domain/entities/poto.dart';

class PhotoList extends StatelessWidget {
  const PhotoList({Key? key, required this.photos}) : super(key: key);

  final List<Photo>? photos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: photos?.length,
        itemBuilder: (context, index) {
          return Image.network(photos![index].thumbnailUrl);
        });
  }
}
