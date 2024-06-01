import 'package:template/core/network/app_url.dart';
import 'package:template/core/network/models/auth_tokens.dart';
import 'package:template/core/providers/auth_provider.dart';
import 'package:template/core/providers/user_provider.dart';
import 'package:template/service_locator.dart';
import 'package:dio/dio.dart';


class TokenInterceptor extends Interceptor {

  AuthProvider get authProvider => locator<AuthProvider>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (authProvider.accessToken != null && (authProvider.accessToken?.isNotEmpty??false)) {
      options.headers['Authorization'] = 'Bearer ${authProvider.accessToken}';
    }
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {

        // Refresh the token here
        // This is a placeholder for your token refresh logic
        await refreshToken();

        // Retry the request with the new token
        final requestOptions = err.requestOptions.copyWith(
          headers: {
            ...err.requestOptions.headers,
            'Authorization': 'Bearer ${authProvider.accessToken}',
          },
        );
        final response = await Dio().fetch(requestOptions);
        return handler.resolve(response);
      } catch (e) {

        return handler.next(err);
      }
    }
    return handler.next(err);
  }

  Future refreshToken() async {

    try{
      final currentRefreshToken = authProvider.refreshToken;

      final response = await Dio().post(
        AuthUrls.refreshToken,
        data: {
          'refreshToken': currentRefreshToken,
        },
      );


      if(response.statusCode == 200) {

        final newTokens = AuthTokensModel.fromMap(response.data);

        authProvider.accessToken = newTokens.accessToken;
        authProvider.refreshToken = newTokens.refreshToken;
      }else{
        authProvider.logout();
        locator<UserProvider>().logout();
      }

    }catch(e){
      authProvider.logout();
      locator<UserProvider>().logout();
    }
  }
}
