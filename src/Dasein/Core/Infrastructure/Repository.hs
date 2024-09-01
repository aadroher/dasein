module Dasein.Core.Infrastructure.Repository (Repository (..), SaveResult) where

import Data.UUID.Types
import RIO

data SaveResult = Ok | Error Text

class Repository a where
  save :: a -> b -> IO SaveResult
  find :: a -> UUID -> IO (Maybe b)
