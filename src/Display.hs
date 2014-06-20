{-# LANGUAGE ForeignFunctionInterface #-}
module Display where

import Foreign.C(CInt(..), CFloat(..))

newtype DisplayNumber = DisplayNumber CInt
newtype Brightness = Brightness CFloat

foreign import ccall getBrightness :: DisplayNumber -> IO Brightness
foreign import ccall setBrightness :: DisplayNumber -> Brightness -> IO()
