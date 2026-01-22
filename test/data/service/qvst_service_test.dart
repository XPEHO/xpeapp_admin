import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';
import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:xpeapp_admin/data/backend_api_base.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_repo_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_question_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/theme/qvst_theme_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/stats/qvst_stats_entity.dart';
import 'package:http/http.dart' as http;
import 'package:xpeapp_admin/data/service/file_service.dart';
import 'package:xpeapp_admin/data/service/qvst_service.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';

import 'qvst_service_test.mocks.dart';

@GenerateMocks([
  BackendApi,
  BackendApiBase,
  FileService,
])
void main() {
  late QvstService service;
  late MockBackendApi mockBackendApi;
  late MockBackendApiBase mockBackendApiBase;
  late MockFileService mockFileService;

  final firestore = FakeFirebaseFirestore();

  setUpAll(
    () {
      firestore.collection('featureFlipping').doc('campaign').set({
        'uatEnabled': false,
      });
      mockBackendApi = MockBackendApi();
      mockBackendApiBase = MockBackendApiBase();
      mockFileService = MockFileService();
      service = QvstService(
        mockBackendApiBase,
        mockBackendApi,
        mockFileService,
        "http://localhost/",
      );
    },
  );

  group('Qvst service test', () {
    group('addQvstAnswersRepo', () {
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
          mockBackendApi.addQvstAnswersRepo(
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

        final result = await service.addQvstAnswersRepo(
          repo,
        );

        expect(result, true);
      });

      test('Failed', () async {
        when(
          mockBackendApi.addQvstAnswersRepo(
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

        expect(() => service.addQvstAnswersRepo(repo), throwsException);
      });
    });
    group('getAllQvst()', () {
      test('Success', () async {
        when(mockBackendApi.getAllQvst(true)).thenAnswer((_) async {
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
        when(mockBackendApi.getAllQvst(true)).thenAnswer((_) async {
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

        when(mockBackendApi.getAllQvstQuestionsByThemeId(id, true)).thenAnswer(
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
          includeNoLongerUsed: true,
        );

        expect(result.length, 1);
      });

      test('Failed', () async {
        // Ajout du stub pour l'appel avec (id, false)
        when(mockBackendApi.getAllQvstQuestionsByThemeId(id, false)).thenAnswer(
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
          "themes": [
            {"id": "1", "name": "Le contenu du travail"}
          ],
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
            'themes': ['1'],
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
          themesSelected: [QvstThemeEntity(id: '1', name: 'Le travail')],
          startDate: DateTime.parse('2023-12-24'),
          endDate: DateTime.parse('2024-01-01'),
          questions: [],
        );

        expect(result, true);
      });

      test('Success with multiple themes', () async {
        when(
          mockBackendApi.addQvstCampaign({
            'name': 'Campagne Multi-thèmes',
            'themes': ['1', '2', '3'],
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
          campaignName: 'Campagne Multi-thèmes',
          themesSelected: [
            QvstThemeEntity(id: '1', name: 'Le contenu du travail'),
            QvstThemeEntity(id: '2', name: 'L\'environnement de travail'),
            QvstThemeEntity(id: '3', name: 'La reconnaissance'),
          ],
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
            'themes': ['99'],
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
            themesSelected: [QvstThemeEntity(id: '99', name: '')],
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
              'question_id,question_text,theme_id,theme_name,repo_id,repo_name,reversed_question,no_longer_used,number_asked\n'
              '1,Question 1,1,Theme,1,Repo,0,0,1\n'
              '2,Question 2,1,Theme,1,Repo,0,0,1\n'),
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

        var throwsException = false;
        try {
          await service.importCsv(
            fileTest.bytes!,
          );
        } catch (e) {
          throwsException = true;
        }

        expect(throwsException, false);
      });

      test('Failed', () {
        PlatformFile fileTest = PlatformFile(
          name: 'test.csv',
          size: 100,
          bytes: utf8.encode(
              'Id theme,Id question,Question,Réponse\n1,1,Question 1,Réponse 1\n1,2,Question 2,Réponse 2\n'),
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

    group('exportCSVFile', () {
      late MockBackendApi mockBackendApi;
      late QvstService qvstService;
      const String baseUrl = 'http://localhost:7830/';

      setUp(() {
        mockBackendApi = MockBackendApi();
        mockBackendApiBase = MockBackendApiBase();
        mockFileService = MockFileService();
        qvstService = QvstService(
          mockBackendApiBase,
          mockBackendApi,
          mockFileService,
          baseUrl,
        );
      });

      test('should download CSV file when response is 200', () async {
        // GIVEN
        const campaignId = '123';
        const token = 'test_token';
        const csvData = 'id,name\n1,Test';

        when(mockBackendApiBase.fetchQvstStatsCsv(campaignId, token))
            .thenAnswer((_) async {
          return http.Response(csvData, 200);
        });

        // WHEN
        await qvstService.exportCSVFile(campaignId, token);

        // THEN
      });

      test('should throw an exception when response is 500', () async {
        const campaignId = '123';
        const token = 'test_token';

        when(mockBackendApiBase.fetchQvstStatsCsv(campaignId, token))
            .thenAnswer((_) async {
          return http.Response('', 500);
        });

        expect(
          () async => await qvstService.exportCSVFile(campaignId, token),
          throwsException,
        );
      });

      test('should throw an exception when response is not 200 or 500',
          () async {
        const campaignId = '123';
        const token = 'test_token';

        when(mockBackendApiBase.fetchQvstStatsCsv(campaignId, token))
            .thenAnswer((_) async {
          return http.Response('', 418);
        });

        expect(
          () async => await qvstService.exportCSVFile(campaignId, token),
          throwsException,
        );
      });
    });

    group('getQvstCampaignStatsById', () {
      test('Success', () async {
        const id = '1';
        Map<String, dynamic> response = {
          "campaignId": "1",
          "campaignName": "Première campagne",
          "themes": [
            {"id": "1", "name": "Le contenu du travail"}
          ],
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
        'action': null,
      };
      final bodyOpen = {
        'status': 'OPEN',
        'action': null,
      };
      final bodyClosed = {
        'status': 'CLOSED',
        'action': 'test action',
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
          id: id,
          status: status,
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
          id: id,
          status: status,
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
          id: id,
          status: status,
          action: 'test action',
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
            id: id,
            status: status,
          ),
          throwsException,
        );
      });
    });

    group('QvstService - applyReversedQuestions', () {
      final service = QvstService(
        BackendApiBase(baseUrl: ''),
        BackendApi(Dio()),
        FileService(),
        '',
      );
      final question = QuestionAnalysisEntity(
        questionId: 'q1',
        questionText: 'Q1',
        satisfactionPercentage: 80.0,
        requiresAction: false,
        answers: [
          AnswerDistributionEntity(score: '1', count: 2),
          AnswerDistributionEntity(score: '2', count: 3),
        ],
      );
      final atRisk = AtRiskEmployeeEntity(
        anonymousUserId: 'u1',
        satisfactionPercentage: 60.0,
        lowScoresCount: 1,
        totalResponses: 2,
        criticalThemes: ['Theme 1'],
      );
      final analysisEntity = QvstAnalysisEntity(
        questionsAnalysis: [question],
        questionsRequiringAction: [question],
        atRiskEmployees: [atRisk],
        globalStats: GlobalStatsEntity(
          totalRespondents: 5,
          totalQuestions: 1,
          averageSatisfaction: 80.0,
          requiresAction: false,
          atRiskCount: 1,
        ),
      );

      test('returns same entity if reversedQuestions is empty', () {
        final result = service.applyReversedQuestions(analysisEntity, {});
        expect(result, analysisEntity);
      });

      test('inverts satisfaction for questions and employees', () {
        final result =
            service.applyReversedQuestions(analysisEntity, {'Q1': true});
        expect(result.questionsAnalysis.first.satisfactionPercentage, 20.0);
        expect(result.questionsAnalysis.first.requiresAction, isTrue);
        expect(
            result.atRiskEmployees.first.satisfactionPercentage, isNot(60.0));
        expect(result.globalStats?.averageSatisfaction, 20.0);
        expect(result.globalStats?.requiresAction, isTrue);
      });
    });

    group('QvstService - calculateWeightedAverage', () {
      final service = QvstService(
        BackendApiBase(baseUrl: ''),
        BackendApi(Dio()),
        FileService(),
        '',
      );
      test('returns 0 for empty answers', () {
        expect(service.calculateWeightedAverage([]), 0);
      });
      test('calculates weighted average', () {
        final answers = [
          AnswerDistributionEntity(score: '2', count: 2),
          AnswerDistributionEntity(score: '4', count: 3),
        ];
        expect(service.calculateWeightedAverage(answers), closeTo(3.2, 0.01));
      });
    });

    group('QvstService - _applyQuestionInversion', () {
      final service = QvstService(
        BackendApiBase(baseUrl: ''),
        BackendApi(Dio()),
        FileService(),
        '',
      );
      test('returns same question if not reversed', () {
        final question = QuestionAnalysisEntity(
          questionId: 'q1',
          questionText: 'Q1',
          satisfactionPercentage: 80.0,
          requiresAction: false,
          answers: [],
        );
        final result = service
            .applyReversedQuestions(
              QvstAnalysisEntity(questionsAnalysis: [question]),
              {},
            )
            .questionsAnalysis
            .first;
        expect(result.satisfactionPercentage, 80.0);
        expect(result.requiresAction, isFalse);
      });
      test('inverts satisfaction if reversed', () {
        final question = QuestionAnalysisEntity(
          questionId: 'q1',
          questionText: 'Q1',
          satisfactionPercentage: 80.0,
          requiresAction: false,
          answers: [],
        );
        final result = service
            .applyReversedQuestions(
              QvstAnalysisEntity(questionsAnalysis: [question]),
              {'Q1': true},
            )
            .questionsAnalysis
            .first;
        expect(result.satisfactionPercentage, 20.0);
        expect(result.requiresAction, isTrue);
      });
    });
  });
}
