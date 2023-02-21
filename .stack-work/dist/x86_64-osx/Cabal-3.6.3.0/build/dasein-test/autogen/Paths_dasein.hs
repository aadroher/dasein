{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_dasein (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/aadroher/DevProjects/dasein/.stack-work/install/x86_64-osx/9c4ec537a6ae8a73f29d8e6028d7953c2c7a74093957fc9da7b095bf9a2f3595/9.2.5/bin"
libdir     = "/Users/aadroher/DevProjects/dasein/.stack-work/install/x86_64-osx/9c4ec537a6ae8a73f29d8e6028d7953c2c7a74093957fc9da7b095bf9a2f3595/9.2.5/lib/x86_64-osx-ghc-9.2.5/dasein-0.1.0.0-9E5iTVxTTgECY6paMplDEr-dasein-test"
dynlibdir  = "/Users/aadroher/DevProjects/dasein/.stack-work/install/x86_64-osx/9c4ec537a6ae8a73f29d8e6028d7953c2c7a74093957fc9da7b095bf9a2f3595/9.2.5/lib/x86_64-osx-ghc-9.2.5"
datadir    = "/Users/aadroher/DevProjects/dasein/.stack-work/install/x86_64-osx/9c4ec537a6ae8a73f29d8e6028d7953c2c7a74093957fc9da7b095bf9a2f3595/9.2.5/share/x86_64-osx-ghc-9.2.5/dasein-0.1.0.0"
libexecdir = "/Users/aadroher/DevProjects/dasein/.stack-work/install/x86_64-osx/9c4ec537a6ae8a73f29d8e6028d7953c2c7a74093957fc9da7b095bf9a2f3595/9.2.5/libexec/x86_64-osx-ghc-9.2.5/dasein-0.1.0.0"
sysconfdir = "/Users/aadroher/DevProjects/dasein/.stack-work/install/x86_64-osx/9c4ec537a6ae8a73f29d8e6028d7953c2c7a74093957fc9da7b095bf9a2f3595/9.2.5/etc"

getBinDir     = catchIO (getEnv "dasein_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "dasein_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "dasein_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "dasein_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "dasein_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "dasein_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
