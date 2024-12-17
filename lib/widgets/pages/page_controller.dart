import 'package:get/get.dart';
import 'package:vacalcula/widgets/pages/page_state.dart';

class PageNavController extends GetxController {
  final _page = PageState.home.obs;

  void navigate(PageState newState) {
    _page.value = newState;
    update();
  }

  PageState get page => _page.value;
}