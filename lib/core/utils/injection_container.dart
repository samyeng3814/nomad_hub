import 'package:get_it/get_it.dart';
import 'package:nomad_hub/core/network/internet_connectivity.dart';
import 'package:nomad_hub/feature/activity/provider/activity_provider.dart';
import 'package:nomad_hub/feature/chat_page/provider/chat_provider.dart';
import 'package:nomad_hub/feature/explore/provider/filter_provider.dart';
import 'package:nomad_hub/feature/home_page/provider/home_page_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<InternetConnetivity>(() => InternetConnetivity());
  sl.registerFactory<HomePageProvider>(() => HomePageProvider());
  sl.registerFactory<ChatProvider>(() => ChatProvider());
  sl.registerFactory<ActivityProvider>(() => ActivityProvider());
  sl.registerFactory<FilterProvider>(() => FilterProvider());
}
