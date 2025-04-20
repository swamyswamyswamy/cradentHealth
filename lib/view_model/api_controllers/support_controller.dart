import 'package:cradenthealth/models/support_model.dart';
import 'package:cradenthealth/services/support_service.dart';
import 'package:get/get.dart';

class SupportController extends GetxController {
  var supportsApiResponse = SupportsApiResponse().obs;
  final SupportService supportService;

  var isLoading = false.obs; // Observable for loading state
  var isLoadingAddSupport = false.obs; // Observable for loading state
  SupportController(this.supportService);

  void fetchSupport() async {
    print("fdfmdfdf");
    try {
      isLoading.value = true; // Set loading to false
      supportsApiResponse.value = await supportService.fetchSupport();
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
      supportsApiResponse.value = await supportService.addSupport(
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
