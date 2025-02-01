import 'package:flutter/material.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                _buildPhotoColumn(context, ['concert_photo_1', 'concert_photo_2', 'concert_photo_3']),
                Container(width: 1, color: Colors.grey[300]),
                _buildPhotoColumn(context, ['concert_photo_4', 'concert_photo_5', 'concert_photo_6']),
              ],
            ),
          ),
          ElevatedButton(
            child: const Text('Back'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoColumn(BuildContext context, List<String> photos) {
    return Expanded(
      child: Column(
        children: [
          _buildPhoto(context, photos[0], Alignment.centerLeft),
          _buildPhoto(context, photos[1], Alignment.centerRight),
          _buildPhoto(context, photos[2], Alignment.centerLeft),
        ],
      ),
    );
  }

  Widget _buildPhoto(BuildContext context, String photo, Alignment alignment) {
    return Expanded(
      child: Align(
        alignment: alignment,
        child: Image.asset('assets/images/$photo.jpg', fit: BoxFit.cover),
      ),
    );
  }
}
