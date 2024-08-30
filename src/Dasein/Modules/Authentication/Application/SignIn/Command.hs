module Dasein.Modules.Authentication.Application.SignIn.Command where

import Data.Time (UTCTime)
import Data.UUID.Types (UUID)
import RIO

data SignInCommandPayload = SignInCommandPayload
  { email :: !Text,
    password :: !Text
  }
  deriving (Eq, Show)

data SignInCommand = SignInCommand
  { id :: !UUID,
    dispatchedAt :: !(Maybe UTCTime),
    payload :: !SignInCommandPayload
  }
  deriving (Eq, Show)