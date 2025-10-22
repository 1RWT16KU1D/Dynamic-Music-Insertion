#include "../include/battle.h"
#include "../include/bg.h"
#include "../include/decompress.h"
#include "../include/event_data.h"
#include "../include/event_object_movement.h"
#include "../include/field_effect.h"
#include "../include/field_effect_helpers.h"
#include "../include/field_message_box.h"
#include "../include/field_player_avatar.h"
#include "../include/field_weather.h"
#include "../include/fieldmap.h"
#include "../include/gpu_regs.h"
#include "../include/string_util.h"
#include "../include/item_menu.h"
#include "../include/map_name_popup.h"
#include "../include/menu.h"
#include "../include/m4a.h"
#include "../include/main.h"
#include "../include/metatile_behavior.h"
#include "../include/new_menu_helpers.h"
#include "../include/overworld.h"
#include "../include/palette.h"
#include "../include/pokemon.h"
#include "../include/pokemon_icon.h"
#include "../include/random.h"
#include "../include/region_map.h"
#include "../include/scanline_effect.h"
#include "../include/script.h"
#include "../include/sound.h"
#include "../include/sprite.h"
#include "../include/start_menu.h"
#include "../include/text.h"
#include "../include/text_window.h"
#include "../include/window.h"
#include "../include/constants/songs.h"

#include "../include/new/achievements.h"
#include "../include/new/dns.h"
#include "../include/new/ram_locs.h"
#include "../include/new/Vanilla_functions.h"


// This file's functions
static void CommitWindow(u8 windowId);
static void CleanWindow(u8 windowId);
static void CleanWindows(void);
static void CommitWindows(void);
static void PrintGUIAchievementsItems(void);


// Defer copies: do 2 VBlanks per window to catch async printers finishing early
static u8 sWinNeedsCopy[WIN_MAX_COUNT];


static void RequestWindowCopy(u8 windowId)
{
    if (sWinNeedsCopy[windowId] < 2)
        sWinNeedsCopy[windowId] = 2;
}

static const struct BgTemplate sAchievementsBgTemplates[] =
{
    [BG_INTERFACE] =
    {
        .bg = BG_INTERFACE,
        .charBaseIndex = 0,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0,
    },
    [BG_UNUSED] =
    {
        .bg = BG_UNUSED,
        .charBaseIndex = 1,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0,
    },
    [BG_UNUSED2] =
    {
        .bg = BG_UNUSED2,
        .charBaseIndex = 2,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0,
    },
    [BG_BACKGROUND] =
    {
        .bg = BG_BACKGROUND,
        .charBaseIndex = 3,
        .mapBaseIndex = 28,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0,
    },
};

static const struct WindowTemplate sAchievementsWinTemplates[WIN_MAX_COUNT + 1] =
{
    [WIN_ACHIEVEMENTS_HEADER] =
    {
        .bg = BG_INTERFACE,
        .tilemapLeft = 23,
        .tilemapTop = 1,
        .width = 8,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 1,
    },
    [WIN_ACHIEVEMENTS_MEMORY_NAME] =
    {
        .bg = BG_INTERFACE,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 20,
        .height = 14,
        .paletteNum = 15,
        .baseBlock = 33,
    },
    [WIN_ACHIEVEMENTS_MEMORY_DESC] =
    {
        .bg = BG_INTERFACE,
        .tilemapLeft = 1,
        .tilemapTop = 15,
        .width = 30,
        .height = 6,
        .paletteNum = 15,
        .baseBlock = 313,
    },
    [WIN_ACHIEVEMENTS_ACHIEVEMENTS_COUNT] =
    {
        .bg = BG_INTERFACE,
        .tilemapLeft = 22,
        .tilemapTop = 5,
        .width = 8,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 493,
    },
    [WIN_ACHIEVEMENTS_INSTRUCTIONS] =
    {
        .bg = BG_INTERFACE,
        .tilemapLeft = 22,
        .tilemapTop = 10,
        .width = 8,
        .height = 5,
        .paletteNum = 15,
        .baseBlock = 525,
    },
    DUMMY_WIN_TEMPLATE,
};

// Achievement definitions
static const struct AchievementEntry sAchievementsTable[] =
{
    {0, gText_Achievement_1, gText_AchievementDesc_1},
    {1, gText_Achievement_2, gText_AchievementDesc_2},
    {2, gText_Achievement_3, gText_AchievementDesc_3},
    {3, gText_Achievement_4, gText_AchievementDesc_4},
    {4, gText_Achievement_5, gText_AchievementDesc_5},
    {5, gText_Achievement_6, gText_AchievementDesc_6},
    {6, gText_Achievement_7, gText_AchievementDesc_7},
    {7, gText_Achievement_8, gText_AchievementDesc_8},
    {8, gText_Achievement_9, gText_AchievementDesc_9},
    {9, gText_Achievement_10, gText_AchievementDesc_10},
};

