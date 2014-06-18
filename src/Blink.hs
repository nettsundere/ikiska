import Display(getBrightness, setBrightness, DisplayNumber(..), Brightness(..))
import Control.Concurrent

data BlinkStep = BlinkStep { seconds :: Float, value :: Brightness }

blinkSteps = ([
  BlinkStep 0.3 (Brightness 1  ),
  BlinkStep 0.1 (Brightness 0  ),
  BlinkStep 0   (Brightness 1  ),
  BlinkStep 0   (Brightness 0  ),
  BlinkStep 0.3 (Brightness 1  ),
  BlinkStep 0.6 (Brightness 0.5),
  BlinkStep 0.5 (Brightness 1) ])

waitSeconds seconds = threadDelay $ ceiling $ seconds * 1000000

-- Blink once
applyStep waitF setF blinkStep = do
  waitF $ (seconds blinkStep)
  setF $ (value blinkStep)

main :: IO ()
main = do
  let d = DisplayNumber 0
  currentBrightness <- getBrightness $ d

  -- Init
  setBrightness d (Brightness 0)

  mapM (applyStep waitSeconds (setBrightness d)) blinkSteps

  -- Restore
  setBrightness d currentBrightness
