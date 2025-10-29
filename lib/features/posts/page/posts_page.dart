import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_3_22_8/features/posts/bloc/post_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:version_3_22_8/features/posts/page/posts_list.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) =>
            PostBloc(httpClient: http.Client())..add(PostedFetched()),
        child: const PostList(),
      ),
    );
  }
}