static void InitAchievementMenuData()
{
    const struct AchievementEntry *table = sAchievementsTable;
    u8 count = NELEMS(sAchievementsTable);

    sAchievementMenuPtr->achievementCount = count;

    for (u8 i = 0; i < count; i++)
    {
        u8 achievementIndex = table[i].achievementIndex;
        sAchievementMenuPtr->unlocked[i] = FlagGet(FLAG_FIRST_ACHIEVEMENT + achievementIndex) ? TRUE : FALSE;
    }
}

static void DisplayAchievementsBG(void)
{
    if (!FlagGet(FLAG_ACHIEVEMENT_MENU_SE_DONE))
    {
        PlaySE(SE_RG_CARD3);
        FlagSet(FLAG_ACHIEVEMENT_MENU_SE_DONE);
    }

    // Tiles
    decompress_and_copy_tile_data_to_vram(BG_BACKGROUND, AchievementsBGTiles, 0, 0, 0);

    // BGMap
    LZDecompressWram(AchievementsBGMap, sAchievementMenuPtr->bgMap);
    CopyBgTilemapBufferToVram(BG_BACKGROUND);

    // Palette
    LoadPalette(AchievementsBGPal, 0, 0x20);

    LoadMenuElementsPalette(12 * 0x10, 1);
    Menu_LoadStdPalAt(15 * 0x10);
}

static void PrintGUIAchievementsHeader(void)
{
    const u8* text = gText_AchievementMenuHeader;
    u8 fontSize = 1; // Normal text
    CleanWindow(WIN_ACHIEVEMENTS_HEADER);

    // Show message
    WindowPrint(WIN_ACHIEVEMENTS_HEADER, fontSize, 4, 0, &sWhiteText, 0, text);
    CommitWindow(WIN_ACHIEVEMENTS_HEADER);
}

static void PrintGUIAchievementsMemoryNames(void)
{
    u8 fontSize = 1; // Normal Text
    u8 y = 0;
    u8 startId = sAchievementMenuPtr->displayedStartId;
    const struct AchievementEntry *table = sAchievementsTable;

    CleanWindow(WIN_ACHIEVEMENTS_MEMORY_NAME);

    for (u8 i = 0; i < ACHIEVEMENTS_PER_PAGE && (startId + i) < sAchievementMenuPtr->achievementCount; ++i)
    {
        const u8 *name = sAchievementMenuPtr->unlocked[startId + i] ? table[startId + i].name : gText_None;
        WindowPrint(WIN_ACHIEVEMENTS_MEMORY_NAME, fontSize, 0, y, &sBlackText, 0, name);
        y += 16;
    }

    CommitWindow(WIN_ACHIEVEMENTS_MEMORY_NAME);
}

static void PrintGUIAchievementsDescription(void)
{
    u8 fontSize = 1;
    u8 x = 0;
    u8 y = 4;
    u8 memoryId = sAchievementMenuPtr->selectedAchievement;
    const struct AchievementEntry *table = sAchievementsTable;

    CleanWindow(WIN_ACHIEVEMENTS_MEMORY_DESC);
    const u8 *desc = sAchievementMenuPtr->unlocked[memoryId] ? table[memoryId].desc : gText_Desc_None;
    WindowPrint(WIN_ACHIEVEMENTS_MEMORY_DESC, fontSize, x, y, &sBlackText, 0, desc);
    CommitWindow(WIN_ACHIEVEMENTS_MEMORY_DESC);
}

static void PrintGUIAchievementsMemoriesUnlocked(void)
{
    u8 fontSize = 0; // Smaller text
    u8 unlocked = 0;

    // Count unlocked memories for the current page
    for (u8 i = 0; i < sAchievementMenuPtr->achievementCount; ++i)
        if (sAchievementMenuPtr->unlocked[i])
            unlocked++;

    CleanWindow(WIN_ACHIEVEMENTS_ACHIEVEMENTS_COUNT);

    u8 buff[12];
    u8 num[4];

    StringCopy(buff, gText_AchievementsUnlocked);
    ConvertIntToDecimalStringN(num, unlocked, STR_CONV_MODE_LEFT_ALIGN, 3);

    StringAppend(buff, num);
    WindowPrint(WIN_ACHIEVEMENTS_ACHIEVEMENTS_COUNT, fontSize, 3, 0, &sBlackText, 0, buff);

    CommitWindow(WIN_ACHIEVEMENTS_ACHIEVEMENTS_COUNT);
}

