import 'package:flutter/material.dart';
import 'package:drawing_board/widgets/drawing_canvas.dart';
import 'package:drawing_board/models/drawing_model.dart';
import 'package:provider/provider.dart';

class DrawingScreen extends StatefulWidget {
  const DrawingScreen({Key? key}) : super(key: key);

  @override
  State<DrawingScreen> createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drawing Board')),
      body: Column(
        children: [
          Expanded(
            child: DrawingCanvas(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.color_lens),
                  onPressed: () {
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        title: const Text('Pick a color!'),
                        content: SingleChildScrollView(
                          child: ColorPicker(),
                        ),
                      );
                    });
                  },
                ),
                Slider(
                  value: Provider.of<DrawingModel>(context).strokeWidth,
                  min: 1,
                  max: 10,
                  onChanged: (double value) {
                    Provider.of<DrawingModel>(context, listen: false).setStrokeWidth(value);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    Provider.of<DrawingModel>(context, listen: false).clearPoints();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: Colors.primaries.map((color) {
        return GestureDetector(
          onTap: () {
            Provider.of<DrawingModel>(context, listen: false).setColor(color);
            Navigator.of(context).pop();
          },
          child: Container(
            width: 30,
            height: 30,
            color: color,
            margin: const EdgeInsets.all(5),
          ),
        );
      }).toList(),
    );
  }
}