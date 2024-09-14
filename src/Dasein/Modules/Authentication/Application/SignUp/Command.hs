module Dasein.Modules.Authentication.Application.SignUp.Command
  ( createSignUpCommand,
    SignUpCommandPayload (..),
    SignUpCommand,
  )
where

import Dasein.Core.Application.Messages (Command, MessageKey, create)
import RIO

signUpCommandKey :: MessageKey
signUpCommandKey = "Authenticaton.Application.SignIn.Command"

data SignUpCommandPayload = SignUpCommandPayload
  { email :: !Text,
    password :: !Text
  }
  deriving (Eq, Show)

type SignUpCommand = Command SignUpCommandPayload

createSignUpCommand :: SignUpCommandPayload -> IO (Command SignUpCommandPayload)
createSignUpCommand = create signUpCommandKey
