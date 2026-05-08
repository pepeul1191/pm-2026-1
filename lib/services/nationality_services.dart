// lib/services/nationality_services.dart
import 'dart:convert';

import 'package:biblio/configs/generic_response.dart';
import 'package:biblio/models/nationality.dart';
import 'package:flutter/services.dart';

class NationalityServices {
  List<Nationality> _genreListFromJson(dynamic json) {
    return (json as List)
        .map((genreJson) => Nationality.fromJson(genreJson as Map<String, dynamic>))
        .toList();
  }

  Future<GenericResponse> fetchAll() async {
    try {
      String jsonString = await rootBundle.loadString(
        'assets/jsons/nationalities.json',
      );
      
      final List<dynamic> jsonList = json.decode(jsonString);

      List<Nationality> nationalities = jsonList.map(
        (jsonItem) => Nationality.fromJson(jsonItem)
      ).toList();

      for (Nationality nationality in nationalities) {
        print(nationality);
      }

      return GenericResponse<List<Nationality>>(
        success: true,
        data: nationalities,
        message: 'Ok',
        error: null,
      );
    } catch (e, stackTrace) {
      print('Error: $e');
      print('Stack trace: $stackTrace');
      return GenericResponse(
        success: false,
        data: null,
        message: "Error no esperado en listar los libros",
        error: stackTrace.toString(),
      );
    }
  }
}