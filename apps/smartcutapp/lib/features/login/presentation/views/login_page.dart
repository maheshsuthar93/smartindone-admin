import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/login/presentation/viewmodels/login_view_model.dart';
import 'package:board_cut/features/login/presentation/widgets/login_left.dart';
import 'package:board_cut/gen/assets.gen.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends BaseStatefulScreen {
  const LoginPage({super.key});

  @override
  BaseState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(
    text: 'maheshsuthar.superadmin@mailinator.com',
  );
  final _passwordController = TextEditingController(text: 'Superadmin@503');
  final _viewModel = sl<LoginViewModel>();

  bool _isSmallScreen = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    _isSmallScreen =
        screenType == ScreenType.mobile || screenType == ScreenType.tablet;
    final page = switch (screenType) {
      ScreenType.mobile || ScreenType.tablet => _mobile(),
      ScreenType.desktop => _desktop(),
    };
    return ChangeNotifierProvider.value(value: _viewModel, child: page);
  }

  Widget _mobile() => Scaffold(
    backgroundColor: AppColors.surface,
    body: SafeArea(child: _right()),
  );

  Widget _desktop() {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Row(
        children: [
          SizedBox(width: width * .4, child: _left()),
          SizedBox(width: width * .6, child: _right()),
        ],
      ),
    );
  }

  Widget _left() => const LoginLeftPanel();

  Widget _right() => Consumer<LoginViewModel>(
    builder: (context, vm, _) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
        color: _isSmallScreen ? AppColors.surface : Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final form = ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: _isSmallScreen
                    ? double.maxFinite
                    : MediaQuery.of(context).size.width / 4,
              ),
              child: Column(
                mainAxisSize: _isSmallScreen
                    ? MainAxisSize.min
                    : MainAxisSize.max,
                mainAxisAlignment: _isSmallScreen
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  Image.asset(Assets.images.logoLogin.path, width: 250),
                  Text(
                    'Welcome back!',
                    style: AppTextStyle.bodyLarge.responsive(context).bold,
                  ),
                  Text(
                    'Sign in to your account to continue.',
                    style: AppTextStyle.bodyMedium.responsive(context).regular,
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormFieldWidget(
                          controller: _emailController,
                          labelText: 'Email Address',
                          hintText: 'Enter your email address',
                          keyboardType: TextInputType.emailAddress,
                          isRequired: true,
                          validator: (value) {
                            final email = value?.trim() ?? '';
                            if (email.isEmpty) return 'Email is required';
                            final separator = email.indexOf('@');
                            if (separator <= 0 ||
                                separator == email.length - 1 ||
                                !email.substring(separator + 1).contains('.')) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormFieldWidget(
                          controller: _passwordController,
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          obscureText: true,
                          isRequired: true,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Password is required'
                              : null,
                          onFieldSubmitted: (_) => _submit(),
                        ),
                        if (vm.error != null) ...[
                          const SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              vm.error!,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.maxFinite,
                          child: ButtonWidget.primary(
                            label: vm.isLoading ? 'Signing in...' : 'Login',
                            icon: vm.isLoading ? null : Icons.arrow_forward,
                            onPressed: vm.isLoading ? null : _submit,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!_isSmallScreen) const Spacer(),
                  Text(
                    '© 2026 SmartIndOne. All rights reserved.',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.labelMedium
                        .responsive(context)
                        .regular
                        .copyWith(color: AppColors.textMuted),
                  ),
                ],
              ),
            );

            if (_isSmallScreen) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: form,
                ),
              );
            }

            return Center(child: form);
          },
        ),
      ),
    ),
  );

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final signedIn = await _viewModel.signIn(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );
    if (signedIn && mounted) const DashboardPageRoute().go(context);
  }
}
