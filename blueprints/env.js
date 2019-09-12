const validations = require('../core/common/validations');

const env = validations.object({
  API_BASE_URL: validations.string().uri().required(),
  LOG_LEVEL: validations.string().allow([
    'debug',
    'error',
    'info',
    'warn'
  ]).required(),
  MAX_REQUEST_BODY_SIZE: validations.number().integer().required(),
  MODEL_REPOSITORY_BASE_URL: validations.string().uri().required(),
  MONGODB_HOST: validations.string().hostname().required(),
  MONGODB_NAME: validations.string().required(),
  MONGODB_PASSWORD: validations.string().optional().empty(''),
  MONGODB_POOL_SIZE: validations.number().required(),
  MONGODB_PORT: validations.number().required(),
  MONGODB_USER: validations.string().optional().empty(''),
  NAME: validations.string().required(),
  NODE_ENV: validations.string().allow([
    'development',
    'production',
    'staging',
    'test'
  ]).required()
}).unknown().required();

module.exports = env;
