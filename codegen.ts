import type { CodegenConfig } from '@graphql-codegen/cli'
 
const config: CodegenConfig = {
  generates: {
    'lib/data/models/app_models.dart': {
      plugins: {
        'flutter-freezed': {}
      }
    }
  }
}
export default config