import 'package:provider_base/env/env_state.dart';

import 'app.dart';

Future<void> main() async {
  setupAndRunApp(env: Env.stg);
}
