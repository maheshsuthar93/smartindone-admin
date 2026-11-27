export 'physical_sheets_view_model.dart';
export 'presentation/physical_sheets_page.dart';

import 'package:board_cut/core/core_injection.dart';

import 'data/data_sources/remote/physical_sheets_remote_data_source.dart';
import 'data/data_sources/remote/physical_sheets_remote_data_source_impl.dart';
import 'data/repositories/physical_sheets_repository_impl.dart';
import 'domain/repositories/physical_sheets_repository.dart';
import 'domain/usecases/physical_sheet_usecases.dart';
import 'physical_sheets_view_model.dart';

void initPhysicalSheets() {
  sl.registerLazySingleton<PhysicalSheetsRemoteDataSource>(
    () => PhysicalSheetsRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<PhysicalSheetsRepository>(
    () => PhysicalSheetsRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => PhysicalSheetUseCases(sl()));
  sl.registerFactory(() => PhysicalSheetsViewModel(sl()));
}
