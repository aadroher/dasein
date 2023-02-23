{-# LANGUAGE NoImplicitPrelude #-}

module Dasein.Server where

import Dasein.Api
import Dasein.Repositories
import RIO
import Servant

server :: Server API
server = do
  userRecords <- liftIO readUsers
  return $ userFromRecord <$> userRecords
