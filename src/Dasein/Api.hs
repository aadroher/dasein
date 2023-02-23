{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Dasein.Api (API, User (..), api, userFromRecord) where

import Dasein.Repositories
import Data.Aeson hiding (Options)
import Data.Aeson.TH hiding (Options)
import Data.UUID.Types
import RIO
import Servant

data User = User
  { userId :: UUID,
    userFirstName :: Text,
    userLastName :: Text
  }
  deriving (Eq, Show)

userFromRecord :: UserRecord -> User
userFromRecord (UserRecord uuid firstName lastName _) =
  User uuid firstName lastName

$(deriveJSON defaultOptions ''User)

type API = "users" :> Get '[JSON] [User]

api :: Proxy API
api = Proxy
