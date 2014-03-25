import XMonad
import Data.Monoid
import System.Exit
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

import XMonad.Hooks.EwmhDesktops

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

myTerminal      = "roxterm"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

myClickJustFocuses :: Bool
myClickJustFocuses = True

myBorderWidth   = 1

myModMask       = mod4Mask

myWorkspaces    = ["one", "two", "three", "four", "five"]

myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#ff0000"

customPP = defaultPP { 
  ppCurrent  = xmobarColor "#429942" "" . wrap "<" ">" ,
  ppHidden   = xmobarColor "#C98F0A" "" ,
  ppHiddenNoWindows = xmobarColor "#C9A34E" "" ,
  ppUrgent   = xmobarColor "#FFFFAF" "" . wrap "[" "]" ,
  ppLayout   = xmobarColor "#C9A34E" "" ,
  ppTitle    = xmobarColor "#C9A34E" "" . shorten 80 ,
  ppSep      = xmobarColor "#429942" "" " | "
}

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    [ ((modm,               xK_Return), spawn $ XMonad.terminal conf)
    , ((modm,               xK_r     ), spawn "dmenu_run")
    , ((modm .|. shiftMask, xK_c     ), kill)
    , ((modm,               xK_space ), sendMessage NextLayout)
    , ((mod1Mask,           xK_Tab   ), windows W.focusDown)
    , ((modm,               xK_Left  ), windows W.swapDown  )
    , ((modm,               xK_Right ), windows W.swapUp    )
    , ((modm,               xK_t     ), spawn "tp-toggle")
    , ((modm,               xK_b     ), spawn "firefox")
    , ((modm,               xK_l     ), spawn "lockit")
    , ((modm,               xK_e     ), spawn "pcmanfm")
    , ((modm,               xK_n     ), spawn "leafpad")
    -- , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    , ((modm .|. shiftMask, xK_r     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++

    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_5]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster))
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster))
    ]
------------------------------------------------------------------------
-- Layouts:
myLayout = tiled ||| Mirror tiled ||| Full
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

------------------------------------------------------------------------
-- Event handling
myEventHook = ewmhDesktopsEventHook

------------------------------------------------------------------------
-- Status bars and logging
------------------------------------------------------------------------
-- Startup hook
myStartupHook = ewmhDesktopsStartup
------------------------------------------------------------------------

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/.xmobarrc"
  xmonad defaultConfig {

        manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig,
        layoutHook = avoidStruts $ layoutHook defaultConfig,

      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        -- layoutHook         = myLayout,
        -- manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        startupHook        = myStartupHook,

       -- to show workspace and current window in xmobar
       logHook = dynamicLogWithPP xmobarPP {
         ppOutput = hPutStrLn xmproc,
         ppTitle = xmobarColor "blue" "" . shorten 50,
         ppLayout = const ""
       }

       -- logHook = ewmhDesktopsLogHook

    }
