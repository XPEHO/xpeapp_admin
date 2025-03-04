import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:xpeapp_admin/data/entities/agenda/birthday_entity.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_entity.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_put_entity.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_type_entity.dart';

class AgendaService {
  final BackendApi _backendApi;
  final String baseUrl;

  AgendaService(
    this._backendApi,
    this.baseUrl,
  );

  Future<List<EventsEntity>> getAllEvents() async {
    final response = await _backendApi.getAllEvents();
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
      throw Exception('Erreur lors de la récupération des événements');
    }
  }

  Future<EventsEntity> getEventById(String id) async {
    final response = await _backendApi.getEventById(id);
    if (response.response.statusCode == 200) {
      return EventsEntity.fromJson(response.data);
    } else {
      throw Exception('Erreur lors de la récupération de l\'événement');
    }
  }

  Future<void> addEvent(EventsPutEntity event) async {
    final response = await _backendApi.addEvent(event.toJson());
    if (response.response.statusCode != 200) {
      throw Exception('Erreur lors de l\'ajout de l\'événement');
    }
  }

  Future<void> updateEvent(EventsPutEntity event) async {
    final response =
        await _backendApi.updateEvent(event.id ?? '', event.toJson());
    if (response.response.statusCode != 204) {
      throw Exception('Erreur lors de la mise à jour de l\'événement');
    }
  }

  Future<void> deleteEvent(String id) async {
    final response = await _backendApi.deleteEvent(id);
    if (response.response.statusCode != 204) {
      throw Exception('Erreur lors de la suppression de l\'événement');
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
      throw Exception('Erreur lors de la récupération des événements');
    }
  }

  Future<EventsTypeEntity> getEventTypeById(String id) async {
    final response = await _backendApi.getEventTypeById(id);
    if (response.response.statusCode == 200) {
      return EventsTypeEntity.fromJson(response.data);
    } else {
      throw Exception('Erreur lors de la récupération de l\'événement');
    }
  }

  Future<void> addEventType(EventsTypeEntity eventType) async {
    final response = await _backendApi.addEventType(eventType.toJson());
    if (response.response.statusCode != 200) {
      throw Exception('Erreur lors de l\'ajout de l\'événement');
    }
  }

  Future<void> updateEventType(EventsTypeEntity eventType) async {
    final response =
        await _backendApi.updateEventType(eventType.id, eventType.toJson());
    if (response.response.statusCode != 204) {
      throw Exception('Erreur lors de la mise à jour de l\'événement');
    }
  }

  Future<void> deleteEventType(String id) async {
    final response = await _backendApi.deleteEventType(id);
    if (response.response.statusCode != 204) {
      throw Exception('Erreur lors de la suppression de l\'événement');
    }
  }

  // Birthday

  Future<List<BirthdayEntity>> getAllBirthdays() async {
    final response = await _backendApi.getAllBirthdays();
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
      throw Exception('Erreur lors de la récupération des événements');
    }
  }

  Future<BirthdayEntity> getBirthdayById(String id) async {
    final response = await _backendApi.getBirthdayById(id);
    if (response.response.statusCode == 200) {
      return BirthdayEntity.fromJson(response.data);
    } else {
      throw Exception('Erreur lors de la récupération de l\'événement');
    }
  }

  Future<void> addBirthday(BirthdayEntity birthday) async {
    final response = await _backendApi.addBirthday(birthday.toJson());
    if (response.response.statusCode != 200) {
      throw Exception('Erreur lors de l\'ajout de l\'événement');
    }
  }

  Future<void> updateBirthday(BirthdayEntity birthday) async {
    final response =
        await _backendApi.updateBirthday(birthday.id, birthday.toJson());
    if (response.response.statusCode != 204) {
      throw Exception('Erreur lors de la mise à jour de l\'événement');
    }
  }

  Future<void> deleteBirthday(String id) async {
    final response = await _backendApi.deleteBirthday(id);
    if (response.response.statusCode != 204) {
      throw Exception('Erreur lors de la suppression de l\'événement');
    }
  }
}
