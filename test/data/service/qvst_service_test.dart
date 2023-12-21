import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';
import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_repo_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_question_entity.dart';
import 'package:xpeapp_admin/data/service/qvst_service.dart';

import 'qvst_service_test.mocks.dart';

@GenerateMocks([
  BackendApi,
])
void main() {
  late QvstService service;
  late MockBackendApi mockBackendApi;

  setUpAll(
    () {
      mockBackendApi = MockBackendApi();
      service = QvstService(
        mockBackendApi,
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

    group('getQvstResumeById', () {
      test('Success', () async {
        const id = '1';

        Map<String, dynamic> response = {
          "id": "1",
          "theme": "Le travail",
          "question": "Comment te sens-tu dans l'entreprise ?",
          "numberOfAnswers": "5",
          "averageAnswer": "5",
          "maxValueAnswer": "5"
        };

        when(mockBackendApi.getQvstResumeById(id)).thenAnswer((_) async {
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

        final result = await service.getQvstResumeById(id);

        expect(result.question, response['question']);
        expect(result.theme, response['theme']);
      });

      test('Failed', () async {
        const id = '1';

        when(mockBackendApi.getQvstResumeById(id)).thenAnswer((_) async {
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

        expect(() => service.getQvstResumeById(id), throwsException);
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
          mockBackendApi.addQvstCampaign(
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

        final result = await service.addQvstCampaign(
          question.toJson(),
        );

        expect(result, true);
      });

      test('Failed', () async {
        when(mockBackendApi.addQvstCampaign(question.toJson())).thenAnswer(
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
            () => service.addQvstCampaign(question.toJson()), throwsException);
      });
    });
  });
}
