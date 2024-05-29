
import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/entity/post/post_list.dart';
import 'package:edublock/domain/repository/post/post_repository.dart';

class GetPostUseCase extends UseCase<PostList, void> {

  final PostRepository _postRepository;

  GetPostUseCase(this._postRepository);

  @override
  Future<PostList> call({required params}) {
    return _postRepository.getPosts();
  }
}
