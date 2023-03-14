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
      backgroundColor: AppPalette.beckground,
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
                margin: EdgeInsetsDirectional.symmetric(horizontal: 6),
                child: _flutterMaps(),
              ),
              Container(
                width: constraints.maxWidth,
                color: AppPalette.white,
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: .5,
                                  color: AppPalette.black38.withOpacity(.1)))),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Text(
                        "14 de março de 2023",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppPalette.black87,
                            fontSize: 12),
                      ),
                    ),
                    Container(
                      width: constraints.maxWidth,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Text(
                        "Ultimo registro de ponto",
                        style:
                            TextStyle(fontSize: 12, color: AppPalette.black38),
                      ),
                    ),
                    Container(
                      width: constraints.maxWidth,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "08:30",
                            style: TextStyle(
                                fontSize: 16,
                                color: AppPalette.black87,
                                fontWeight: FontWeight.w700),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.arrow_forward,
                                size: 12, color: AppPalette.black38),
                          ),
                          Text(
                            "12:00",
                            style: TextStyle(
                                fontSize: 16,
                                color: AppPalette.black87,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8, bottom: 8),
                      width: constraints.maxWidth,
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, top: 12),
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: .5,
                                  color: AppPalette.black38.withOpacity(.1)))),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.access_time,
                              size: 15,
                            ),
                            Icon(
                              Icons.more_time_rounded,
                              size: 15,
                            ),
                            Icon(
                              Icons.timer_sharp,
                              size: 15,
                            ),
                          ]),
                    )
                  ],
                ),
              ),
              Expanded(child: Container()),
              _buttonRegisterPoint(constraints),
            ],
          ),
        ),
      ),
    );
  }

  Container _buttonRegisterPoint(BoxConstraints constraints) {
    return Container(
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
    );
  }

  Card _selectJobLocal() {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
              border: InputBorder.none,
              label: Text(
                "Local de Trabalho",
                style: TextStyle(
                  color: AppPalette.black87,
                ),
              )),
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
