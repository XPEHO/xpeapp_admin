import 'package:dio/dio.dart';
import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:xpeapp_admin/data/entities/agenda/birthday_entity.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_entity.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_type_entity.dart';
import 'package:xpeapp_admin/data/exception/agenda_exception.dart';

class AgendaService {
  final BackendApi _backendApi;

  AgendaService(
    this._backendApi,
  );

  Future<List<EventsEntity>> getAllEvents({int page = 1}) async {
    final response = await _backendApi.getAllEvents(page);
    if (response.response.statusCode == 200) {
      final data = response.data as List<dynamic>;
      return data
          .map(
            (e) => EventsEntity.fromJson(
              e,
            ),
          )
          .toList();
    } else {
      throw AgendaException('Erreur lors de la récupération des événements');
    }
  }

  Future<EventsEntity> getEventById(String id) async {
    final response = await _backendApi.getEventById(id);
    if (response.response.statusCode == 200) {
      return EventsEntity.fromJson(response.data);
    } else {
      throw AgendaException('Erreur lors de la récupération de l\'événement');
    }
  }

  Future<void> addEvent(EventsEntity event) async {
    final response = await _backendApi.addEvent(event.toJson());
    if (response.response.statusCode != 200) {
      throw AgendaException('Erreur lors de l\'ajout de l\'événement');
    }
  }

  Future<void> updateEvent(EventsEntity event) async {
    final response =
        await _backendApi.updateEvent(event.id ?? '', event.toJson());
    if (response.response.statusCode != 204) {
      throw AgendaException('Erreur lors de la mise à jour de l\'événement');
    }
  }

  Future<void> deleteEvent(String id) async {
    final response = await _backendApi.deleteEvent(id);
    if (response.response.statusCode != 204) {
      throw AgendaException('Erreur lors de la suppression de l\'événement');
    }
  }

  // Events-Type

  Future<List<EventsTypeEntity>> getAllEventsType() async {
    final response = await _backendApi.getAllEventsTypes();
    if (response.response.statusCode == 200) {
      final data = response.data as List<dynamic>;
      return data
          .map(
            (e) => EventsTypeEntity.fromJson(
              e,
            ),
          )
          .toList();
    } else {
      throw AgendaException(
          'Erreur lors de la récupération des types d\'événements');
    }
  }

  Future<EventsTypeEntity> getEventTypeById(String id) async {
    final response = await _backendApi.getEventTypeById(id);
    if (response.response.statusCode == 200) {
      return EventsTypeEntity.fromJson(response.data);
    } else {
      throw AgendaException(
          'Erreur lors de la récupération du type d\'événement d\'id:$id');
    }
  }

  Future<void> addEventType(EventsTypeEntity eventType) async {
    try {
      final response = await _backendApi.addEventType(eventType.toJson());
      if (response.response.statusCode != 201) {
        throw AgendaException('Erreur lors de l\'ajout du type d\'événement');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        throw AgendaException(
            'Type d\'événement déjà existant avec le même label');
      } else {
        throw AgendaException('Erreur lors de l\'ajout du type d\'événement');
      }
    }
  }

  Future<void> updateEventType(EventsTypeEntity eventType) async {
    try {
      final response =
          await _backendApi.updateEventType(eventType.id, eventType.toJson());
      if (response.response.statusCode != 204) {
        throw AgendaException(
            'Erreur lors de la mise à jour du type d\'événement');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        throw AgendaException(
            'Type d\'événement déjà existant avec le même label');
      } else {
        throw AgendaException(
            'Erreur lors de la mise à jour du type d\'événement');
      }
    }
  }

  Future<void> deleteEventType(String id) async {
    try {
      final response = await _backendApi.deleteEventType(id);
      if (response.response.statusCode != 204) {
        throw AgendaException(
            'Erreur lors de la suppression du type d\'événement');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        throw AgendaException(
            'Type d\'événement associé à un ou plusieurs événements');
      } else {
        throw AgendaException(
            'Erreur lors de la suppression du type d\'événement');
      }
    }
  }

  // Birthday

  Future<List<BirthdayEntity>> getAllBirthdays({int page = 1}) async {
    final response = await _backendApi.getAllBirthdays(page);
    if (response.response.statusCode == 200) {
      final data = response.data as List<dynamic>;
      return data
          .map(
            (e) => BirthdayEntity.fromJson(
              e,
            ),
          )
          .toList();
    } else {
      throw AgendaException('Erreur lors de la récupération des anniversaires');
    }
  }

  Future<BirthdayEntity> getBirthdayById(String id) async {
    final response = await _backendApi.getBirthdayById(id);
    if (response.response.statusCode == 200) {
      return BirthdayEntity.fromJson(response.data);
    } else {
      throw AgendaException(
          'Erreur lors de la récupération de l\'anniversaire');
    }
  }

  Future<void> addBirthday(BirthdayEntity birthday) async {
    try {
      final response = await _backendApi.addBirthday(birthday.toJson());
      if (response.response.statusCode != 201) {
        throw AgendaException('Erreur lors de l\'ajout de l\'anniversaire');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        throw AgendaException('Cet email est déjà associé à un anniversaire');
      } else {
        throw AgendaException('Erreur lors de l\'ajout de l\'anniversaire');
      }
    }
  }

  Future<void> updateBirthday(BirthdayEntity birthday) async {
    try {
      final response =
          await _backendApi.updateBirthday(birthday.id, birthday.toJson());
      if (response.response.statusCode != 204) {
        throw AgendaException(
            'Erreur lors de la mise à jour de l\'anniversaire');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        throw AgendaException('Cet email est déjà associé à un anniversaire');
      } else {
        throw AgendaException(
            'Erreur lors de la mise à jour de l\'anniversaire');
      }
    }
  }

  Future<void> deleteBirthday(String id) async {
    final response = await _backendApi.deleteBirthday(id);
    if (response.response.statusCode != 204) {
      throw AgendaException('Erreur lors de la suppression de l\'anniversaire');
    }
  }
}
