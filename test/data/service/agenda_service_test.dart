import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';
import 'package:xpeapp_admin/data/backend_api.dart' show BackendApi;
import 'package:xpeapp_admin/data/entities/agenda/birthday_entity.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_put_entity.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_type_entity.dart';
import 'package:xpeapp_admin/data/service/agenda_service.dart';

import 'agenda_service_test.mocks.dart';

@GenerateMocks([BackendApi])
void main() {
  late AgendaService agendaService;
  late MockBackendApi mockBackendApi;

  setUpAll(() {
    mockBackendApi = MockBackendApi();
    agendaService = AgendaService(mockBackendApi, 'baseUrl');
  });

  group('AgendaService test', () {
    group('Events', () {
      test('getAllEvents returns a list of events', () async {
        final response = [
          {
            'id': '1',
            'title': 'Event 1',
            'date': '2022-01-01',
            'topic': 'Topic 1',
            'location': 'Location 1',
            'start_time': '10:00',
            'end_time': '12:00',
            "type": {"id": "17", "label": "XpeUp"}
          },
          {
            'id': '2',
            'title': 'Event 2',
            'date': '2022-01-02',
            'topic': 'Topic 2',
            'location': 'Location 2',
            'start_time': '10:00',
            'end_time': '12:00',
            "type": {"id": "17", "label": "XpeUp"}
          }
        ];

        when(mockBackendApi.getAllEvents()).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              response,
              Response(
                statusCode: 200,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        final events = await agendaService.getAllEvents();

        expect(events.length, 2);
        expect(events[0].title, 'Event 1');
        expect(events[1].title, 'Event 2');
      });

      test('getEventById returns an event', () async {
        final response = {
          'id': '1',
          'title': 'Event 1',
          'date': '2022-01-01',
          'topic': 'Topic 1',
          'location': 'Location 1',
          'start_time': '10:00',
          'end_time': '12:00',
          "type": {"id": "17", "label": "XpeUp"}
        };

        when(mockBackendApi.getEventById('1')).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              response,
              Response(
                statusCode: 200,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        final event = await agendaService.getEventById('1');

        expect(event.title, 'Event 1');
      });

      test('addEvent throws an exception on error', () async {
        when(mockBackendApi.addEvent(any)).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 400,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        expect(
          () async => await agendaService.addEvent(const EventsPutEntity(
              id: '1',
              title: 'Event 1',
              date: '2022-01-01',
              topic: 'Topic 1',
              location: 'Location 1',
              start_time: '10:00',
              end_time: '12:00',
              type_id: '1')),
          throwsException,
        );
      });

      test('updateEvent throws an exception on error', () async {
        when(mockBackendApi.updateEvent(any, any)).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 400,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        expect(
          () async => await agendaService.updateEvent(const EventsPutEntity(
              id: '1',
              title: 'Event 1',
              date: '2022-01-01',
              topic: 'Topic 1',
              location: 'Location 1',
              start_time: '10:00',
              end_time: '12:00',
              type_id: '1')),
          throwsException,
        );
      });

      test('deleteEvent throws an exception on error', () async {
        when(mockBackendApi.deleteEvent('1')).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 400,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        expect(
          () async => await agendaService.deleteEvent('1'),
          throwsException,
        );
      });
    });

    group('EventsType', () {
      test('getAllEventsType returns a list of event types', () async {
        final response = [
          {'id': '1', 'label': 'Type 1', 'color_code': 'Color 1'},
          {'id': '2', 'label': 'Type 2', 'color_code': 'Color 2'}
        ];

        when(mockBackendApi.getAllEventsTypes()).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              response,
              Response(
                statusCode: 200,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        final eventTypes = await agendaService.getAllEventsType();

        expect(eventTypes.length, 2);
        expect(eventTypes[0].label, 'Type 1');
        expect(eventTypes[1].label, 'Type 2');
      });

      test('getEventTypeById returns an event type', () async {
        final response = {
          'id': '1',
          'label': 'Type 1',
          'color_code': 'Color 1'
        };

        when(mockBackendApi.getEventTypeById('1')).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              response,
              Response(
                statusCode: 200,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        final eventType = await agendaService.getEventTypeById('1');

        expect(eventType.label, 'Type 1');
      });

      test('addEventType throws an exception on error', () async {
        when(mockBackendApi.addEventType(any)).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 400,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        expect(
          () async => await agendaService.addEventType(const EventsTypeEntity(
              id: '1', label: 'Type 1', color_code: 'Color 1')),
          throwsException,
        );
      });

      test('updateEventType throws an exception on error', () async {
        when(mockBackendApi.updateEventType(any, any)).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 400,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        expect(
          () async => await agendaService.updateEventType(
              const EventsTypeEntity(
                  id: '1', label: 'Type 1', color_code: 'Color 1')),
          throwsException,
        );
      });

      test('deleteEventType throws an exception on error', () async {
        when(mockBackendApi.deleteEventType('1')).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 400,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        expect(
          () async => await agendaService.deleteEventType('1'),
          throwsException,
        );
      });
    });

    group('Birthdays', () {
      test('getAllBirthdays returns a list of birthdays', () async {
        final response = [
          {'id': '1', 'name': 'Birthday 1'},
          {'id': '2', 'name': 'Birthday 2'}
        ];

        when(mockBackendApi.getAllBirthdays()).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              response,
              Response(
                statusCode: 200,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        final birthdays = await agendaService.getAllBirthdays();

        expect(birthdays.length, 2);
        expect(birthdays[0].first_name, 'Birthday 1');
        expect(birthdays[1].first_name, 'Birthday 2');
      });

      test('getBirthdayById returns a birthday', () async {
        final response = {'id': '1', 'name': 'Birthday 1'};

        when(mockBackendApi.getBirthdayById('1')).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              response,
              Response(
                statusCode: 200,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        final birthday = await agendaService.getBirthdayById('1');

        expect(birthday.first_name, 'Birthday 1');
      });

      test('addBirthday throws an exception on error', () async {
        when(mockBackendApi.addBirthday(any)).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 400,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        expect(
          () async => await agendaService.addBirthday(const BirthdayEntity(
              id: '1',
              first_name: 'Birthday 1',
              email: 'email',
              birthdate: '2022-01-01')),
          throwsException,
        );
      });

      test('updateBirthday throws an exception on error', () async {
        when(mockBackendApi.updateBirthday(any, any)).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 400,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        expect(
          () async => await agendaService.updateBirthday(const BirthdayEntity(
              id: '1',
              first_name: 'Birthday 1',
              email: 'email',
              birthdate: '2022-01-01')),
          throwsException,
        );
      });

      test('deleteBirthday throws an exception on error', () async {
        when(mockBackendApi.deleteBirthday('1')).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 400,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        expect(
          () async => await agendaService.deleteBirthday('1'),
          throwsException,
        );
      });
    });
  });
}
