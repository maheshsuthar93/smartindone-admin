import 'package:board_cut/core/core_injection.dart';

import 'data/data_sources/remote/company_remote_data_source.dart';
import 'data/data_sources/remote/company_remote_data_source_impl.dart';
import 'data/repositories/company_repository_impl.dart';
import 'domain/repositories/company_repository.dart';
import 'domain/usecases/create_company.dart';
import 'domain/usecases/get_companies.dart';
import 'domain/usecases/update_company.dart';
import 'presentation/viewmodels/companies_view_model.dart';
import 'presentation/viewmodels/company_form_view_model.dart';

void initCompanies() {
  sl.registerLazySingleton<CompanyRemoteDataSource>(
    () => CompanyRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<CompanyRepository>(
    () => CompanyRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetCompanies(sl()));
  sl.registerLazySingleton(() => CreateCompany(sl()));
  sl.registerLazySingleton(() => UpdateCompany(sl()));
  sl.registerFactory(() => CompaniesViewModel(getCompanies: sl()));
  sl.registerFactory(
    () => CompanyFormViewModel(createCompany: sl(), updateCompany: sl()),
  );
}
