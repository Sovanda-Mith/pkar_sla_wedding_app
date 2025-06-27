import 'package:flutter/material.dart';
import 'package:pkar_sla_wedding_app/widgets/title_header.dart';

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/hall.png',
      'assets/decor.png',
      'assets/makeup.png',
      'assets/music.png',
      'assets/photographer.png',
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const TitleHeader(title: 'រូបភាព'),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 15,
            mainAxisSpacing: 10,
            children:
                imagePaths.map((imagePath) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder:
                            (context) => Dialog(
                              backgroundColor: Colors.transparent,
                              child: GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  child: InteractiveViewer(
                                    child: Image.asset(
                                      imagePath,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      );
                    },
                    child: Image.asset(imagePath),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
