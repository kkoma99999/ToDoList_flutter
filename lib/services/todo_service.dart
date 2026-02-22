import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_application_1/model/todo.dart';

class TodoService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<List<ToDo>> fetchTodos() async {
    final userId = _supabase.auth.currentUser!.id;
    final response = await _supabase
        .from('todos')
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: false);

    return (response as List).map((json) => ToDo.fromJson(json)).toList();
  }

  Future<void> addTodo(String todoText) async {
    final userId = _supabase.auth.currentUser!.id;
    await _supabase.from('todos').insert({
      'todo_text': todoText,
      'is_done': false,
      'user_id': userId,
    });
  }

  Future<void> updateTodo(String id, bool isDone) async {
    await _supabase.from('todos').update({'is_done': isDone}).eq('id', id);
  }

  Future<void> deleteTodo(String id) async {
    await _supabase.from('todos').delete().eq('id', id);
  }

  Future<Map<String, int>> getStats() async {
    final userId = _supabase.auth.currentUser!.id;
    final response = await _supabase
        .from('todos')
        .select()
        .eq('user_id', userId);

    final todos = response as List;
    final done = todos.where((t) => t['is_done'] == true).length;
    final undone = todos.where((t) => t['is_done'] == false).length;

    return {
      'done': done,
      'undone': undone,
      'overall': todos.length,
    };
  }
}
