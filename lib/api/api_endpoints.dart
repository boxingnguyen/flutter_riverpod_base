class ApiEndpoints {
  // Decalre endpoint here, for example:
  final String? userId;
  final String? postId;
  final String? searchKey;

  // static endpoints
  static const post = '/posts';
  static const comments = '/comments';
  static const photos = '/photos';
  static const todos = '/todos';
  static const users = '/users';
  static const refreshToken = '/refresh_token';

  // dynamic endpoints
  String? updatePost;
  String? deletePost;

  ApiEndpoints({
    this.userId,
    this.postId,
    this.searchKey,
  });

  String get postDetail => '/post/$userId';
  String get postDelete => '/post/$userId';
  String get postUpdate => '/post/$userId';
  String get searchBook => '/books/v1/volumes?q=$searchKey';
}
