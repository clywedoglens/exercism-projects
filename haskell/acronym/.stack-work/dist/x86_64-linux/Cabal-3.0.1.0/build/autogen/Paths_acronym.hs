{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_acronym (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
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
version = Version [1,7,0,11] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/george/snap/exercism/5/exercism/haskell/acronym/.stack-work/install/x86_64-linux/78197821fd55a74c3a3698e7ff69217f5bfed0045ee5e3ac857d02c414c69ba9/8.8.3/bin"
libdir     = "/home/george/snap/exercism/5/exercism/haskell/acronym/.stack-work/install/x86_64-linux/78197821fd55a74c3a3698e7ff69217f5bfed0045ee5e3ac857d02c414c69ba9/8.8.3/lib/x86_64-linux-ghc-8.8.3/acronym-1.7.0.11-1xrRDK1H9ms7c22WN01zIt"
dynlibdir  = "/home/george/snap/exercism/5/exercism/haskell/acronym/.stack-work/install/x86_64-linux/78197821fd55a74c3a3698e7ff69217f5bfed0045ee5e3ac857d02c414c69ba9/8.8.3/lib/x86_64-linux-ghc-8.8.3"
datadir    = "/home/george/snap/exercism/5/exercism/haskell/acronym/.stack-work/install/x86_64-linux/78197821fd55a74c3a3698e7ff69217f5bfed0045ee5e3ac857d02c414c69ba9/8.8.3/share/x86_64-linux-ghc-8.8.3/acronym-1.7.0.11"
libexecdir = "/home/george/snap/exercism/5/exercism/haskell/acronym/.stack-work/install/x86_64-linux/78197821fd55a74c3a3698e7ff69217f5bfed0045ee5e3ac857d02c414c69ba9/8.8.3/libexec/x86_64-linux-ghc-8.8.3/acronym-1.7.0.11"
sysconfdir = "/home/george/snap/exercism/5/exercism/haskell/acronym/.stack-work/install/x86_64-linux/78197821fd55a74c3a3698e7ff69217f5bfed0045ee5e3ac857d02c414c69ba9/8.8.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "acronym_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "acronym_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "acronym_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "acronym_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "acronym_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "acronym_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
