.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global EventScript_PalletTown_FatGuy

EventScript_PalletTown_FatGuy:
    lock
    faceplayer

    setflag 0x15FF @ Set Achievement Menu

    setflag 0x1600 @ Achievement 1
    setflag 0x1601 @ Achievement 2
    setflag 0x1602 @ Achievement 3
    setflag 0x1603 @ Achievement 4
    @setflag 0x1604 @ Achievement 5
    setflag 0x1605 @ Achievement 6
    setflag 0x1606 @ Achievement 7
    @setflag 0x1607 @ Achievement 8
    setflag 0x1608 @ Achievement 9
    setflag 0x1609 @ Achievement 10

    msgbox gText_AchievementMenuFlagSet MSG_FACE
    release
    end