static void UpdateCursorHighlight(bool8 isKeyUp, bool8 isStartUp)
{
    const u16* romPal = AchievementsBGPal;
    u16* pal = gPlttBufferFaded;
    u16 defaultPal = romPal[7];

    // Change the palette
    u8 newIndex = sAchievementMenuPtr->selectedAchievementInMenu;
    u8 palId = newIndex + 7;

    // Restore previous highlighted palette
    if (!isStartUp)
    {
        if (isKeyUp)
            pal[palId + 1] = defaultPal;
        else
            pal[palId - 1] = defaultPal;
    }

    // Highlight selected cursor
    pal[palId] = RGB(25, 24, 29); // Turquoise Blue
}

static void ClearTasksAndGraphicalStructs(void)
{
    ScanlineEffect_Stop();
    ResetTasks();
    ResetSpriteData();
    ResetTempTileDataBuffers();
    ResetPaletteFade();
    FreeAllSpritePalettes();
}

static void ClearVramOamPlttRegs(void)
{
    DmaFill16(3, 0, VRAM, VRAM_SIZE);
    DmaFill32(3, 0, OAM, OAM_SIZE);
    DmaFill16(3, 0, PLTT, PLTT_SIZE);

    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_ON | DISPCNT_OBJ_1D_MAP);
    SetGpuReg(REG_OFFSET_BG3HOFS, 0);
    SetGpuReg(REG_OFFSET_BG3VOFS, 0);
    SetGpuReg(REG_OFFSET_BG2HOFS, 0);
    SetGpuReg(REG_OFFSET_BG2VOFS, 0);
    SetGpuReg(REG_OFFSET_BG1HOFS, 0);
    SetGpuReg(REG_OFFSET_BG1VOFS, 0);
    SetGpuReg(REG_OFFSET_BG0HOFS, 0);
    SetGpuReg(REG_OFFSET_BG0VOFS, 0);
}

static void VBlankCB_AchievementMenu(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();

    // Flush window gfx/map updates during VBlank
    for (u8 i = 0; i < WIN_MAX_COUNT; i++)
    {
        if (sWinNeedsCopy[i] != 0)
        {
            CopyWindowToVram(i, COPYWIN_BOTH);
            sWinNeedsCopy[i]--;
        }
    }

    CopyBgTilemapBufferToVram(BG_INTERFACE);
}

static void MainCB2_AchievementMenu(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void Task_AlbumFadeOut(u8 taskId)
{
    if (!gPaletteFade->active)
    {
        SetMainCallback2(CB2_ReturnToFieldWithOpenMenu);
        Free(sAchievementMenuPtr->bgMap);
        Free(sAchievementMenuPtr);
        sAchievementMenuPtr = NULL;
        VarSet(VAR_ALBUM_SELECTED_MEMORY, 0);
        VarSet(VAR_ALBUM_SELECTED_MEMORY_IN_ALBUM, 0);
        VarSet(VAR_ALBUM_NORMAL_DISPLAYED_START_ID, 0);
        FreeAllWindowBuffers();
        DestroyTask(taskId);
    }
}

static void Task_AlbumWaitForKeyPress(u8 taskId)
{
    bool8 scrolled = FALSE;
    bool8 redrawNames = FALSE;
    u8 prevStartId = sAchievementMenuPtr->displayedStartId;

    if (JOY_NEW_AND_REPEATED(DPAD_DOWN))
    {
        if (sAchievementMenuPtr->selectedAchievement < sAchievementMenuPtr->achievementCount - 1)
        {
            sAchievementMenuPtr->selectedAchievement++;

            if (sAchievementMenuPtr->selectedAchievementInMenu < ACHIEVEMENTS_PER_PAGE - 1 &&
                sAchievementMenuPtr->selectedAchievementInMenu < sAchievementMenuPtr->achievementCount - 1)
            {
                sAchievementMenuPtr->selectedAchievementInMenu++;
            }

            UpdateCursorHighlight(FALSE, FALSE);
            scrolled = TRUE;
        }
    }
    else if (JOY_NEW_AND_REPEATED(DPAD_UP))
    {
        if (sAchievementMenuPtr->selectedAchievement > 0)
        {
            sAchievementMenuPtr->selectedAchievement--;

            if (sAchievementMenuPtr->selectedAchievementInMenu > 0)
            {
                sAchievementMenuPtr->selectedAchievementInMenu--;
            }

            UpdateCursorHighlight(TRUE, FALSE);
            scrolled = TRUE;
        }
    }

    if (scrolled)
    {
        u8 newStartId = sAchievementMenuPtr->selectedAchievement - sAchievementMenuPtr->selectedAchievementInMenu;
        if (newStartId != prevStartId)
        {
            sAchievementMenuPtr->displayedStartId = newStartId;
            redrawNames = TRUE;
        }

        if (redrawNames)
            PrintGUIAchievementsMemoryNames();

        PrintGUIAchievementsDescription();
        PlaySE(SE_SELECT);
    }

    if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_PC_OFF);
        FlagClear(FLAG_ACHIEVEMENT_MENU_SE_DONE);
        VarSet(VAR_ALBUM_SELECTED_MEMORY, 0);
        VarSet(VAR_ALBUM_SELECTED_MEMORY_IN_ALBUM, 0);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        gTasks[taskId].func = Task_AlbumFadeOut;
    }
}

