module Dasein.Modules.Authentication.Application.SignIn.CommandHandler where

import Dasein.Core.Application.Messages (Command)
import Dasein.Modules.Authentication.Application.SignIn.Command (SignInCommand)
import RIO

handle :: SignInCommand -> IO ()
handle = undefined
