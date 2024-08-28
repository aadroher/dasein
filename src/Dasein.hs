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
import Network.Wai (Application)
import Network.Wai.Handler.Warp (run)
import Network.Wai.Middleware.RequestLogger (logStdoutDev)
import RIO
import Servant (serve)

startApp :: RIO Env ()
startApp = do
  env <- ask
  let port = envPort env
  logInfo $ displayShow $ "Starting app on port " ++ show port ++ " ..."
  liftIO $ readUsers
  liftIO $ run port waiApp

waiApp :: Application
waiApp = logStdoutDev mainApp
  where
    mainApp = serve api server
