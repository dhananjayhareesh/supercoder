import 'package:get/get.dart';

class HomeController extends GetxController {
  // Reactive state (pretend API values)
  final userName = '홍길동'.obs;
  final applied = 0.obs;
  final inProgress = 0.obs;
  final completed = 0.obs;

  void onTapProfileImage() {
    // TODO: open image picker
    Get.snackbar('이미지 등록', '프로필 이미지를 등록하세요.');
  }

  void logout() {
    Get.snackbar('로그아웃', '정상적으로 로그아웃 되었습니다.');
  }

  void deleteAccount() {
    Get.defaultDialog(
      title: '회원탈퇴',
      middleText: '정말로 탈퇴하시겠습니까?',
      textConfirm: '확인',
      textCancel: '취소',
      onConfirm: () {
        Get.back();
        Get.snackbar('회원탈퇴', '계정이 삭제되었습니다.');
      },
    );
  }
}
