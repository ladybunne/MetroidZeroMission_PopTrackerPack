# Metroid: Zero Mission - PopTracker Pack

This is a [PopTracker](https://github.com/black-sliver/PopTracker) pack for Metroid: Zero Mission! It's designed to be used with [the Archipelago randomiser for Metroid: Zero Mission](https://github.com/lilDavid/Archipelago-Metroid-Zero-Mission), which itself depends on [Archipelago](https://github.com/ArchipelagoMW/Archipelago).

If you have any issues or problems with this pack, feel free to [make an issue](https://github.com/ladybunne/MetroidZeroMission_PopTrackerPack/issues/new) on this repo, or otherwise come find me on Discord (I'm Ladybunne there too). I frequent the Zero Mission thread in the main AP server, which would be the best place for discussions; otherwise you can DM me.


### What is this?

This project is a "PopTracker pack", a collection of maps and scripts that can be used with [PopTracker](https://github.com/black-sliver/PopTracker).

PopTracker is an external game tracking program, popular in randomiser communities, that uses packs like this one to track individual games. It's free, open-source and looks something like this:

![image](https://github.com/user-attachments/assets/1b6d25ec-2480-4d42-955d-14937d70281c)

To use this pack, you will need to do the following:
- Download [PopTracker](https://github.com/black-sliver/PopTracker) and put it somewhere on your computer. As an example, mine's at `C:\Users\Ladybunne\Games\PopTracker`.
- Go to the [latest release](https://github.com/ladybunne/MetroidZeroMission_PopTrackerPack/releases) of this pack, download the .zip file under Assets, and place it in a folder called `packs` inside your PopTracker directory.
- Open PopTracker and select the pack, then pick one of the variants:
    - Standard has items on the bottom.
    - Items on Left is self-explanatory.
    - Map Only hides the item dock entirely.
    - Item Tracker hides the map.

You can freely swap between variants at any time by clicking the Load Pack button up the top left.


### How does this pack work?

Currently this pack offers manual and Archipelago-driven auto-tracking. In the future it will likely include [UAT](https://github.com/black-sliver/UAT) as an alternative to AP.

Once loaded within PopTracker, to connect to Archipelago for auto-tracking, click the little AP icon up the top left, then enter your slot's details. If there's no issues, it will connect and start auto-tracking.

Items and locations will be automatically updated as you play. The options for your slot can be seen in the options popup, found up the top left near the AP icon (it looks like a hamburger with a settings cog).

Map locations will have a colour to indicate the logical state of any checks at that location:
- Green is "in logic", meaning that with your settings and items, you are expected to be able to do that check.
- Red is "out of logic", meaning that you don't have what you need to get it. You might still be able to by using tricks the tracker isn't aware of.
- Yellow is "out of logic accessible", meaning it's not in logic (like red), but there's some method the tracker knows about that could be used to get it.
- Blue is "scoutable", meaning you can reach the place where the check is found and visually see what's in that location, but can't obtain it. This is useful for several reasons: you could make note of something important found there, or mark it off on the tracker if you see it's something worthless.

You can watch logic update in real-time as you get more items, or you can click on the items themselves in the item tracker to mark them off manually (or to see what logic would be like if you had them).

For any further questions about PopTracker, feel free to reach out to folks in the [PopTracker Discord community](https://discord.com/invite/gwThqMCPgK). (I'm not affiliated with that server and don't claim any responsibility for things that happen there.)

### Credits

Metroid: Zero Mission was made by Nintendo in 2004.

The apworld for Metroid: Zero Mission is currently in development, by lil David and Noise.


### Assets

Some item and map sprites from the game are sourced by PaperKoopa. Others were sourced by me.

I also produced several original assets for the pack.

The Archipelago logo is sourced from the Archipelago asset pack.
