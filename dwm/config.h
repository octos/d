/* See LICENSE file for copyright and license details. */

/* appearance */
//static const char font[]            = "-*-stlarch-medium-r-*-*-10-*-*-*-*-*-*-*" "," "-*-profont-*-*-*-*-11-*-*-*-*-*-*-*";
static const char font[]            = "-*-profont-*-*-*-*-11-*-*-*-*-*-*-*"; 
static const char normbordercolor[] = "#444";
static const char normbgcolor[]     = "#000";
static const char normfgcolor[]     = "#999";
static const char selbordercolor[]  = "#9c0";
static const char selbgcolor[]      = "#222";
static const char selfgcolor[]      = "#ccc";
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = True;     /* False means bottom bar */

/* tagging */
static const char *tags[] = { "a", "b", "c", "d" };

static const Rule rules[] = {
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Qjackctl", NULL,       NULL,       0,            True,        -1 },
/*	{ "sxiv",     NULL,       NULL,       1 << 8,       True,        -1 },*/
};

/* layout(s) */
static const float mfact      = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster      = 1;    /* number of clients in master area */
static const Bool resizehints = False; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "+",      tile },    /* first entry is default */
	{ "-",      NULL },    /* no layout function means floating behavior */
	{ "M",      monocle },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */ 
