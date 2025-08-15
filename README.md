# Info
This repository uses the [Complete FireRed Upgrade](https://github.com/Skeli789/Complete-Fire-Red-Upgrade) build system to dynamically insert songs into your `BPRE0.gba` ROM.
Thanks to Shiny Miner for his [porting template](https://github.com/Shiny-Miner/Porting-template) on which this repository is based on.

## Prerequisites
- devKitPro, or more specifically, devKitARM, which can be downloaded here: [Download](https://github.com/devkitPro/installer/releases). Install the program in `C:\`
- [Python 3.7.6](https://www.python.org/downloads/release/python-376/)
- Detailed instructions are provided in Skeli's original CFRU repository (link above).

## Configuration and Build
- Put your desired `.mid` file in `audio/songs`
- Create a `.txt` file with the same name as your midi in the same folder, with `_flags` at the end of the name. For example, if my `.mid` file is `route_201.mid`, my `.txt` file would be `route_201_flags.txt`.
- Paste this in your `.txt` file: `-V XXX -G 0xYYYYYYY`. Replace `XXX` with the desired volume (generally 127). Replace `YYYYYYY` with your voicegroup offset. An example for my `.mid`: `-V 127 -G 0x8B30C5C`. The offset I used is the voicegroup offset of the [All Instruments Patch for FireRed](https://www.pokecommunity.com/threads/all-instrument-patch-firered-ruby-emerald.332272/).
- Open `songs` in the root folder and add entries in this format: `songid_to_replace midi_filename`. For example: `300 route_201`
- Rename your ROM `BPRE0.gba` and paste it on the root folder.
- Run `python scripts//make.py` to generate the required `test.gba` file. If you need to change the song/edit the voicegroup, etc. simply run `python scripts//clean.py all` and then recompile using the `make.py` command mentioned earlier. No need to worry about repointing!
- An example `.mid` file and required edits have been provided to help with insertion. Just follow the same steps!

## Additional Info
- In `scripts/make.py` and `scripts/insert.py`, you'll see an `OFFSET_TO_PUT` variable at the top of the file. Modify that to change where the songs would be inserted.
- Additionally, set `SEARCH_FREE_SPACE` in `make.py` to `False` if do not want the repo to search for free space while inserting the songs. Though, it is better to keep that option as `True`.
- Use the All Instruments Patch mentioned above for easier insertion. This way, you won't have to worry about searching voicegroups for every song.

### Credits

- Blurose for this template he took out from CFRU and Greenphx for his code.
- Skeli made the [build system used in the CFRU](https://github.com/Skeli789/Complete-Fire-Red-Upgrade) which is used here.
- Shiny Miner for the actual porting template on which this repository is based on.
