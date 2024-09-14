{-# LANGUAGE InstanceSigs #-}

module Dasein.Core.Application.Messages
  ( Command (..),
    create,
    -- Message (..),
    MessageMetadata (..),
    MessageKey,
  )
where

import Data.Time (UTCTime)
import Data.UUID.Types (UUID)
import Data.UUID.V4 (nextRandom)
import RIO

type MessageKey = Text

data MessageMetadata = MessageMetadata
  { uuid :: UUID,
    key :: MessageKey,
    dispatchedAt :: Maybe UTCTime
  }
  deriving (Eq, Show)

class Message a where
  create :: MessageKey -> payload -> IO (a payload)
  setDispatchedAt :: a payload -> UTCTime -> a payload

data Command payload = Command MessageMetadata payload
  deriving (Eq, Show)

instance Message Command where
  create :: MessageKey -> payload -> IO (Command payload)
  create k p = do
    newUuid <- nextRandom
    return $ Command (MessageMetadata newUuid k Nothing) p

  setDispatchedAt :: Command payload -> UTCTime -> Command payload
  setDispatchedAt (Command metadata payload) t =
    Command metadata {dispatchedAt = Just t} payload

-- data Query payload = Query MessageMetadata payload
--   deriving (Eq, Show)

-- data Event payload = Event MessageMetadata payload
--   deriving (Eq, Show)
