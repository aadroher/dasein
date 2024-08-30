module Dasein.Core.Application.Messages (Message, Command) where

import RIO

-- data Command a = Command
--   { commandName :: Text,
--     commandPayload :: a
--   }
--   deriving (Eq, Show)

class Message a where
  messageName :: a -> Text
  messagePayload :: a -> b

class (Message a) => Command a where
  mkCommand :: b -> IO a