--- STEAMODDED HEADER
--- MOD_NAME: Swaglandia Balatro - Playing Cards
--- MOD_ID: swaglatrocards
--- PREFIX: swagtro_c
--- MOD_AUTHOR: [Robely]
--- MOD_DESCRIPTION: Adds card and Joker retextures! Art by Robely, mod managed by MulliganMayhem
--- PRIORITY: -349
--- BADGE_COLOR: 24d91f
--- DISPLAY_NAME: Swaglandia Balatro
--- VERSION: 1.0.0
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-0812d, malverk]

----------------------------------------------
------------MOD CODE -------------------------

local atlas_key = 'swagtro_c'

local atlas_path_hc = 'swaglandia_highcontrast.png' --high contrast
local atlas_path = 'swaglandia_normal.png' --default contrast

local enhancers_path = 'Swaglatro_enhancers.png'

local suits = {'hearts', 'clubs', 'diamonds', 'spades'}
local ranks = {"2","3","4","5","6","7","8","9","10","Jack","Queen","King","Ace"} --what ranks to change and display on the card variant screen
local ranks_full = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'}
local ranks_num = {'Ace', '2', '3','4', '5', '6', '7', '8', '9', '10'}
local ranks_face = {'Jack', 'Queen', 'King'}
local display_ranks = {'Ace', 'King', 'Queen', 'Jack', '10'}

local description = 'Swaglatro' -- English-language description, also used as default


--
-----------------------------------------------------------
-- You should only need to change things above this line --
-----------------------------------------------------------

SMODS.Atlas{  
    key = atlas_key..'_lc',
    px = 71,
    py = 95,
    path = atlas_path,
    prefix_config = {key = false}, -- See end of file for notes
}

if atlas_path_hc then
    SMODS.Atlas{  
        key = atlas_key..'_hc',
        px = 71,
        py = 95,
        path = atlas_path_hc,
        prefix_config = {key = false}, -- See end of file for notes
    }
end

for _, suit in ipairs(suits) do
    SMODS.DeckSkin{
        key = suit.."_skin",
        suit = suit:gsub("^%l", string.upper),
        ranks = ranks,
        lc_atlas = atlas_key..'_lc',
        hc_atlas = (atlas_path_hc and atlas_key..'_hc') or atlas_key..'_lc',
        loc_txt = {
            ['en-us'] = description
        },
        posStyle = 'deck'
    }
end

SMODS.Atlas {
    key = "modicon",
    path = "modicon.png",
    px = 34,
    py = 34
}

SMODS.Atlas{
    key = 'ui_1',
    path = 'ui_assets.png',
    px = 18,
    py = 18,
    prefix_config = { key = false }
}

SMODS.Atlas{
    key = 'ui_2',
    path = 'ui_assets_opt2.png',
    px = 18,
    py = 18,
    prefix_config = { key = false }
}

-- Notes:

-- The current version of Steamodded has a bug with prefixes in mods including `DeckSkin`s.
-- By manually including the prefix in the atlas' key, this should keep the mod functional
-- even after this bug is fixed.
