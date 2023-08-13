import 'package:flutter/material.dart';

import '../forms/coordinate_input.dart';
import '../helpers/coords.dart';

class CoordinateInput extends StatefulWidget {
  const CoordinateInput({super.key});

  @override
  State<CoordinateInput> createState() => _CoordinateInputState();
}

class _CoordinateInputState extends State<CoordinateInput> {
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController zoomController = TextEditingController();
  List<int> tileNumber = [];

  void handlePress() {
    try {
      var res = getTileNumber(
        double.parse(latitudeController.text),
        double.parse(longitudeController.text),
        double.parse(zoomController.text),
      );
      setState(() {
        tileNumber = res;
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
        content: Text('Ошибка! Плитка не найдена.'),
        closeIconColor: Colors.white,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Поиск по координатам"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CoordinateInputForm(
                latitudeController: latitudeController,
                longitudeController: longitudeController,
                zoomController: zoomController,
                handlePress: handlePress),
            const SizedBox(
              height: 30,
            ),
            Text(tileNumber.isNotEmpty
                ? 'Номер найденной плитки: $tileNumber'
                : "Введите координаты"),
            // Image.network(
            //   'https://core-carparks-renderer-lots.maps.yandex.net/tiles?version=2&l=carparks&lang=ru&v=20230812-221128&x=1209340&y=676043&z=21',
            // ),
          ],
        ),
      ),
    );
  }
}
