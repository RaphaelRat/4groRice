// Modelo do cálculo de estimativa do uso de água

import 'dart:ffi';

class Estimate {
  late Int32 acre;
  late Int32 plantingTime;
  late String region;
  late Int32 duration;
  late bool soilPreparation;
  late Int32 waterConsumption;

  Estimate(
    this.acre,
    this.plantingTime,
    this.region,
    this.duration,
    this.soilPreparation,
    this.waterConsumption,
  );

  Estimate.fromJson(Map<String, dynamic> json)
      : acre = json['acre'].toString() == 'null' ? '' : json['acre'],
        plantingTime = json['planting_time'].toString() == 'null'
            ? ''
            : json['planting_time'],
        region = json['region'].toString() == 'null' ? '' : json['region'],
        duration =
            json['duration'].toString() == 'null' ? '' : json['duration'],
        soilPreparation = json['soil_preparation'].toString() == 'null'
            ? ''
            : json['soil_preparation'],
        waterConsumption = json['water_consumption'].toString() == 'null'
            ? ''
            : json['water_consumption'];

  Map<String, dynamic> toJson() => {
        'acre': acre,
        'planting_time': plantingTime,
        'region': region,
        'duration': duration,
        'soil_preparation': soilPreparation,
        'water_consumption': waterConsumption,
      };

  @override
  String toString() {
    return 'Estimate{acre: $acre, plantingTime: $plantingTime, region: $region, duration: $duration, soilPreparation: $soilPreparation, waterConsumption: $waterConsumption}';
  }
}
