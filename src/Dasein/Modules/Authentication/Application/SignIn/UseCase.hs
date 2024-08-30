{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Dasein.Modules.Authentication.Application.SignIn.UseCase where

import RIO

newtype UseCaseError = UseCaseError Text

data UseCaseResult a = Ok a | Error UseCaseError

data UseCaseParams p d = UseCaseParams
  { params :: p,
    dependencies :: d
  }

class UseCase a where
  run :: a -> IO (UseCaseResult ())

data SignInUseCase p d = SignInUseCase (UseCaseParams p d)

instance UseCase (SignInUseCase p d) where
  run (SignInUseCase _) = undefined

useCase :: IO (UseCaseResult ())
useCase = undefined