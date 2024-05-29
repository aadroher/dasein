{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Dasein.Env (Env (..), getEnv, getLogOptions) where

import RIO
import RIO.Process
  ( HasProcessContext (..),
    ProcessContext,
    mkDefaultProcessContext,
  )

port :: Int
port = 4000

isVerbose :: Bool
isVerbose = True

data Env = Env
  { envLogFunc :: !LogFunc,
    envProcessContext :: !ProcessContext,
    envPort :: !Int
  }

instance HasLogFunc Env where
  logFuncL :: Lens' Env LogFunc
  logFuncL =
    lens
      envLogFunc
      (\env logFunc -> env {envLogFunc = logFunc})

instance HasProcessContext Env where
  processContextL :: Lens' Env ProcessContext
  processContextL =
    lens
      envProcessContext
      (\env processContext -> env {envProcessContext = processContext})

getLogOptions :: (MonadIO m) => m LogOptions
getLogOptions = logOptionsHandle stderr isVerbose

getEnv :: (MonadIO m) => LogFunc -> m Env
getEnv lf = do
  pc <- mkDefaultProcessContext
  return
    Env
      { envLogFunc = lf,
        envProcessContext = pc,
        envPort = port
      }