import 'package:cleanarchmvvm/app/app_prefrences.dart';
import 'package:cleanarchmvvm/app/di.dart';
import 'package:cleanarchmvvm/presentation/base/cubit/base_cubit.dart';
import 'package:cleanarchmvvm/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:cleanarchmvvm/presentation/login/cubit/login_cubit.dart';
import 'package:cleanarchmvvm/presentation/resources/assets_manager.dart';
import 'package:cleanarchmvvm/presentation/resources/color_manager.dart';
import 'package:cleanarchmvvm/presentation/resources/routes_manager.dart';
import 'package:cleanarchmvvm/presentation/resources/strings_manager.dart';
import 'package:cleanarchmvvm/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginCubit _loginCubit;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final AppPrefrences _appPrefrences = instance<AppPrefrences>();

  bool _isInit = true;

  _bind() {
    _usernameController.addListener(() {
      _loginCubit.setUsername(_usernameController.text);
    });
    _passwordController.addListener(() {
      _loginCubit.setPassword(_passwordController.text);
    });
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _loginCubit = BlocProvider.of<LoginCubit>(context);
      _bind();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is UserLoggedIn) {
            // Navigate to main screen
            SchedulerBinding.instance?.addPostFrameCallback((_) {
              _appPrefrences.setUserLoggedIn();
              Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
            });
          }
        },
        builder: (context, state) {
          return BlocBuilder<BaseCubit, BaseState>(
            builder: (context, state) {
              return state.inputState
                  .getScreenWidget(context, _getContentWidget(), () {
                _loginCubit.login(context);
              });
            },
          );
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Container(
      padding: const EdgeInsets.only(top: AppPadding.p100),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Center(
                  child: Image(image: AssetImage(ImageAssets.splashLogo))),
              const SizedBox(height: AppSize.s28),
              Padding(
                padding: const EdgeInsets.only(
                    right: AppPadding.p28, left: AppPadding.p28),
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _usernameController,
                      decoration: InputDecoration(
                          hintText: AppStrings.username,
                          labelText: AppStrings.username,
                          errorText: (state is InputsValidState &&
                                  state.isUsernameValid == true)
                              ? null
                              : AppStrings.usernameError),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSize.s28),
              Padding(
                padding: const EdgeInsets.only(
                    right: AppPadding.p28, left: AppPadding.p28),
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: AppStrings.password,
                          labelText: AppStrings.password,
                          errorText: (state is InputsValidState &&
                                  state.isPasswordValid == true)
                              ? null
                              : AppStrings.passwordError),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSize.s28),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.p28,
                  right: AppPadding.p28,
                ),
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                        onPressed: (state is InputsValidState &&
                                state.areAllInputsValid)
                            ? () {
                                _loginCubit.login(context);
                              }
                            : null,
                        child: const Text(AppStrings.login),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                    top: AppPadding.p8,
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Routes.forgotPasswordRoute);
                          },
                          child: Text(
                            AppStrings.forgotPassword,
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.registerRoute);
                          },
                          child: Text(
                            AppStrings.dontHaveAccount,
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
