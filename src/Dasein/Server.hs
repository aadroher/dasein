{-# LANGUAGE NoImplicitPrelude #-}

module Dasein.Server where

import Dasein.Api (API, userFromRecord)
import Dasein.Repositories (readUsers)
import RIO
import Servant (Server)

server :: Server API
server = do
  userRecords <- liftIO readUsers
  return $ userFromRecord <$> userRecords
