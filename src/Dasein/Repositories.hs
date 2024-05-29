{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Dasein.Repositories where

import Data.Time
import Data.UUID.Types
import Database.PostgreSQL.Simple
import Database.PostgreSQL.Simple.FromRow
import RIO

data UserRecord = UserRecord
  { userId :: !UUID,
    userFirstName :: !Text,
    userLastName :: !Text,
    createdAt :: !UTCTime
  }
  deriving (Eq, Show)

instance FromRow UserRecord where
  fromRow :: RowParser UserRecord
  fromRow = UserRecord <$> field <*> field <*> field <*> field

readUsers :: IO [UserRecord]
readUsers = do
  conn <- connectPostgreSQL "dbname=dasein"
  rows <- query_ conn "SELECT * FROM dasein.users" :: IO [UserRecord]
  close conn
  return rows