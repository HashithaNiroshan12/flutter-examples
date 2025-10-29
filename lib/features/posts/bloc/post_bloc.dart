import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:version_3_22_8/features/posts/models/post.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

part 'post_event.dart';
part 'post_state.dart';

const _postLimit = 50;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return ((events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  });
}

class PostBloc extends Bloc<PostEvent, PostState> {
  final http.Client _httpClient;

  PostBloc({required http.Client httpClient})
      : _httpClient = httpClient,
        super(const PostState()) {
    on<PostedFetched>(_onFetched,
        transformer: throttleDroppable(throttleDuration));
  }

  Future<void> _onFetched(PostedFetched event, Emitter<PostState> emit) async {
    if (state.hasReachedMax) return;

    try {
      final posts = await _fetchPosts(startIndex: state.posts.length);

      if (posts.isEmpty) {
        return emit(state.copyWith(hasReachedMax: true));
      }
      emit(state.copyWith(
          status: PostStatus.success, posts: [...state.posts, ...posts]));
    } catch (_) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  Future<List<Post>> _fetchPosts({required int startIndex}) async {
    final response = await _httpClient.get(Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts',
        {'_start': '$startIndex', '_limit': '$_postLimit'}));

    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((json) {
        final map = json as Map<String, dynamic>;
        return Post(
            id: map['id'] as int,
            title: map['title'] as String,
            body: map['body'] as String);
      }).toList();
    }
    throw Exception('error fetching posts');
  }
}
