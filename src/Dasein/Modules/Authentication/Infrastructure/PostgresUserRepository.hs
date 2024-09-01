module Dasein.Modules.Authentication.Insfrastructure.PostgresUserRepository where

import qualified Dasein.Core.Infrastructure.Repository as R
import Data.UUID.Types
import Database.PostgreSQL.Simple
import RIO

data Repository = Repository {connection :: Connection}

data UserRecord = UserRecord
  { id :: UUID,
    email :: Text,
    password :: Text
  }
  deriving (Eq, Show)

save :: Repository -> a -> IO R.SaveResult
save = undefined

instance R.Repository Repository where
  save = undefined
  find = undefined