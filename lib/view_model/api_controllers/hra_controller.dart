import 'package:cradenthealth/models/hra_model.dart';
import 'package:cradenthealth/models/support_model.dart';
import 'package:cradenthealth/services/hra_service.dart';
import 'package:cradenthealth/services/support_service.dart';
import 'package:get/get.dart';

class HraController extends GetxController {
  var assessmentResponse = AssessmentResponse().obs;
  final HraService hraService;

  var isLoading = false.obs; // Observable for loading state
  var isLoadingAddSupport = false.obs; // Observable for loading state
  HraController(this.hraService);

  void fetchHraQuestions() async {
    print("fdfmdfdf");
    try {
      isLoading.value = true; // Set loading to false
      assessmentResponse.value = await hraService.fetchHraQuestions();
      isLoading.value = false; // Set loading to false
    } catch (e) {
      // Handle error
      isLoading.value = false; // Set loading to false
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }

  void addSupport({
    required String title,
    required String description,
    required String image,
  }) async {
    print("fdfmdfdf");
    try {
      isLoadingAddSupport.value = true; // Set loading to false
      assessmentResponse.value = await hraService.addSupport(
          title: title, description: description, image: image);
      isLoadingAddSupport.value = false; // Set loading to false
    } catch (e) {
      // Handle error
      isLoadingAddSupport.value = false; // Set loading to false
    } finally {
      isLoadingAddSupport.value = false; // Set loading to false
    }
  }

  @override
  void onInit() {
    // fetchSupportService(); // Fetch data on controller initialization
    super.onInit();
  }
}
