
//{{BLOCK(Trophy)

//======================================================================
//
//	Trophy, 256x32@4, 
//	+ palette 16 entries, not compressed
//	+ 14 tiles (t|f|p reduced) lz77 compressed
//	+ regular map (flat), lz77 compressed, 32x4 
//	Total size: 32 + 344 + 68 = 444
//
//	Time-stamp: 2025-10-23, 02:05:18
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.6
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TROPHY_H
#define GRIT_TROPHY_H

#define TrophyTilesLen 344
extern const unsigned char TrophyTiles[344];

#define TrophyMapLen 68
extern const unsigned short TrophyMap[34];

#define TrophyPalLen 32
extern const unsigned char TrophyPal[32];

#endif // GRIT_TROPHY_H

//}}BLOCK(Trophy)
