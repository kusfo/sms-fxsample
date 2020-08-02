#include "../libraries/SMSlib.h"
#include "fxsample.h"
#include "bank1.h"

const unsigned char psgInit[] =
{
	0x9F, 0xBF, 0xDF, 0xFF, 0x81, 0x00, 0xA1, 0x00, 0x00, 0xC1, 0x00
};



void main()
{
	SMS_init();
	
	SMS_loadBGPalette(sega_palette_bin);
	UNSAFE_SMS_loadZX7compressedTiles(sega_tiles_zx7, 0);
	SMS_loadSTMcompressedTileMap(0, 0, sega_tilemap_stmcompr);

	SMS_displayOn();

	initPSG(psgInit);
	PlaySample(sega_8000_pcmenc);

	for (;;)
	{
		SMS_waitForVBlank();
	}
}

SMS_EMBED_SEGA_ROM_HEADER(9999, 0);
