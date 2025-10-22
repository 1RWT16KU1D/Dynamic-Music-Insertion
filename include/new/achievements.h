#pragma once

#include "../global.h"

// Achievement Menu Memory Data
#define sAchievementMenuPtr (*((struct AchievementMenu**) 0x203E038))

#define ACHIEVEMENTS_COUNT 10
#define BG_MAP_BYTES 0x800
#define ACHIEVEMENTS_PER_PAGE 7

#define VAR_ALBUM_SELECTED_MEMORY_IN_ALBUM 0x5100
#define VAR_ALBUM_SELECTED_MEMORY 0x5101
#define VAR_ALBUM_NORMAL_DISPLAYED_START_ID 0x5102

// Trophy Image Data
#define TROPHY_SPRITE_TAG 0x4000
#define TROPHY_SPRITE_PAL_TAG 0x4000
#define TROPHY_COORD_X 205
#define TROPHY_COORD_Y 95

// Flags
#define FLAG_SYS_DEXNAV 0x91E
#define FLAG_ACHIEVEMENT_MENU_SE_DONE 0x15FE
#define FLAG_ACHIEVEMENT_MENU_GET 0x15FF
#define FLAG_FIRST_ACHIEVEMENT 0x1600

// For start_menu.c
extern bool8 StartMenuAchievementMenuCallback(void);

enum AchievementMenu_Windows
{
    WIN_ACHIEVEMENTS_HEADER,
    WIN_ACHIEVEMENTS_MEMORY_NAME,
    WIN_ACHIEVEMENTS_MEMORY_DESC,
    WIN_ACHIEVEMENTS_ACHIEVEMENTS_COUNT,
    WIN_ACHIEVEMENTS_INSTRUCTIONS,
    WIN_MAX_COUNT
};

enum BGs
{
    BG_INTERFACE,
    BG_UNUSED,
    BG_UNUSED2,
    BG_BACKGROUND,
};

struct AchievementMenu
{
    // Image Data
    u16* bgMap;

    // Achievement Data
    bool8 unlocked[ACHIEVEMENTS_COUNT];

    // Tracker Data
    u8 selectedAchievement;
    u8 selectedAchievementInMenu; // Max of 7
    u8 displayedStartId; // Start ID for the displayed memories
    u8 achievementCount;
};

struct AchievementEntry
{
    u8 achievementIndex;
    const u8 *name;
    const u8 *desc;
};

/* ============= Color Data ============= */
static const struct TextColor sWhiteText =
{
	.bgColor = TEXT_COLOR_TRANSPARENT,
	.fgColor = TEXT_COLOR_WHITE,
	.shadowColor = TEXT_COLOR_DARK_GREY,
};

static const struct TextColor sBlackText =
{
	.bgColor = TEXT_COLOR_TRANSPARENT,
	.fgColor = TEXT_COLOR_DARK_GREY,
	.shadowColor = TEXT_COLOR_LIGHT_GREY,
};

/* ============= Image Data ============= */
extern const u8 AchievementsBGTiles[];
extern const u8 AchievementsBGMap[];
extern const u16 AchievementsBGPal[];

extern const u8 TrophyTiles[];
extern const u16 TrophyPal[];

/* ============= Text Declarations ============== */
extern const u8 gText_AchievementMenuHeader[];

// Achievement Names
extern const u8 gText_None[];
extern const u8 gText_Achievement_1[];
extern const u8 gText_Achievement_2[];
extern const u8 gText_Achievement_3[];
extern const u8 gText_Achievement_4[];
extern const u8 gText_Achievement_5[];
extern const u8 gText_Achievement_6[];
extern const u8 gText_Achievement_7[];
extern const u8 gText_Achievement_8[];
extern const u8 gText_Achievement_9[];
extern const u8 gText_Achievement_10[];

// Achievement Descriptions
extern const u8 gText_Desc_None[];
extern const u8 gText_AchievementDesc_1[];
extern const u8 gText_AchievementDesc_2[];
extern const u8 gText_AchievementDesc_3[];
extern const u8 gText_AchievementDesc_4[];
extern const u8 gText_AchievementDesc_5[];
extern const u8 gText_AchievementDesc_6[];
extern const u8 gText_AchievementDesc_7[];
extern const u8 gText_AchievementDesc_8[];
extern const u8 gText_AchievementDesc_9[];
extern const u8 gText_AchievementDesc_10[];

// Achievements unlocked
extern const u8 gText_AchievementsUnlocked[];
