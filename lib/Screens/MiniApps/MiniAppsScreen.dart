import 'package:flutter/material.dart';

class MiniAppsScreen extends StatefulWidget {
  const MiniAppsScreen({Key? key}) : super(key: key);

  @override
  _MiniAppsScreenState createState() => _MiniAppsScreenState();
}

class _MiniAppsScreenState extends State<MiniAppsScreen> {
  List<Widget> gridItems = [];

  @override
  void initState() {
    gridItems.add(buildGridItem(gridItems.length, miniAppIcon('fitness.jpg'), 'Fitness'));
    gridItems.add(buildGridItem(gridItems.length, miniAppIcon('recette.jpeg'), '  recette du jour'));
    gridItems.add(buildGridItem(gridItems.length, miniAppIcon('calorie.png'), 'Calories'));
    gridItems.add(buildGridItem(gridItems.length, miniAppIcon('horoscope.png'), 'Horoscope'));
    gridItems.add(buildGridItem(gridItems.length, miniAppIcon('avisiter.jpg'), 'À visiter'));
    gridItems.add(buildGridItem(gridItems.length, miniAppIcon('Note.png'), 'Notes'));
    gridItems.add(buildGridItem(gridItems.length, miniAppIcon('Rappel.png'), 'Rappel'));
    gridItems.add(buildGridItem(gridItems.length, miniAppIcon('mediation.png'), 'Méditation'));
    gridItems.add(buildGridItem(gridItems.length, miniAppIcon('livre.jpeg'), 'Livre'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 40,),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: gridItems.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return buildGridItem(0, addButton(), '');
                } else {
                  return gridItems[index - 1];
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGridItem(int index, Widget item, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          item,
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
  Widget miniAppIcon(String icon){
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            'assets/$icon',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(
              child: Icon(
                Icons.lock,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget addButton(){
    return Material(
      elevation: 4.0,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: const Icon(
          Icons.add_rounded,
          color: Color(0xFF273085),
          size: 40,
        ),
      ),
    );
  }

}
