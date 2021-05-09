import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Layout.NoBorders
import XMonad.Layout.Fullscreen -- fullscreen windows in layout
import XMonad.Layout.Grid -- windows in grid layout:
import System.Environment
import Data.List

backgroundColor   = "black"
middleColor       = "#AEAEAE"
foregroundColor   = "white"

xmobarCommand :: String
xmobarCommand = intercalate " " [ "xmobar", "-d", "-B", stringed backgroundColor, "-F", stringed middleColor] 
  where stringed x = "\"" ++ x ++ "\""

main = do
xmproc <- spawnPipe xmobarCommand
currentTerminal <- getEnv "TERM"
xmonad $ docks def
    {
    terminal = currentTerminal
    ,borderWidth = bWidth
    ,layoutHook = smartBorders $ myLayout 
    ,manageHook = manageDocks <+> manageHook def
    } 
    where
    bWidth = 2
    myLayout = avoidStruts ( Grid ||| tiled ||| noBorders (fullscreenFull Full) ||| Mirror tiled)
      where
  -- default tiling algorithm partitions the screen into two panes
      tiled   = Tall nmaster delta ratio

      -- The default number of windows in the master pane
      nmaster = 1

      -- Default proportion of screen occupied by master pane
      ratio   = 1/2

      -- Percent of screen to increment by when resizing panes
      delta = 3/100 
