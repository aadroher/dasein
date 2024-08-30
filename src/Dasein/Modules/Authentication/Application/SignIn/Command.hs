module Dasein.Modules.Authentication.Application.SignIn.Command
  ( mkSignInCommand,
    SignInCommandPayload (..),
    SignInCommand,
  )
where

import Dasein.Core.Application.Messages (Command, CommandKey (..), mkCommand)
import RIO

signInCommandKey :: CommandKey
signInCommandKey = CommandKey "Authenticaton.Application.SignIn.Command"

data SignInCommandPayload = SignInCommandPayload
  { email :: !Text,
    password :: !Text
  }
  deriving (Eq, Show)

type SignInCommand = Command SignInCommandPayload

mkSignInCommand :: SignInCommandPayload -> IO (Command SignInCommandPayload)
mkSignInCommand = mkCommand signInCommandKey
