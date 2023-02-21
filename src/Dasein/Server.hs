{-# LANGUAGE NoImplicitPrelude #-}

module Dasein.Server where

import Dasein.Api (API, User (..))
import RIO
import Servant

server :: Server API
server = return users

users :: [User]
users =
  [ User 1 "Isaac" "Newton",
    User 2 "Albert" "Einstein"
  ]