static void Task_AlbumFadeIn(u8 taskId)
{
    if (!gPaletteFade->active)
    {
        UpdateCursorHighlight(FALSE, TRUE);
        gTasks[taskId].func = Task_AlbumWaitForKeyPress;
    }
}

static void PrintGUIAchievementsItems(void)
{
    PrintGUIAchievementsHeader();
    PrintGUIAchievementsMemoryNames();
    PrintGUIAchievementsDescription();
    PrintGUIAchievementsMemoriesUnlocked();
}

static void InitAchievementMenu(void)
{
    // Remove glitches
    CleanWindows();
    CommitWindows();

    sAchievementMenuPtr->selectedAchievement = VarGet(VAR_ALBUM_SELECTED_MEMORY);
    sAchievementMenuPtr->selectedAchievementInMenu = VarGet(VAR_ALBUM_SELECTED_MEMORY_IN_ALBUM);
    sAchievementMenuPtr->displayedStartId = sAchievementMenuPtr->selectedAchievement
                                          - sAchievementMenuPtr->selectedAchievementInMenu;

    InitAchievementMenuData();
    PrintGUIAchievementsItems();
}

static void CB2_AchievementMenu(void)
{
    switch (gMain.state)
    {
        case 0:
            SetVBlankCallback(NULL);
            ClearVramOamPlttRegs();
            gMain.state++;
            break;
        case 1:
            ClearTasksAndGraphicalStructs();
            gMain.state++;
            break;
        case 2:
            sAchievementMenuPtr->bgMap = Calloc(BG_MAP_BYTES);
            ResetBgsAndClearDma3BusyFlags(0);
            InitBgsFromTemplates(0, sAchievementsBgTemplates, NELEMS(sAchievementsBgTemplates));
            SetBgTilemapBuffer(BG_BACKGROUND, sAchievementMenuPtr->bgMap);
            CopyBgTilemapBufferToVram(BG_INTERFACE);
            gMain.state++;
            break;
        case 3:
            DisplayAchievementsBG();
            gMain.state++;
            break;
        case 4:
            if (!free_temp_tile_data_buffers_if_possible())
            {
                ShowBg(BG_BACKGROUND);
                CopyBgTilemapBufferToVram(BG_BACKGROUND);
                gMain.state++;
            }
            break;
        case 5:
            InitWindows(sAchievementsWinTemplates);
            DeactivateAllTextPrinters();
            CopyBgTilemapBufferToVram(BG_INTERFACE);
            ShowBg(BG_INTERFACE);
            gMain.state++;
            break;
        case 6:
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
            gMain.state++;
            break;
        case 7:
            SetVBlankCallback(VBlankCB_AchievementMenu);

            // Reset deferred-copy flags on entry
            for (u8 i = 0; i < WIN_MAX_COUNT; i++)
                sWinNeedsCopy[i] = 0;

            InitAchievementMenu();
            CreateTask(Task_AlbumFadeIn, 0);
            SetMainCallback2(MainCB2_AchievementMenu);
            gMain.state = 0;
            break;
    }
}

bool8 StartMenuAchievementMenuCallback(void)
{
    if (!gPaletteFade->active)
    {
        CleanWindows();
        PlayRainStoppingSoundEffect();
        DestroySafariZoneStatsWindow();
        CleanupOverworldWindowsAndTilemaps();
        sAchievementMenuPtr = Calloc(sizeof(struct AchievementMenu));
        SetMainCallback2(CB2_AchievementMenu);
        return TRUE;
    }
    return FALSE;
}

extern void CleanWindow(u8 windowId)
{
	FillWindowPixelBuffer(windowId, PIXEL_FILL(0));
}

extern void CleanWindows(void)
{
	for (u8 i = 0; i < WIN_MAX_COUNT; ++i)
		CleanWindow(i);
}

extern void CommitWindow(u8 windowId)
{
	PutWindowTilemap(windowId);
	RequestWindowCopy(windowId);
}

static void CommitWindows(void)
{
    for (u8 i = 0; i < WIN_MAX_COUNT; ++i)
        CommitWindow(i);
}
