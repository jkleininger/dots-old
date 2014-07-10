/* See LICENSE file for copyright and license details. */

/* appearance */
static const char font[]            = "-*-dina-medium-r-*-*-8-*-*-*-*-*-*-*";

/* default colors?
static const char normbordercolor[] = "#001015";
static const char normbgcolor[]     = "#222222";
static const char normfgcolor[]     = "#bbbbbb";
static const char selbordercolor[]  = "#0044ee";
static const char selbgcolor[]      = "#005577";
static const char selfgcolor[]      = "#eeeeee";
*/

static const char normbordercolor[] = "#2D2D2D";
static const char normbgcolor[]     = "#2D2D2D";
static const char normfgcolor[]     = "#CCCCCC";
static const char selbordercolor[]  = "#CCCCCC";
static const char selbgcolor[]      = "#4C4C4C";
static const char selfgcolor[]      = "#CCCCCC";

static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = True;     /* False means bottom bar */

/* tagging */
static const char *tags[] = { "www", "term", "dev", "x", "file", "pass" };

static const Rule rules[] = {
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",        NULL,       NULL,       0,            True,        -1 },
        { "Firefox",     NULL,       NULL,       1,            False,       -1 },
        { "Roxterm",     NULL,       NULL,       2,            False,       -1 },
        { "Sakura",      NULL,       NULL,       2,            False,       -1 },
        { "st-256color", NULL,       NULL,       1<<1,         False,       -1 },
        { "Pcmanfm",     NULL,       NULL,       1<<4,         False,       -1 },
        { "Obshutdown",  NULL,       NULL,       0,            True,        -1 },
        { "CMST",        NULL,       NULL,       0,            True,        -1 },
        { "NetBeans",    NULL,       NULL,       1<<2,         True,        -1 },
        { "KeePass2",    NULL,       NULL,       1<<5,         True,        -1 },
        { "Claws-mail",  NULL,       NULL,       0,            True,        -1 },
        { "Pidgin",      NULL,       NULL,       0,            True,        -1 },
};

/* layout(s) */
static const float mfact      = 0.5;  /* factor of master area size [0.05..0.95] */
static const int nmaster      = 1;    /* number of clients in master area */
static const Bool resizehints = True; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
  /* symbol     arrange function */
  { "[|]",      tile },    /* first entry is default */
  { "[F]",      NULL },    /* no layout function means floating behavior */
  { "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[]      = { "dmenu_run", "-m", dmenumon, "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]       = { "st",              NULL };
static const char *ffcmd[]         = { "firefox",         NULL };
static const char *tptogcmd[]      = { "tp-toggle",       NULL };
static const char *lockcmd[]       = { "lockit",          NULL };
static const char *filecmd[]       = { "pcmanfm",         NULL };
static const char *pwrcmd[]        = { "obshutdown",      NULL };
static const char *cmstcmd[]       = { "cmst", "-d",      NULL };
static const char *sakuracmd[]     = { "sakura",          NULL };
static const char *anamcmd[]       = { "anamnesis", "-b", NULL };

static Key keys[] = {
	/* modifier                     key          function        argument */
	{ MODKEY,                       XK_r,        spawn,          {.v = dmenucmd  } },
	{ MODKEY,                       XK_Return,   spawn,          {.v = sakuracmd } },
	{ MODKEY,                       XK_b,        spawn,          {.v = ffcmd     } },
	{ MODKEY,                       XK_w,        spawn,          {.v = cmstcmd   } },
        { MODKEY,                       XK_c,        spawn,          {.v = anamcmd   } },

        { MODKEY,                       XK_t,        spawn,          {.v = tptogcmd  } },
        { MODKEY,                       XK_l,        spawn,          {.v = lockcmd   } },
        { MODKEY,                       XK_e,        spawn,          {.v = filecmd   } },

        { MODKEY|ShiftMask,             XK_q,        spawn,          {.v = pwrcmd    } },

	{ MODKEY|ShiftMask,             XK_b,        togglebar,      {0} },
        { Mod1Mask,                     XK_Tab,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_Up,       incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_Down,     incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_Left,     setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_Right,    setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return,   zoom,           {0} },
	{ Mod1Mask,                     XK_F4,       killclient,     {0} },
	{ Mod1Mask,                     XK_1,        setlayout,      {.v = &layouts[0]} },
	{ Mod1Mask,                     XK_2,        setlayout,      {.v = &layouts[1]} },
	{ Mod1Mask,                     XK_3,        setlayout,      {.v = &layouts[2]} },
	{ MODKEY|ShiftMask,             XK_space,    togglefloating, {0} },
	{ MODKEY,                       XK_0,        view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,        tag,            {.ui = ~0 } },
	TAGKEYS(                        XK_1,                        0)
	TAGKEYS(                        XK_2,                        1)
	TAGKEYS(                        XK_3,                        2)
	TAGKEYS(                        XK_4,                        3)
	TAGKEYS(                        XK_5,                        4)
	TAGKEYS(                        XK_6,                        5)
	{ MODKEY|ShiftMask,             XK_r,        quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

