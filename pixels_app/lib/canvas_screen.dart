import 'package:flutter/material.dart';

class CanvasScreen extends StatefulWidget {
  @override
  _CanvasScreenState createState() => _CanvasScreenState();
}

class _CanvasScreenState extends State<CanvasScreen> {
  List<Color> colorPalette = [
    Colors.white,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.brown,
    Colors.black,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.teal,
    Colors.grey,
  ];

  int selectedColorIndex = 0; // Index of the selected color in the palette
  List<Color> pixelColors = List.generate(100, (index) => Colors.white); // Colors of each pixel in the grid

  void selectColor(int index) {
    setState(() {
      selectedColorIndex = index;
    });
  }

  void changePixelColor(int index) {
    setState(() {
      pixelColors[index] = colorPalette[selectedColorIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Canvas Painter'),
      ),
      body: Column(
        children: <Widget>[
          // Canvas Area
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 10, 
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
              ),
              itemCount: 100, // 10x10 grid
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    changePixelColor(index);
                  },
                  child: Container(
                    color: pixelColors[index], // Pixel color
                  ),
                );
              },
            ),
          ),
          // Color Palette
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black, 
              border: Border(top: BorderSide(color: Colors.black)),
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // 4 columns
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: colorPalette.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    selectColor(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorPalette[index],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: selectedColorIndex == index
                            ? Colors.white // Change border color to white for better visibility on black background
                            : Colors.transparent,
                        width: 3,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}