{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Dasein.Api (API, User (..), api) where

import Data.Aeson hiding (Options)
import Data.Aeson.TH hiding (Options)
import RIO
import Servant

data User = User
  { userId :: Int,
    userFirstName :: String,
    userLastName :: String
  }
  deriving (Eq, Show)

$(deriveJSON defaultOptions ''User)

type API = "users" :> Get '[JSON] [User]

api :: Proxy API
api = Proxy
