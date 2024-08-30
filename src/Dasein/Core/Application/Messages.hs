module Dasein.Core.Application.Messages
  ( Command,
    CommandKey (..),
    mkCommand,
  )
where

import Data.Time (UTCTime)
import Data.UUID.Types (UUID)
import Data.UUID.V4 (nextRandom)
import RIO

newtype CommandKey = CommandKey Text
  deriving (Eq, Show)

data Command payload = Command
  { key :: CommandKey,
    uuid :: UUID,
    dispatchedAt :: Maybe UTCTime,
    payload :: payload
  }
  deriving (Eq, Show)

mkCommand :: CommandKey -> payload -> IO (Command payload)
mkCommand k p = do
  newUuid <- nextRandom
  return
    Command
      { key = k,
        uuid = newUuid,
        dispatchedAt = Nothing,
        payload = p
      }
