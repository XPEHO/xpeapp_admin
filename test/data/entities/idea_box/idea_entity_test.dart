import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/entities/idea_box/idea_entity.dart';

void main() {
  group('IdeaEntity', () {
    test('IdeaEntity fromJson creates a valid instance', () {
      final ideaJson = {
        "id": "1",
        "description": "This is a test idea",
        "context": "Test context",
        "status": "submitted",
        "created_at": "2024-01-15T10:30:00Z",
      };

      final ideaEntity = IdeaEntity.fromJson(ideaJson);

      expect(ideaEntity.id, "1");
      expect(ideaEntity.description, "This is a test idea");
      expect(ideaEntity.context, "Test context");
      expect(ideaEntity.status, "submitted");
      expect(ideaEntity.createdAt, DateTime.parse("2024-01-15T10:30:00Z"));
    });

    test('IdeaEntity fromJson handles datetime correctly', () {
      final ideaJson = {
        "id": "2",
        "description": "Another test idea",
        "context": "Another context",
        "status": "in_progress",
        "created_at": "2024-01-15T15:45:30Z",
      };

      final ideaEntity = IdeaEntity.fromJson(ideaJson);

      expect(ideaEntity.id, "2");
      expect(ideaEntity.description, "Another test idea");
      expect(ideaEntity.context, "Another context");
      expect(ideaEntity.status, "in_progress");
      expect(ideaEntity.createdAt, DateTime.parse("2024-01-15T15:45:30Z"));
    });

    test('IdeaEntity toJson creates JSON correctly', () {
      final ideaEntity = IdeaEntity(
        id: "3",
        description: "Another test idea",
        context: "Test context",
        status: "completed",
        createdAt: DateTime.parse("2024-01-15T14:30:00Z"),
      );

      final json = ideaEntity.toJson();

      expect(json['id'], "3");
      expect(json['description'], "Another test idea");
      expect(json['context'], "Test context");
      expect(json['status'], "completed");
      expect(json['created_at'], "2024-01-15T14:30:00.000Z");
    });

    test('IdeaEntity copyWith creates new instance with updated values', () {
      final originalIdea = IdeaEntity(
        id: "5",
        description: "Original Description",
        context: "Original Context",
        status: "submitted",
        createdAt: DateTime.parse("2024-01-15T10:00:00Z"),
      );

      final updatedIdea = originalIdea.copyWith(
        description: "Updated Description",
        status: "in_progress",
      );

      expect(updatedIdea.id, "5");
      expect(updatedIdea.description, "Updated Description");
      expect(updatedIdea.context, "Original Context");
      expect(updatedIdea.status, "in_progress");
      expect(updatedIdea.createdAt, DateTime.parse("2024-01-15T10:00:00Z"));
    });

    test('IdeaEntity equality works correctly', () {
      final idea1 = IdeaEntity(
        id: "6",
        description: "Same Idea",
        context: "Same Context",
        status: "submitted",
        createdAt: DateTime.parse("2024-01-15T10:00:00Z"),
      );

      final idea2 = IdeaEntity(
        id: "6",
        description: "Same Idea",
        context: "Same Context",
        status: "submitted",
        createdAt: DateTime.parse("2024-01-15T10:00:00Z"),
      );

      final idea3 = IdeaEntity(
        id: "7",
        description: "Different Idea",
        context: "Same Context",
        status: "submitted",
        createdAt: DateTime.parse("2024-01-15T10:00:00Z"),
      );

      expect(idea1, equals(idea2));
      expect(idea1, isNot(equals(idea3)));
    });
  });
}
