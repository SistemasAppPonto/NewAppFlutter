import 'package:app_ponto/app/shared/utils/AppPalette.dart';
import 'package:flutter/material.dart';
import 'package:app_ponto/app/modules/home/components/person_details.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:latlong2/latlong.dart';

class PointRegisterPage extends StatefulWidget {
  const PointRegisterPage({super.key});

  @override
  State<PointRegisterPage> createState() => _PointRegisterPageState();
}

class _PointRegisterPageState extends State<PointRegisterPage> {
  MapController mapController = MapController();
  final double _zoom = 16;
  String selectedValue = "UBS";
  final List<String> selectedValueList = ["UBS", "SAMU"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registrar Ponto"), centerTitle: true),
      body: LayoutBuilder(
        builder: (_, constraints) => Container(
          padding:
              EdgeInsets.symmetric(horizontal: constraints.maxHeight * .03),
          child: Column(
            children: [
              const PersonDetails(),
              _selectJobLocal(),
              Container(
                height: constraints.maxHeight * .333,
                child: _flutterMaps(),
              ),
              Expanded(child: Container()),
              Container(
                height: 50,
                width: constraints.maxWidth,
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: AppPalette.primaria),
                  onPressed: () {
                              Modular.to.pushNamed('/home/camera');

                  },
                  child: const Text("Registrar Ponto"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card _selectJobLocal() {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
              border: InputBorder.none, label: Text("Local de Trabalho")),
          value: selectedValue,
          isExpanded: true,
          items: selectedValueList
              .map(
                (String e) => DropdownMenuItem<String>(
                  child: Text(e),
                  value: e,
                ),
              )
              .toList(),
          onChanged: (String? value) {
            setState(() {
              selectedValue = value!;
            });
          },
        ),
      ),
    );
  }

  Widget _flutterMaps() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 0,
      child: FlutterMap(
        options: MapOptions(
            absorbPanEventsOnScrollables: true, // important to allow panning
            center: LatLng(-8.053705, -34.887194),
            zoom: _zoom),
        mapController: mapController,
        nonRotatedChildren: [],
        children: [
          TileLayer(
            urlTemplate:
                "https://api.mapbox.com/styles/v1/mapbox/streets-v12/tiles/"
                "{z}/{x}/{y}?access_token=pk.eyJ1IjoiemVhcnRodXI5OSIsImEiOiJja21veHNlajcyOTRrMnVtaTF3d3ltNG50In0.JXVVG9-leYq2jbcemWYmbg",
            subdomains: ['a', 'b', 'c'],
          ),
        ],
      ),
    );
  }
}
