require './config/environment'


use Rack::MethodOverride

use UserController
use ClientsController
run ApplicationController
