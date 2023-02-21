{-# LANGUAGE NoImplicitPrelude #-}

module Main (main) where

import Dasein.Env (getEnv, getLogOptions)
import Dasein.Server (startApp)
import RIO

main :: IO ()
main = do
  lo <- getLogOptions
  withLogFunc lo $ \lf -> do
    env <- getEnv lf
    runRIO env startApp
