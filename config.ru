require './config/environment'

#"Mounting" my controllers so my application knows about them
use UsersController
use ClientsController
run ApplicationController
