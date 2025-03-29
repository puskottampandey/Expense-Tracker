import 'package:expensetracker/core/config/env_details.dart';

class Env {
  final String baseUrl;
  final String socketUrl;
  final EnvDetails environment;
  final String apiKey;

  Env({
    required this.baseUrl,
    required this.socketUrl,
    required this.environment,
    required this.apiKey,
  });
}

class EnvValue {
  static final Env development = Env(
    baseUrl: "",
    socketUrl: "",
    apiKey: "",
    environment: EnvDetails.dev(),
  );
  static final Env production = Env(
    baseUrl: "",
    socketUrl: "",
    apiKey: "",
    environment: EnvDetails.prod(),
  );
}
