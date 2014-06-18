{-# LANGUAGE ForeignFunctionInterface #-}
module Display where

import Foreign.C(CInt(..), CFloat(..))

newtype DisplayNumber = DisplayNumber CInt deriving(Show)
newtype Brightness = Brightness CFloat deriving(Show)

foreign import ccall getBrightness :: DisplayNumber -> IO Brightness
foreign import ccall setBrightness :: DisplayNumber -> Brightness -> IO()
