import 'package:flutter_app/models/course_model.dart';
import 'package:flutter_app/services/course_api_service.dart';

enum CourseState { initial, loading, success, error }

/// Controller that holds state and delegates API calls to [CourseApiService].
/// UI layers only interact with this controller, never with the service directly.
class CourseController {
  final CourseApiService _service = CourseApiService();

  CourseState state = CourseState.initial;
  List<CourseModel> courses = [];
  String errorMessage = '';

  // ── READ ──────────────────────────────────────────────────────────────────

  Future<void> fetchCourses() async {
    state = CourseState.loading;
    errorMessage = '';

    try {
      courses = await _service.getCourses();
      state = CourseState.success;
    } catch (e) {
      errorMessage = e.toString().replaceFirst('Exception: ', '');
      state = CourseState.error;
    }
  }

  // ── CREATE ────────────────────────────────────────────────────────────────

  Future<bool> addCourse({
    required String title,
    required String description,
  }) async {
    state = CourseState.loading;
    errorMessage = '';

    try {
      final newCourse = CourseModel(title: title, body: description);
      final created = await _service.createCourse(newCourse);

      // JSONPlaceholder always returns id 101 for new posts;
      // we insert at front with a unique negative id for local list management.
      courses.insert(
        0,
        created.copyWith(id: created.id ?? -(courses.length + 1)),
      );
      state = CourseState.success;
      return true;
    } catch (e) {
      errorMessage = e.toString().replaceFirst('Exception: ', '');
      state = CourseState.error;
      return false;
    }
  }

  // ── UPDATE ────────────────────────────────────────────────────────────────

  Future<bool> editCourse({
    required CourseModel course,
    required String title,
    required String description,
  }) async {
    state = CourseState.loading;
    errorMessage = '';

    try {
      final updated = course.copyWith(title: title, body: description);
      final result = await _service.updateCourse(updated);

      final index = courses.indexWhere((c) => c.id == course.id);
      if (index != -1) {
        courses[index] = result.copyWith(id: course.id);
      }
      state = CourseState.success;
      return true;
    } catch (e) {
      errorMessage = e.toString().replaceFirst('Exception: ', '');
      state = CourseState.error;
      return false;
    }
  }

  // ── DELETE ────────────────────────────────────────────────────────────────

  Future<bool> removeCourse(int id) async {
    state = CourseState.loading;
    errorMessage = '';

    try {
      await _service.deleteCourse(id);
      courses.removeWhere((c) => c.id == id);
      state = CourseState.success;
      return true;
    } catch (e) {
      errorMessage = e.toString().replaceFirst('Exception: ', '');
      state = CourseState.error;
      return false;
    }
  }
}
