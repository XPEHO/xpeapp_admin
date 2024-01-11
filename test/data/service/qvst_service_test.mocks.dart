// Mocks generated by Mockito 5.4.4 from annotations
// in xpeapp_admin/test/data/service/qvst_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:retrofit/retrofit.dart' as _i2;
import 'package:xpeapp_admin/data/backend_api.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeHttpResponse_0<T> extends _i1.SmartFake
    implements _i2.HttpResponse<T> {
  _FakeHttpResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [BackendApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockBackendApi extends _i1.Mock implements _i3.BackendApi {
  MockBackendApi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.HttpResponse<dynamic>> sendNotification(
          Map<String, dynamic>? body) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendNotification,
          [body],
        ),
        returnValue: _i4.Future<_i2.HttpResponse<dynamic>>.value(
            _FakeHttpResponse_0<dynamic>(
          this,
          Invocation.method(
            #sendNotification,
            [body],
          ),
        )),
      ) as _i4.Future<_i2.HttpResponse<dynamic>>);

  @override
  _i4.Future<_i2.HttpResponse<dynamic>> getAllQvst() => (super.noSuchMethod(
        Invocation.method(
          #getAllQvst,
          [],
        ),
        returnValue: _i4.Future<_i2.HttpResponse<dynamic>>.value(
            _FakeHttpResponse_0<dynamic>(
          this,
          Invocation.method(
            #getAllQvst,
            [],
          ),
        )),
      ) as _i4.Future<_i2.HttpResponse<dynamic>>);

  @override
  _i4.Future<_i2.HttpResponse<dynamic>> getQvstById(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getQvstById,
          [id],
        ),
        returnValue: _i4.Future<_i2.HttpResponse<dynamic>>.value(
            _FakeHttpResponse_0<dynamic>(
          this,
          Invocation.method(
            #getQvstById,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.HttpResponse<dynamic>>);

  @override
  _i4.Future<_i2.HttpResponse<dynamic>> getQvstResumeById(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getQvstResumeById,
          [id],
        ),
        returnValue: _i4.Future<_i2.HttpResponse<dynamic>>.value(
            _FakeHttpResponse_0<dynamic>(
          this,
          Invocation.method(
            #getQvstResumeById,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.HttpResponse<dynamic>>);

  @override
  _i4.Future<_i2.HttpResponse<dynamic>> getAllQvstThemes() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllQvstThemes,
          [],
        ),
        returnValue: _i4.Future<_i2.HttpResponse<dynamic>>.value(
            _FakeHttpResponse_0<dynamic>(
          this,
          Invocation.method(
            #getAllQvstThemes,
            [],
          ),
        )),
      ) as _i4.Future<_i2.HttpResponse<dynamic>>);

  @override
  _i4.Future<_i2.HttpResponse<dynamic>> getAllQvstQuestionsByThemeId(
          String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllQvstQuestionsByThemeId,
          [id],
        ),
        returnValue: _i4.Future<_i2.HttpResponse<dynamic>>.value(
            _FakeHttpResponse_0<dynamic>(
          this,
          Invocation.method(
            #getAllQvstQuestionsByThemeId,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.HttpResponse<dynamic>>);

  @override
  _i4.Future<_i2.HttpResponse<dynamic>> addQvst(Map<String, dynamic>? body) =>
      (super.noSuchMethod(
        Invocation.method(
          #addQvst,
          [body],
        ),
        returnValue: _i4.Future<_i2.HttpResponse<dynamic>>.value(
            _FakeHttpResponse_0<dynamic>(
          this,
          Invocation.method(
            #addQvst,
            [body],
          ),
        )),
      ) as _i4.Future<_i2.HttpResponse<dynamic>>);

  @override
  _i4.Future<_i2.HttpResponse<dynamic>> deleteQvst(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteQvst,
          [id],
        ),
        returnValue: _i4.Future<_i2.HttpResponse<dynamic>>.value(
            _FakeHttpResponse_0<dynamic>(
          this,
          Invocation.method(
            #deleteQvst,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.HttpResponse<dynamic>>);

  @override
  _i4.Future<_i2.HttpResponse<dynamic>> getQvstAnswersRepo() =>
      (super.noSuchMethod(
        Invocation.method(
          #getQvstAnswersRepo,
          [],
        ),
        returnValue: _i4.Future<_i2.HttpResponse<dynamic>>.value(
            _FakeHttpResponse_0<dynamic>(
          this,
          Invocation.method(
            #getQvstAnswersRepo,
            [],
          ),
        )),
      ) as _i4.Future<_i2.HttpResponse<dynamic>>);

  @override
  _i4.Future<_i2.HttpResponse<dynamic>> updateQvstAnswersRepo(
    String? id,
    Map<String, dynamic>? body,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateQvstAnswersRepo,
          [
            id,
            body,
          ],
        ),
        returnValue: _i4.Future<_i2.HttpResponse<dynamic>>.value(
            _FakeHttpResponse_0<dynamic>(
          this,
          Invocation.method(
            #updateQvstAnswersRepo,
            [
              id,
              body,
            ],
          ),
        )),
      ) as _i4.Future<_i2.HttpResponse<dynamic>>);

  @override
  _i4.Future<_i2.HttpResponse<dynamic>> getAllQvstCampaigns() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllQvstCampaigns,
          [],
        ),
        returnValue: _i4.Future<_i2.HttpResponse<dynamic>>.value(
            _FakeHttpResponse_0<dynamic>(
          this,
          Invocation.method(
            #getAllQvstCampaigns,
            [],
          ),
        )),
      ) as _i4.Future<_i2.HttpResponse<dynamic>>);

  @override
  _i4.Future<_i2.HttpResponse<dynamic>> addQvstCampaign(
          Map<String, dynamic>? body) =>
      (super.noSuchMethod(
        Invocation.method(
          #addQvstCampaign,
          [body],
        ),
        returnValue: _i4.Future<_i2.HttpResponse<dynamic>>.value(
            _FakeHttpResponse_0<dynamic>(
          this,
          Invocation.method(
            #addQvstCampaign,
            [body],
          ),
        )),
      ) as _i4.Future<_i2.HttpResponse<dynamic>>);
}
