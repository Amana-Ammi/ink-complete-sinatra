require './config/environment'

#"Mounting" my controllers so my application knows about them
use UserController
use ClientsController
run ApplicationController
