{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Dasein
  ( startApp,
    Env (..),
  )
where

import Dasein.Api (api)
import Dasein.Env (Env (..))
import Dasein.Repositories (readUsers)
import Dasein.Server (server)
import Network.Wai
import Network.Wai.Handler.Warp
import RIO
import Servant

startApp :: RIO Env ()
startApp = do
  env <- ask
  let port = envPort env
  logInfo $ displayShow $ "Starting app on port " ++ show port ++ " ..."
  liftIO $ readUsers
  liftIO $ run port waiApp

waiApp :: Application
waiApp = serve api server
