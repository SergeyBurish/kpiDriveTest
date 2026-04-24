import 'package:dio/dio.dart';

import '../dto/mo_indicators_dto.dart';

abstract interface class KanbanBoardDataSource {
  Future<MoIndicatorsDto?> getMoIndicators();
  Future<void> onParentChange({
    required int cardId,
    required int parentId,
  });
  Future<void> onOrderChange({
    required int cardId,
    required int order,
  });
}

class KanbanBoardDataSourceImp implements KanbanBoardDataSource {
  static const _baseUrl = 'https://api.dev.kpi-drive.ru/_api/indicators';
  static const _bearer = '5c3964b8e3ee4755f2cc0febb851e2f8';
  static const int _authUserId = 40;
  final Dio _dio = Dio();

  @override
  Future<MoIndicatorsDto?> getMoIndicators() async {
    _dio.options.headers['Authorization'] = 'Bearer $_bearer';
    final response = await _dio.get('$_baseUrl/get_mo_indicators',
      queryParameters: {
        'behaviour_key': 'task, kpi_task',
        'with_result': false,
        'response_fields': 'name, indicator_to_mo_id, parent_id, parent_name, order',
        'auth_user_id': _authUserId,
      },
    );
    if (response.statusCode != null && response.statusCode! ~/ 100 == 2) {
      return MoIndicatorsDto.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<void> onParentChange({
    required int cardId,
    required int parentId,
  }) async => _saveIndicatorInstanceField(params: {
      'indicator_to_mo_id': cardId,
      'field_name': 'parent_id',
      'field_value': parentId,
    });

  @override
  Future<void> onOrderChange({
    required int cardId,
    required int order,
  }) async => _saveIndicatorInstanceField(params: {
      'indicator_to_mo_id': cardId,
      'field_name': 'order',
      'field_value': order,
    });

  Future<void> _saveIndicatorInstanceField({required Map<String, dynamic> params}) async {
    _dio.options.headers['Authorization'] = 'Bearer $_bearer';
    await _dio.get('$_baseUrl/save_indicator_instance_field',
      queryParameters: {
        'period_start': '2026-04-01',
        'period_end': '2026-04-30',
        'period_key': 'month',
        'auth_user_id': _authUserId,
        ... params,
      },
    );
  }
}