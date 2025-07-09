-- RANKS --

-- hey i think that maybe this is a stupid idea for a rank
-- SMODS.Rank {
--     key = 'nan',
-- 	card_key = 'n',
--     nominal = 0 / 0,
-- 	pos = { x = -1 },
-- 	loc_txt = {
-- 		['en-us'] = {
-- 			name = 'nan',
-- 		}
-- 	},
-- }

-- this too
-- SMODS.Rank {
--     key = 'Huge',
-- 	card_key = 'H',
--     nominal = math.huge,
-- 	pos = { x = -1 },
-- 	loc_txt = {
-- 		['en-us'] = {
-- 			name = 'Huge',
-- 		}
-- 	},
-- }

SMODS.Rank {
	key = '0',
    card_key = '0',
	shorthand = '0',
    nominal = 1,
	lc_atlas = 'cfawm_0_rank_cards',
	hc_atlas = 'cfawm_0_rank_hc_cards',
    pos = { x = 0 },
	next = {
        '2',
		'Ace'
    },
	strength_effect = { random = true },
	suit_map = { Hearts = 0, Clubs = 1, Diamonds = 2, Spades = 3, cfawm_Triangles = 4 },
}

SMODS.Rank {
	key = 'Peasant',
    card_key = 'P',
	shorthand = 'P',
    nominal = 2,
	face_nominal = 0.8,
	lc_atlas = 'cfawm_0_rank_cards',
	hc_atlas = 'cfawm_0_rank_hc_cards',
	next = {
        '3',
		'Jack'
    },
	strength_effect = { fixed = 2 },
	face = true,
	pos = { x = 1 },
	suit_map = { Hearts = 0, Clubs = 1, Diamonds = 2, Spades = 3, cfawm_Triangles = 4 },
}
