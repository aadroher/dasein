{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

import Control.Monad.IO.Class (liftIO)
import Control.Monad.Logger (runStdoutLoggingT)
import Control.Monad.Reader (runReaderT)
import Data.Text (Text)
import Database.Persist
import Database.Persist.Sqlite
import Database.Persist.TH

share
  [mkPersist sqlSettings, mkMigrate "migrateAll"]
  [persistLowerCase|
Person
    name Text
    age Int Maybe
    deriving Show
|]

main :: IO ()
main = runStdoutLoggingT $ withSqliteConn "example.db" $ \backend -> liftIO $ do
  runReaderT (runMigration migrateAll) backend

  -- Insert a new person
  personId <- runReaderT (insert (Person "John Doe" (Just 30))) backend
  liftIO $ print personId

  -- Retrieve and print all people
  people <- runReaderT (selectList [] []) backend
  liftIO $ print (people :: [Entity Person])