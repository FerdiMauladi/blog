import 'package:blog/base/base_controller.dart';
import 'package:blog/data/model/post_model.dart';

enum HomeViewState {
  none,
  loading,
  error,
  tokenExpired,
}

class HomeController extends BaseController {
  HomeViewState _state = HomeViewState.none;

  HomeViewState get state => _state;

  List<PostModel> listPostBlog = [];

  changeState(HomeViewState s) {
    _state = s;
    update();
  }

  @override
  void onInit() {
    getDataPost();
    super.onInit();
  }

  Future getDataPost() async {
    changeState(HomeViewState.loading);
    try {
      final dataPost = await repository.getPost();
      listPostBlog = dataPost;
      update();
      changeState(HomeViewState.none);
    } catch (e) {
      if (e.toString().contains('Token Expired')) {
        changeState(HomeViewState.tokenExpired);
      } else {
        changeState(HomeViewState.error);
      }
    }
  }

  Future logout() async {
    changeState(HomeViewState.loading);
    try {
      await repository.logout().then((_) => storage.deleteToken());
      changeState(HomeViewState.none);
    } catch (e) {
      changeState(HomeViewState.error);
    }
  }
}