static const char term[]  = "urxvtc";
static const char *kbdlayout[]  = { "/home/kv/d/layout.sh", NULL };
static const char *ar[]  = { "setxkbmap", "ara", "buckwalter", NULL };
static const char *chr[] = { "setxkbmap", "us", "chr", NULL };
static const char *el[]  = { "setxkbmap", "gr", NULL };
static const char *he[]  = { "setxkbmap", "il", "phonetic", NULL };
static const char *hy[]  = { "setxkbmap", "am", "eastern", NULL };
static const char *iu[]  = { "setxkbmap", "iu", NULL };
static const char *ka[]  = { "setxkbmap", "ge", NULL };
static const char *ru[]  = { "setxkbmap", "ru", "phonetic", NULL };
static const char *clmk[]= { "setxkbmap", "us", "colemak", NULL };
static const char *us[]  = { "setxkbmap", "us", "altgr-intl", NULL };
static const char *pomo[]  = { "/home/kv/d/pomi.sh", NULL };
static const char *screensus[]  = { "xset", "dpms", "force", "suspend", NULL };
//static const char *screenoff[]  = { "xset", "dpms", "force", "off", NULL };
static const char *screenoff[]  = { "/home/kv/d/monoff.sh", NULL };
static const char *suspend[]  = { "systemctl", "suspend", NULL };
static const char *print[] = { "/home/kv/d/print.sh",  NULL };
static const char *redwm[] = { "/home/kv/d/dwm/redwm.sh",  NULL };
static const char *gtrans[] = { "/home/kv/d/gtrans.sh",  NULL };
static const char *colorgb[] = { "/home/kv/d/colorgb.sh",  NULL };
static const char *slock[]  = { "slock", NULL };
static const char *dwb[]  = { "dwb", NULL };
static const char *yt[]  = { term, "-e", "youtube-viewer", "-C", NULL };
static const char *htop[]  = { term, "-e", "htop", NULL };
static const char *irssi[]  = { term, "-e", "irssi", NULL };
static const char *mutt[]  = { term, "-e", "mutt", NULL };
static const char *ranger[]  = { term, "-e", "ranger", NULL };
static const char *vim[]  = { term, "-e", "vim", NULL };
static const char *vol0[]  = { "amixer", "-q", "set", "Master", "toggle",  NULL };
static const char *vol1[] = { "amixer", "-q", "set", "Master", "5dB-",  NULL };
static const char *vol2[]  = { "amixer", "-q", "set", "Master", "5dB+",  NULL };
static const char *dunst[] = { "/home/kv/d/dunst-set.sh",  NULL };
static const char *toggle[] = { "/home/kv/d/toggle.sh", "redshift", "-l", "45.424807:-75.699234", NULL };
static const char *bar[] = { "/home/kv/d/xsetroot-set.sh",  NULL };
static const char *termcmd[]  = { term, NULL };
static const char *dmenucmd[] = { "dmenu_run", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY|ShiftMask,             XK_p,     spawn,          {.v = print }},
// layouts
	{ MODKEY|ShiftMask,             XK_F12,   spawn,          {.v = us } }, //universal revert to latn
	{ MODKEY|ShiftMask,             XK_F12,   spawn,          {.v = bar } },
	{ MODKEY|ShiftMask,             XK_a,     spawn,          {.v = ar }},
	{ MODKEY|ShiftMask,             XK_a,     spawn,          {.v = bar }},
	{ MODKEY|ShiftMask,             XK_g,     spawn,          {.v = el }},
	{ MODKEY|ShiftMask,             XK_g,     spawn,          {.v = bar }},
	{ MODKEY|ShiftMask,             XK_c,     spawn,          {.v = ru }},
	{ MODKEY|ShiftMask,             XK_c,     spawn,          {.v = bar }},
	{ MODKEY|ShiftMask,             XK_h,     spawn,          {.v = he }},
	{ MODKEY|ShiftMask,             XK_h,     spawn,          {.v = bar }},
	{ MODKEY|ShiftMask,             XK_k,     spawn,          {.v = clmk }},
	{ MODKEY|ShiftMask,             XK_k,     spawn,          {.v = bar }},
	{ MODKEY|ShiftMask,             XK_m,     spawn,          {.v = ka }},
	{ MODKEY|ShiftMask,             XK_m,     spawn,          {.v = bar }},
	{ MODKEY|ShiftMask,             XK_q,     spawn,          {.v = chr }},
	{ MODKEY|ShiftMask,             XK_q,     spawn,          {.v = bar }},
	{ MODKEY|ShiftMask,             XK_s,     spawn,          {.v = iu }},
	{ MODKEY|ShiftMask,             XK_s,     spawn,          {.v = bar }},
	{ MODKEY|ShiftMask,             XK_y,     spawn,          {.v = hy }},
	{ MODKEY|ShiftMask,             XK_y,     spawn,          {.v = bar }},
	{ MODKEY|ShiftMask, /* clmk */  XK_i,     spawn,          {.v = us }},
	{ MODKEY|ShiftMask,             XK_i,     spawn,          {.v = bar }},
	{ MODKEY|ShiftMask, XK_Cyrillic_ka,       spawn,          {.v = clmk }},
	{ MODKEY|ShiftMask, XK_Cyrillic_ka,       spawn,          {.v = bar }},
    { MODKEY|ShiftMask, XK_Cyrillic_el,       spawn,          {.v = us }},
	{ MODKEY|ShiftMask, XK_Cyrillic_el,       spawn,          {.v = bar }},
	{ MODKEY|ShiftMask, XK_Cyrillic_em,       spawn,          {.v = ka }},
	{ MODKEY|ShiftMask, XK_Cyrillic_em,       spawn,          {.v = bar }},
	{ MODKEY|ShiftMask, XK_Greek_kappa,       spawn,          {.v = clmk }},
	{ MODKEY|ShiftMask, XK_Greek_kappa,       spawn,          {.v = bar }},
	{ MODKEY|ShiftMask, XK_Greek_lamda,       spawn,          {.v = us }},
	{ MODKEY|ShiftMask, XK_Greek_lamda,       spawn,          {.v = bar }},
	{ MODKEY|ShiftMask, XK_Georgian_kan,      spawn,          {.v = clmk }},
	{ MODKEY|ShiftMask, XK_Georgian_kan,      spawn,          {.v = bar }},
	{ MODKEY|ShiftMask, XK_Georgian_las,      spawn,          {.v = us }},
	{ MODKEY|ShiftMask, XK_Georgian_las,      spawn,          {.v = bar }},
	{ MODKEY|ShiftMask, XK_Georgian_can,      spawn,          {.v = ru }},
	{ MODKEY|ShiftMask, XK_Georgian_can,      spawn,          {.v = bar }},
	{ MODKEY|ShiftMask,             XK_z,     spawn,          {.v = kbdlayout }},
	{ MODKEY|ShiftMask,             XK_r,     spawn,          {.v = redwm }},
	{ MODKEY|ShiftMask,             XK_t,     spawn,          {.v = gtrans }},
	{ MODKEY|ShiftMask,             XK_w,     spawn,          {.v = colorgb }},
	{ MODKEY,          /* f-keys */ XK_Escape,spawn,          {.v = us } },
	{ MODKEY,                       XK_Escape,spawn,          {.v = suspend } },
	{ MODKEY|ShiftMask,             XK_Escape,spawn,          {.v = us } },
	{ MODKEY|ShiftMask,             XK_Escape,spawn,          {.v = slock } },
	{ MODKEY|ShiftMask,             XK_Escape,spawn,          {.v = suspend } },
	{ MODKEY|ShiftMask,             XK_F1,     spawn,         {.v = pomo } },
	{ MODKEY|ShiftMask,             XK_F3,     spawn,          SHCMD("import -window root \"$(date +%y%m%d-%H%M%S)\"_full.png") },
	{ MODKEY|ShiftMask,             XK_F4,     spawn,          SHCMD("import \"$(date +%y%m%d-%H%M%S)\"_slct.png") },
	{ MODKEY,                       XK_F5,     spawn,          {.v = toggle } },
	{ MODKEY,                       XK_F5,     spawn,          {.v = bar } },
	{ MODKEY|ShiftMask,             XK_F5,     spawn,          {.v = dunst } },
	{ MODKEY,                       XK_F10,    spawn,          {.v = vol0 } },
    { MODKEY,                       XK_F10,    spawn,          {.v = bar } },
	{ MODKEY,                       XK_F11,    spawn,          {.v = vol1 } },
    { MODKEY,                       XK_F11,    spawn,          {.v = bar } },
    { MODKEY,                       XK_F12,    spawn,          {.v = vol2 } },
    { MODKEY,                       XK_F12,    spawn,          {.v = bar } },
	{ MODKEY,            /* apps */ XK_a,      spawn,          {.v = ranger } },
	{ MODKEY,                       XK_c,      spawn,          {.v = irssi } },
	{ MODKEY,                       XK_v,      spawn,          {.v = vim } },
	{ MODKEY,                       XK_w,      spawn,          {.v = dwb } },
	{ MODKEY,                       XK_x,      spawn,          {.v = htop } },
	{ MODKEY,                       XK_y,      spawn,          {.v = yt } },
	{ MODKEY,                       XK_z,      spawn,          {.v = mutt } },
        { MODKEY,       /* colmk */ XK_semicolon,      spawn,  {.v = dmenucmd } },
    	{ MODKEY,                   XK_n,      focusstack,     {.i = +1 } },
	    { MODKEY,                   XK_e,      focusstack,     {.i = -1 } },
	    { MODKEY,                   XK_u,      incnmaster,     {.i = +1 } },
	    { MODKEY,                   XK_s,      incnmaster,     {.i = -1 } },
	    { MODKEY,                   XK_o,      spawn,          {.v = yt } },
// conflict	    { MODKEY,                   XK_i,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,   /* org */ XK_Return, spawn,          {.v = termcmd } },
    { MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask|ControlMask,             XK_q,      quit,           {0} },
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
