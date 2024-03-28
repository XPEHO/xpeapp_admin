import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';
import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_repo_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_question_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/theme/qvst_theme_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/stats/qvst_stats_entity.dart';
import 'package:xpeapp_admin/data/service/qvst_service.dart';

import 'qvst_service_test.mocks.dart';

@GenerateMocks([
  BackendApi,
])
void main() {
  late QvstService service;
  late MockBackendApi mockBackendApi;

  final firestore = FakeFirebaseFirestore();

  setUpAll(
    () {
      firestore.collection('featureFlipping').doc('campaign').set({
        'uatEnabled': false,
      });
      mockBackendApi = MockBackendApi();
      service = QvstService(
        mockBackendApi,
        firestore,
      );
    },
  );

  group('Qvst service test', () {
    group('getAllQvst()', () {
      test('Success', () async {
        when(mockBackendApi.getAllQvst()).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              [
                {
                  "question_id": "4",
                  "question": "Comment te sens-tu dans l'entreprise ?",
                  "theme": "L’environnement de travail",
                  "theme_id": "4",
                  "answers": [
                    {"id": "1", "answer": "Pas du tout", "value": "1"},
                    {"id": "2", "answer": "Plutôt non", "value": "2"},
                    {"id": "3", "answer": "Cela dépend", "value": "3"},
                    {"id": "4", "answer": "Plutôt oui", "value": "4"},
                    {"id": "5", "answer": "Tout à fait", "value": "5"}
                  ]
                },
              ],
              Response(
                statusCode: 200,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        final result = await service.getAllQvst();

        expect(result.isEmpty, false);
        expect(result.length, 1);
      });

      test('Failed', () async {
        when(mockBackendApi.getAllQvst()).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              [],
              Response(
                statusCode: 500,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        expect(() => service.getAllQvst(), throwsException);
      });
    });

    group('getQvstById', () {
      test('Success', () async {
        const id = '1';

        Map<String, dynamic> response = {
          "id": "1",
          "theme": "Le travail",
          "id_theme": "1",
          "question": "Etes vous heureux ?",
          "answers": [
            {"id": "1", "answer": "Oui", "value": "1"},
            {"id": "2", "answer": "Non", "value": "2"},
          ]
        };

        when(mockBackendApi.getQvstById(id)).thenAnswer((_) async {
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

        final result = await service.getQvstById(id);

        expect(result.answers.length, 2);
      });

      test('Failed', () async {
        const id = '1';

        when(mockBackendApi.getQvstById(id)).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 404,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        expect(() => service.getQvstById(id), throwsException);
      });
    });

    group('getAllQvstThemes', () {
      test('Success', () async {
        Map<String, dynamic> response = {
          "id": "1",
          "name": "Le travail",
        };

        when(mockBackendApi.getAllQvstThemes()).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              [response],
              Response(
                statusCode: 200,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        final result = await service.getAllQvstThemes();

        expect(result.length, 1);
      });

      test('Failed', () async {
        when(mockBackendApi.getAllQvstThemes()).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 404,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        expect(() => service.getAllQvstThemes(), throwsException);
      });
    });

    group('addQvst', () {
      Map<String, dynamic> map = {
        "id": "1",
        "theme": "Le travail",
        "id_theme": "1",
        "question": "Etes vous heureux ?",
        "answers": [
          {"id": "1", "answer": "Oui", "value": "1"},
          {"id": "2", "answer": "Non", "value": "2"},
        ]
      };
      final question = QvstQuestionEntity.fromJson(map);
      test('Success', () async {
        when(
          mockBackendApi.addQvst(
            question.toJson(),
          ),
        ).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 201,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        final result = await service.addQvst(
          question,
        );

        expect(result, true);
      });

      test('Failed', () async {
        when(mockBackendApi.addQvst(question.toJson())).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 500,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        expect(() => service.addQvst(question), throwsException);
      });
    });

    group('deleteQvst', () {
      const id = '1';
      test('Success', () async {
        when(mockBackendApi.deleteQvst(id)).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 204,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        final result = await service.deleteQvst(
          id,
        );

        expect(result, true);
      });

      test('Failed', () async {
        when(mockBackendApi.deleteQvst(id)).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 500,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        expect(() => service.deleteQvst(id), throwsException);
      });
    });

    group('getAllQvstQuestionsByThemeId', () {
      const id = '1';
      test('Success', () async {
        Map<String, dynamic> response = {
          "id": "1",
          "theme": "Le travail",
          "id_theme": "1",
          "question": "Etes vous heureux ?",
          "answers": [
            {"id": "1", "answer": "Oui", "value": "1"},
            {"id": "2", "answer": "Non", "value": "2"},
          ]
        };

        when(mockBackendApi.getAllQvstQuestionsByThemeId(id)).thenAnswer(
          (_) async {
            return Future.value(
              HttpResponse(
                [response],
                Response(
                  statusCode: 200,
                  requestOptions: RequestOptions(path: ''),
                ),
              ),
            );
          },
        );

        final result = await service.getAllQvstQuestionsByThemeId(
          id,
        );

        expect(result.length, 1);
      });

      test('Failed', () async {
        when(mockBackendApi.getAllQvstQuestionsByThemeId(id)).thenAnswer(
          (_) async {
            return Future.value(
              HttpResponse(
                {},
                Response(
                  statusCode: 500,
                  requestOptions: RequestOptions(path: ''),
                ),
              ),
            );
          },
        );

        expect(() => service.getAllQvstQuestionsByThemeId(id), throwsException);
      });
    });

    group('getQvstAnswersRepo', () {
      test('Success', () async {
        Map<String, dynamic> response = {
          "id": "1",
          "repoName": "Le travail",
          "answers": [
            {"id": "1", "answer": "Oui", "value": "1"},
            {"id": "2", "answer": "Non", "value": "2"},
          ]
        };

        when(mockBackendApi.getQvstAnswersRepo()).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              [response],
              Response(
                statusCode: 200,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        final result = await service.getQvstAnswersRepo();

        expect(result.length, 1);
      });

      test('Failed', () async {
        when(mockBackendApi.getQvstAnswersRepo()).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 500,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        expect(() => service.getQvstAnswersRepo(), throwsException);
      });
    });

    group('updateQvstAnswersRepo', () {
      Map<String, dynamic> map = {
        "id": "1",
        "repoName": "repoName",
        "answers": [
          {"id": "1", "answer": "answer", "value": "value"},
        ]
      };
      final repo = QvstAnswerRepoEntity.fromJson(map);
      test('Success', () async {
        when(
          mockBackendApi.updateQvstAnswersRepo(
            repo.id,
            repo.toJson(),
          ),
        ).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 201,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        final result = await service.updateQvstAnswersRepo(
          repo,
        );

        expect(result, true);
      });

      test('Failed', () async {
        when(
          mockBackendApi.updateQvstAnswersRepo(
            repo.id,
            repo.toJson(),
          ),
        ).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 500,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        expect(() => service.updateQvstAnswersRepo(repo), throwsException);
      });
    });

    group('getAllQvstCampaigns', () {
      test('Success', () async {
        Map<String, dynamic> response = {
          "id": "1",
          "name": "Première campagne",
          "theme": {"id": "1", "name": "Le contenu du travail"},
          "status": "DRAFT",
          "start_date": "2023-12-24",
          "end_date": "2024-01-01",
          "participation_rate": "33.3333"
        };

        when(mockBackendApi.getAllQvstCampaigns()).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              [response],
              Response(
                statusCode: 200,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        final result = await service.getAllQvstCampaigns();

        expect(result.length, 1);
      });

      test('Failed', () async {
        when(mockBackendApi.getAllQvstCampaigns()).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 500,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        expect(() => service.getAllQvstCampaigns(), throwsException);
      });
    });

    group('addQvstCampaign', () {
      test('Success', () async {
        when(
          mockBackendApi.addQvstCampaign({
            'name': 'campaignName',
            'theme_id': '1',
            'start_date': '2023-12-24',
            'end_date': '2024-01-01',
            'questions': [],
          }),
        ).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 201,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        final result = await service.addQvstCampaign(
          campaignName: 'campaignName',
          themeSelected: QvstThemeEntity(id: '1', name: 'Le travail'),
          startDate: DateTime.parse('2023-12-24'),
          endDate: DateTime.parse('2024-01-01'),
          questions: [],
        );

        expect(result, true);
      });

      test('Failed', () async {
        when(mockBackendApi.addQvstCampaign(
          {
            'name': '',
            'theme_id': '99',
            'start_date': '2023-12-24',
            'end_date': '2024-01-01',
            'questions': [],
          },
        )).thenAnswer(
          (_) async {
            return Future.value(
              HttpResponse(
                {},
                Response(
                  statusCode: 500,
                  requestOptions: RequestOptions(path: ''),
                ),
              ),
            );
          },
        );

        expect(
          () => service.addQvstCampaign(
            campaignName: '',
            themeSelected: QvstThemeEntity(id: '99', name: ''),
            startDate: DateTime.parse('2023-12-24'),
            endDate: DateTime.parse('2024-01-01'),
            questions: [],
          ),
          throwsException,
        );
      });
    });

    group('updateQvst', () {
      test('Success', () async {
        const id = '1';
        Map<String, dynamic> map = {
          "id": "1",
          "theme": "Le travail",
          "id_theme": "1",
          "question": "Etes vous heureux ?",
          "answers": [
            {"id": "1", "answer": "Oui", "value": "1"},
            {"id": "2", "answer": "Non", "value": "2"},
          ]
        };
        final question = QvstQuestionEntity.fromJson(map);

        when(
          mockBackendApi.updateQvst(
            id,
            question.toJson(),
          ),
        ).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 201,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        final result = await service.updateQvst(
          id,
          question.toJson(),
        );

        expect(result, true);
      });

      test('Failed', () {
        const id = '1';
        Map<String, dynamic> map = {
          "id": "1",
          "theme": "Le travail",
          "id_theme": "1",
          "question": "Etes vous heureux ?",
          "answers": [
            {"id": "1", "answer": "Oui", "value": "1"},
            {"id": "2", "answer": "Non", "value": "2"},
          ]
        };
        final question = QvstQuestionEntity.fromJson(map);

        when(mockBackendApi.updateQvst(id, question.toJson())).thenAnswer(
          (_) async {
            return Future.value(
              HttpResponse(
                {},
                Response(
                  statusCode: 500,
                  requestOptions: RequestOptions(path: ''),
                ),
              ),
            );
          },
        );

        expect(
          () => service.updateQvst(id, question.toJson()),
          throwsException,
        );
      });
    });

    group('importCsv', () {
      test('Success', () async {
        PlatformFile fileTest = PlatformFile(
          name: 'test.csv',
          size: 100,
          bytes: utf8.encode(
              'Id theme;Id question;Question;Réponse\n1;1;Question 1;Réponse 1\n1;2;Question 2;Réponse 2\n'),
        );

        when(mockBackendApi.importQvstFile(any)).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 201,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        final result = await service.importCsv(
          fileTest.bytes!,
        );

        expect(result, true);
      });

      test('Failed', () {
        PlatformFile fileTest = PlatformFile(
          name: 'test.csv',
          size: 100,
          bytes: utf8.encode(
              'Id theme;Id question;Question;Réponse\n1;1;Question 1;Réponse 1\n1;2;Question 2;Réponse 2\n'),
        );

        when(mockBackendApi.importQvstFile(any)).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 500,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        expect(() => service.importCsv(fileTest.bytes!), throwsException);
      });
    });

    group('getQvstCampaignStatsById', () {
      test('Success', () async {
        const id = '1';
        Map<String, dynamic> response = {
          "campaignId": "1",
          "campaignName": "Première campagne",
          "theme": {"id": "1", "name": "Le contenu du travail"},
          "campaignStatus": "DRAFT",
          "startDate": "2023-12-24",
          "endDate": "2024-01-01",
          "questions": []
        };

        when(mockBackendApi.getQvstCampaignStatsById(id)).thenAnswer((_) async {
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

        final result = await service.getQvstCampaignStatsById(id);

        expect(result, isA<QvstStatsEntity>());
      });

      test('Failed', () {
        const id = '1';

        when(mockBackendApi.getQvstCampaignStatsById(id)).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 500,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        expect(() => service.getQvstCampaignStatsById(id), throwsException);
      });
    });

    group('updateStatusOfCampaign', () {
      final bodyDraft = {
        'status': 'DRAFT',
      };
      final bodyOpen = {
        'status': 'OPEN',
      };
      final bodyClosed = {
        'status': 'CLOSED',
      };

      test('Success with draft status', () async {
        const id = '1';
        const status = 'DRAFT';

        when(mockBackendApi.updateQvstCampaignStatus(
          id,
          bodyDraft,
        )).thenAnswer(
          (_) async {
            return Future.value(
              HttpResponse(
                {},
                Response(
                  statusCode: 201,
                  requestOptions: RequestOptions(path: ''),
                ),
              ),
            );
          },
        );

        final result = await service.updateStatusOfCampaign(
          id,
          status,
        );

        expect(result, true);
      });

      test('Success with open status', () async {
        const id = '1';
        const status = 'OPEN';

        when(mockBackendApi.updateQvstCampaignStatus(
          id,
          bodyOpen,
        )).thenAnswer(
          (_) async {
            return Future.value(
              HttpResponse(
                {},
                Response(
                  statusCode: 201,
                  requestOptions: RequestOptions(path: ''),
                ),
              ),
            );
          },
        );

        final result = await service.updateStatusOfCampaign(
          id,
          status,
        );

        expect(result, true);
      });

      test('Success with closed status', () async {
        const id = '1';
        const status = 'CLOSED';

        when(mockBackendApi.updateQvstCampaignStatus(
          id,
          bodyClosed,
        )).thenAnswer(
          (_) async {
            return Future.value(
              HttpResponse(
                {},
                Response(
                  statusCode: 201,
                  requestOptions: RequestOptions(path: ''),
                ),
              ),
            );
          },
        );

        final result = await service.updateStatusOfCampaign(
          id,
          status,
        );

        expect(result, true);
      });

      test('Failed', () async {
        const id = '1';
        const status = 'OPEN';

        when(mockBackendApi.updateQvstCampaignStatus(
          id,
          bodyOpen,
        )).thenAnswer(
          (_) async {
            return Future.value(
              HttpResponse(
                {},
                Response(
                  statusCode: 500,
                  requestOptions: RequestOptions(path: ''),
                ),
              ),
            );
          },
        );

        expect(
          () => service.updateStatusOfCampaign(
            id,
            status,
          ),
          throwsException,
        );
      });
    });
  });
}
