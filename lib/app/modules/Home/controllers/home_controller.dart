import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  List<dynamic> services = [].obs;
  final isLoading = true.obs;
  final dio.Dio _dio = dio.Dio();
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    fetchServices();
  }

  Future<void> fetchServices() async {

    const String url =
        'http://citizenservice.vupadhi.com/api/webapi/serviceslist?Name=Welfare Scheme';

    try {
      final dio.Response response = await _dio.get(url);

      if (response.statusCode == 200) {
        services = response.data['data'];
      } else {
        Get.snackbar('Error', 'Failed to fetch services');
        print('Error: ${response.statusMessage}');
      }
    } on dio.DioException catch (e) {
      if (e.response != null) {
        print('DioError: ${e.response?.statusMessage}');
        Get.snackbar('Error', 'Failed to fetch services');
      } else {
        print('DioError: ${e.message}');
        Get.snackbar('Error', 'Failed to fetch services');
      }
    } catch (e) {

      print('Error: $e');
      Get.snackbar('Error', 'Failed to fetch services');
    } finally {
      isLoading.value = false;
    }
  }
}
