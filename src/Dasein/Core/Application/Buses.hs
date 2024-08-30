module Dasein.Core.Application.Buses (CommandId, WithId) where

import Data.UUID.Types (UUID)
import RIO
import qualified RIO.HashMap as HM

-- type IndexedCommandHandlers = HM.HashMap Text CommandHandler

class (Hashable a) => CommandId a

class WithId a where
  new :: b -> IO a
  getId :: a -> Maybe UUID

class Message a where
  mkMessage :: payload -> a
