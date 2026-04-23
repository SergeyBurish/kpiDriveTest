import 'package:dio/dio.dart';

import '../dto/mo_indicators_dto.dart';

abstract interface class KanbanBoardDataSource {
  Future<MoIndicatorsDto?> getMoIndicators();
}

class KanbanBoardDataSourceImp implements KanbanBoardDataSource {
  static const _baseUrl = 'https://api.dev.kpi-drive.ru/_api/indicators';
  final Dio _dio = Dio();

  @override
  Future<MoIndicatorsDto?> getMoIndicators() async {
    _dio.options.headers['Authorization'] = 'Bearer 5c3964b8e3ee4755f2cc0febb851e2f8';
    final response = await _dio.get('$_baseUrl/get_mo_indicators',
      queryParameters: {
        'behaviour_key': 'task, kpi_task',
        'with_result': false,
        'response_fields': 'name, indicator_to_mo_id, parent_id, parent_name, order',
        'auth_user_id': 40,
      },
    );
    if (response.statusCode != null && response.statusCode! ~/ 100 == 2) {
      return MoIndicatorsDto.fromJson(response.data);
    }
    return null;
  }
}