-- PATCHES --

-- ATLASES --

SMODS.Atlas {
    key = 'cfawm_cards',
    path = "cfawm_cards.png",
    px = 71,
	py = 95,
}
SMODS.Atlas {
    key = 'cfawm_cards_hc',
    path = "cfawm_cards_hc.png",
    px = 71,
	py = 95,
}


SMODS.Atlas {
	key = 'cfawm_enhancers',
	path = "cfawm_enhancers.png",
	px = 71,
	py = 95,
}

SMODS.Atlas {
	key = 'cfawm_0_rank_cards',
	path = "cfawm_0_rank_cards.png",
	px = 71,
	py = 95,
}
SMODS.Atlas {
	key = 'cfawm_0_rank_hc_cards',
	path = "cfawm_0_rank_hc_cards.png",
	px = 71,
	py = 95,
}

SMODS.Atlas {
	key = 'cfawm_ui',
	path = "cfawm_ui.png",
	px = 18,
	py = 18,
}

SMODS.Atlas {
	key = 'cfawm_planet_cards',
	path = "cfawm_planet_cards.png",
	px = 71,
	py = 95,
}

SMODS.Atlas {
	key = 'cfawm_backs',
	path = "cfawm_backs.png",
	px = 71,
	py = 95,
}

SMODS.Atlas({
    key = "modicon",
    path = "modicon.png",
    px = 32,
    py = 32
})

SMODS.Atlas {
	key = 'cfawm_jokers',
	path = "cfawm_jokers.png",
	px = 71,
	py = 95,
}

SMODS.Atlas {
	key = 'cfawm_tags',
	path = "cfawm_tags.png",
	px = 34,
	py = 34,
}

SMODS.Atlas {
	key = 'cfawm_tarots',
	path = "cfawm_tarots.png",
	px = 71,
	py = 95,
}

-- SUITS --

SMODS.Suit {
	key = 'Triangles',
	card_key = 'TRI',

	lc_atlas = 'cfawm_cards',
	hc_atlas = 'cfawm_cards_hc',
	lc_ui_atlas = 'cfawm_ui',
	hc_ui_atlas = 'cfawm_ui_hc',

	pos = { y = 0 },
	ui_pos = { x = 0, y = 0 },

	lc_colour = HEX('57912B'),
	hc_colour = HEX('74E353'),
}

-- RANKS --

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

-- SEALS --

-- waaaaa why did you have to be borken on me :(
-- SMODS.Seal {
-- 	key = 'Brown',
-- 	atlas = 'cfawm_enhancers',
-- 	pos = { x = 0, y = 0 },
-- 	badge_colour = HEX('a0522d'),
-- 	calculate = function(self, card, context)
-- 		if context.discard and context.other_card == card then
--             G.E_MANAGER:add_event(Event({
-- 				trigger = 'before',
--                 delay = 0.0,
-- 				func = function()
-- 					local any_selected = nil
-- 					local this_index = nil
-- 					for i, playing_card in ipairs(G.hand.cards) do
-- 						if playing_card == card then
-- 							this_index = i
-- 							break
-- 						end
-- 					end
-- 					if this_index and G.hand.cards[this_index + 1] then
-- 						G.hand:add_to_highlighted(G.hand.cards[this_index + 1], true)
-- 						play_sound('card1', 1)
-- 						any_selected = true
-- 					end
-- 					if any_selected then G.FUNCS.discard_cards_from_highlighted(nil, true) end
-- 					return true
-- 				end
-- 			}))
-- 			return { message = "Discarded!", colour = HEX('a0522d') }
-- 		end
-- 	end,
-- }

SMODS.Seal {
	key = 'Periwinkle',
	atlas = 'cfawm_enhancers',
	pos = { x = 1, y = 0 },
    badge_colour = HEX('CCCCFF'),
	loc_vars = function(self, info_queue, card)
		return { vars = { G.GAME.probabilities.normal, 5.0 } }
	end,
	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
            local ret = {}
			if pseudorandom('periwinkle_seal_gain') < G.GAME.probabilities.normal / 5.0 then
				if pseudorandom('periwinkle_seal_hand_or_discard') < 1 / 2.0 then
					ret.message = "+1 Hand!"
                    ret.colour = G.C.BLUE
					ease_hands_played(1)
                else
                    ret.message = "+1 Discard!"
					ret.colour = G.C.RED
					ease_discard(1)
				end
			end
			return ret
		end
	end,
}

SMODS.Seal {
	key = 'Cardboard',
	atlas = 'cfawm_enhancers',
	pos = { x = 2, y = 0 },
    badge_colour = HEX('BB7547'),
    loc_vars = function(self, info_queue, card)
		return { vars = { G.GAME.probabilities.normal, 3.0 } }
    end,
	-- Yes this adding the cards AFTER drawing is intentional.
	calculate = function(self, card, context)
		if context.discard and context.other_card == card then
            local ret = {}
            if pseudorandom('cardboard_seal_duplicate') < G.GAME.probabilities.normal / 3.0 then
				G.playing_card = (G.playing_card and G.playing_card + 1) or 1
				local copy_card = copy_card(card, nil, nil, G.playing_card)
                copy_card:add_to_deck()
				copy_card.states.visible = nil
                G.E_MANAGER:add_event(Event({
					blocking = false,
                    func = function()
						if G.STATE ~= G.STATES.SELECTING_HAND then
							return false
						end
						G.deck.config.card_limit = G.deck.config.card_limit + 1
						table.insert(G.playing_cards, copy_card)
						G.hand:emplace(copy_card)
                        G.E_MANAGER:add_event(Event({
							blocking = false,
                            func = function()
                                if G.STATE ~= G.STATES.SELECTING_HAND then
                                    return false
                                end
								copy_card:start_materialize()
								return true
							end
						}))
						return true
					end
				}))

				
				ret.message = localize('k_copied_ex')
				ret.colour = G.C.CHIPS
				ret.func = function() 
					G.E_MANAGER:add_event(Event({
						func = function()
							SMODS.calculate_context({ playing_card_added = true, cards = { copy_card } })
							return true
						end
					}))
				end
			end
			return ret
		end
	end,
}

-- POKER HAND PARTS --

SMODS.PokerHandPart {
	key = "funny",
	func = function(hand)
		if #hand < 5 then return {} end

		local required_ids = {6, 9, 4, 2, SMODS.Ranks['cfawm_0'].id}

		local found_ids = {}
		for _, card in ipairs(hand) do
			found_ids[card:get_id()] = card
		end

		for _, id in ipairs(required_ids) do
			if not found_ids[id] then
				return {}
			end
		end

		local positions = {}
		for _, global_card in ipairs(G.hand.cards) do
			local gid = global_card:get_id()
			if found_ids[gid] then
				positions[#positions + 1] = { id = gid, index = #positions + 1 }
			end
		end

		local last_index = -1
		for _, required_id in ipairs(required_ids) do
			for i, gcard in ipairs(G.hand.cards) do
				if gcard:get_id() == required_id then
					if i > last_index then
						last_index = i
						break
					else
						return {}
					end
				end
			end
		end

		local scored_cards = {}
		for _, id in ipairs(required_ids) do
			table.insert(scored_cards, found_ids[id])
		end

		return { scored_cards }
	end,
}

SMODS.PokerHandPart {
	key = "roundabout",
	func = function(hand)
		if #hand < 5 then return {} end

		local scored_cards = {}
		local suits_found = {}
		local unique_count = 0

		for _, card in ipairs(hand) do
            local suit = card.base.suit
			local special = false
            if SMODS.has_no_suit(card) then
                suit = ''
				special = true
            end
            if SMODS.has_any_suit(card) and card:can_calculate() then
                suit = 'wild'
				special = true
            end
            if suit and not suits_found[suit] then
				-- Check if a already found suit is smeared to be the same as the current card's suit (i hope this logic is correct...)
                for found_suit, _ in pairs(suits_found) do
                    if not special and SMODS.smeared_check(card, found_suit) then
						break
					end
				end
				suits_found[suit] = card
				unique_count = unique_count + 1
			end
		end

		if unique_count == #hand then
			for _, card in pairs(suits_found) do
				table.insert(scored_cards, card)
			end
			return { scored_cards }
		end

		return {}
	end,
}

-- POKER HANDS --

SMODS.PokerHand {
	key = "Funny",
	mult = 6.9,
	chips = 420,
	l_mult = 3,
	l_chips = 10,
	example = {
		{ 'cfawm_TRI_6', true },
		{ 'cfawm_TRI_9', true },
		{ 'D_4', true },
		{ 'D_2', true },
		{ 'H_cfawm_0', true }
	},
	evaluate = function(parts, hand)
		return parts.cfawm_funny
	end,
}

SMODS.PokerHand {
	key = "Roundabout",
	mult = 4,
	chips = 35,
	l_mult = 2,
	l_chips = 15,
	example = {
		{ 'S_5', true },
		{ 'cfawm_TRI_9', true },
		{ 'D_8', true },
		{ 'H_2', true },
		{ 'C_7', true }
	},
	evaluate = function(parts, hand)
		return parts.cfawm_roundabout
	end,
}

SMODS.PokerHand {
    key = "Rounda\' Five",
    visible = false,
    mult = 16,
    chips = 160,
    l_mult = 3,
    l_chips = 50,
    example = {
        { 'S_A', true },
        { 'cfawm_TRI_A', true },
        { 'D_A', true },
        { 'H_A', true },
        { 'C_A', true }
    },
    evaluate = function(parts, hand)
        if not next(parts._5) or not next(parts.cfawm_roundabout) then return {} end
        return { SMODS.merge_lists(parts._5, parts.cfawm_roundabout) }
    end
}

SMODS.PokerHand {
    key = "Rounda\' Funny",
    visible = false,
    mult = 22.9,
    chips = 420,
    l_mult = 3,
    l_chips = 10,
    example = {
        { 'S_6', true },
        { 'cfawm_TRI_9', true },
        { 'D_4', true },
        { 'H_2', true },
        { 'C_cfawm_0', true }
    },
    evaluate = function(parts, hand)
        if not next(parts.cfawm_funny) or not next(parts.cfawm_roundabout) then return {} end
        return { SMODS.merge_lists(parts.cfawm_funny, parts.cfawm_roundabout) }
    end
}

SMODS.PokerHand {
    key = "Rounda\' House",
    visible = false,
    mult = 14,
    chips = 140,
    l_mult = 4,
    l_chips = 40,
    example = {
        { 'S_7', true },
        { 'cfawm_TRI_7', true },
        { 'D_7', true },
        { 'H_4', true },
        { 'C_4', true }
    },
    evaluate = function(parts, hand)
        if #parts._3 < 1 or #parts._2 < 2 or not next(parts.cfawm_roundabout) then return {} end
        return { SMODS.merge_lists(parts._all_pairs, parts.cfawm_roundabout) }
    end
}

SMODS.PokerHand {
    key = "Funny Flush",
    visible = false,
    mult = 30,
    chips = 420,
    l_mult = 6.9,
    l_chips = 42,
    example = {
        { 'D_6', true },
        { 'D_9', true },
        { 'D_4', true },
        { 'D_2', true },
        { 'D_cfawm_0', true }
    },
    evaluate = function(parts, hand)
        if #parts.cfawm_funny or not next(parts._flush) then return {} end
        return { SMODS.merge_lists(parts.cfawm_funny, parts._flush) }
    end
}

-- CONSUMABLES --

-- CONSUMABLES: PLANETS --

SMODS.Consumable {
    key = "hd_189733b",
    set = "Planet",
    cost = 3,
	atlas = 'cfawm_planet_cards',
    pos = { x = 0, y = 0 },
    config = { hand_type = 'cfawm_Roundabout' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end
}

SMODS.Consumable {
    key = "wasp-12b",
    set = "Planet",
    cost = 5,
	atlas = 'cfawm_planet_cards',
    pos = { x = 1, y = 0 },
    config = { hand_type = 'cfawm_Funny' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end
}

-- SHADERS --

SMODS.Shader({ key = 'acetate', path = 'acetate.fs' })
SMODS.Shader({ key = 'unkempt', path = 'unkempt.fs' })

-- EDITIONS --

SMODS.Edition {
    key = 'acetate',
    shader = 'acetate',
    config = { extra = { score_passthrough = 0.5 } },
	--disable_shadow = true,
	disable_base_shader = true,
    in_shop = true,
    weight = 20,
    extra_cost = 3,
    sound = { sound = "negative", per = 2, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.extra.score_passthrough } }
    end,
    get_weight = function(self)
        return self.weight
    end,
	calculate = function(self, card, context)
		if (context.main_scoring and context.cardarea == G.play) or context.pre_joker then
            local passthrough = card.edition.extra.score_passthrough or 0
			local mult = math.ceil(mult * passthrough)
            local chips = math.ceil(hand_chips * passthrough)
			return {
                chips = chips,
				mult = mult
			}
		end
	end,
}

SMODS.Edition {
    key = 'unkempt',
    shader = 'unkempt',
    config = {  },
	--disable_shadow = true,
	disable_base_shader = true,
    in_shop = true,
    weight = 20,
    extra_cost = 2,
    sound = { sound = "negative", per = 0.5, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
    get_weight = function(self)
        return self.weight
    end,
}

-- ENHANCEMENTS --

-- +6 Mult for every turn this stays in your hand
SMODS.Enhancement {
    key = 'charged',
    atlas = 'cfawm_enhancers',
    pos = { x = 0, y = 1 },
    config = { extra = { mult_over_time = 3, current_mult_over_time = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_over_time, card.ability.extra.current_mult_over_time } }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                mult = card.ability.extra.current_mult_over_time
            }
        end
        if context.final_scoring_step and context.cardarea == G.hand then
            card.ability.extra.current_mult_over_time =
            card.ability.extra.current_mult_over_time + card.ability.extra.mult_over_time
            return {
                message = 'Upgrade!',
                colour = HEX('A681FF')
            }
        end
    end
}

-- Some sort of ehancment that swaps out the base chip scoring on a card for mult.

-- JOKERS --

-- x10 mult for each 0 card scored.

SMODS.Joker {
    key = "digit_joker",
    atlas = 'cfawm_jokers',
    pos = { x = 0, y = 0 },
    rarity = 3,
    blueprint_compat = true,
    cost = 8,
    config = { extra = { zero_x_mult = 10 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.zero_x_mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card:get_id() == SMODS.Ranks['cfawm_0'].id then
            return {
                x_mult = card.ability.extra.zero_x_mult
            }
        end
    end
}

-- DECKS/BACKS --

-- Kingdom Deck: Contains several face cards in place of the numbered cards
-- Brown Seal Deck: Oops! All Brown seals!
-- Acetate Deck: Oops! All Acetate Edition!

-- SMODS.Back {
--     key = "kingdom",
--     pos = { x = 0, y = 0 },
--     config = {  },
--     loc_vars = function(self, info_queue, back)
--         return { vars = { } }
--     end,
--     apply = function(self, back)
--         G.E_MANAGER:add_event(Event({
--             func = function()
--                 for _, card in pairs(G.playing_cards) do
-- 					local to_transform
--                     if card:get_id() then
--                         card:change_suit('Spades')
--                     end
--                 end
--                 return true
--             end
--         }))
--     end,
-- }

-- The seal this is tied to is currently broken, will add later if i ever figure that out.
-- SMODS.Back {
--     key = "brown_seal",
--     pos = { x = 0, y = 0 },
--     config = {},
--     atlas = 'cfawm_backs',
--     loc_vars = function(self, info_queue, back)
--         return { vars = { } }
--     end,
--     apply = function(self, back)
--         G.E_MANAGER:add_event(Event({
--             func = function()
--                 for _, card in pairs(G.playing_cards) do
-- 					card:set_seal('cfawm_Brown', true, true)
--                 end
--                 return true
--             end
--         }))
--     end,
-- }

SMODS.Back {
    key = "periwinkle_seal",
    pos = { x = 1, y = 0 },
    config = { hands = -1 },
    atlas = 'cfawm_backs',
    loc_vars = function(self, info_queue, back)
        --info_queue[#info_queue+1] = G.P_SEALS.cfawm_Periwinkle
        return { vars = { self.config.hands } }
    end,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, card in pairs(G.playing_cards) do
					card:set_seal('cfawm_Periwinkle', true, true)
                end
                return true
            end
        }))
    end,
}

SMODS.Back {
    key = "cardboard_seal",
    pos = { x = 2, y = 0 },
    config = { discards = -1 },
    atlas = 'cfawm_backs',
    loc_vars = function(self, info_queue, back)
        --info_queue[#info_queue+1] = G.P_SEALS.cfawm_Cardboard
        return { vars = { self.config.discards } }
    end,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, card in pairs(G.playing_cards) do
					card:set_seal('cfawm_Cardboard', true, true)
                end
                return true
            end
        }))
    end,
}

SMODS.Back {
    key = "acetate",
    pos = { x = 3, y = 0 },
    config = { discards = -1, hands = -1 },
    atlas = 'cfawm_backs',
    loc_vars = function(self, info_queue, back)
        --info_queue[#info_queue+1] = G.P_CENTERS.e_cfawm_acetate
        return { vars = { self.config.discards, self.config.hands } }
    end,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, card in pairs(G.playing_cards) do
					card:set_edition('e_cfawm_acetate', true, true)
                end
                return true
            end
        }))
    end,
}

SMODS.Back {
    key = "charged",
    pos = { x = 4, y = 0 },
    config = { hands = -1 },
    atlas = 'cfawm_backs',
    loc_vars = function(self, info_queue, back)
        --info_queue[#info_queue+1] = G.P_CENTERS.m_cfawm_charged
        return { vars = { self.config.hands } }
    end,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, card in pairs(G.playing_cards) do
					card:set_ability(G.P_CENTERS.m_cfawm_charged, true, true)
                end
                return true
            end
        }))
    end,
}

-- SMODS.Back {
--     key = "packing",
--     pos = { x = 1, y = 0 },
--     config = {},
--     atlas = 'cfawm_backs',
--     loc_vars = function(self, info_queue, back)
--         return { vars = { } }
--     end,
--     apply = function(self, back)
--         G.E_MANAGER:add_event(Event({
--             func = function()
--                 for _, card in pairs(G.playing_cards) do
-- 					card:set_ability('p_standard_normal_1')
--                 end
--                 return true
--             end
--         }))
--     end,
-- }


-- STICKERS --

-- Heavy: Takes up an additional card slot.

-- TAGS --

SMODS.Tag {
    key = "acetate",
    min_ante = 1,
    atlas = 'cfawm_tags',
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_cfawm_acetate
    end,
    apply = function(self, tag, context)
        if context.type == 'store_joker_modify' then
            if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                context.card.temp_edition = true
                tag:yep('+', G.C.DARK_EDITION, function()
                    context.card.temp_edition = nil
                    context.card:set_edition("e_cfawm_acetate", true)
                    context.card.ability.couponed = true
                    context.card:set_cost()
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                tag.triggered = true
                return true
            end
        end
    end
}

SMODS.Tag {
    key = "unkempt",
    atlas = 'cfawm_tags',
    pos = { x = 1, y = 0 },
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_cfawm_unkempt
    end,
    apply = function(self, tag, context)
        if context.type == 'store_joker_modify' then
            if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                context.card.temp_edition = true
                tag:yep('+', G.C.DARK_EDITION, function()
                    context.card.temp_edition = nil
                    context.card:set_edition("e_cfawm_unkempt", true)
                    context.card.ability.couponed = true
                    context.card:set_cost()
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                tag.triggered = true
                return true
            end
        end
    end
}

-- TAROTS --

SMODS.Consumable {
    key = 'lightning',
    set = 'Tarot',
    atlas = 'cfawm_tarots',
    pos = { x = 0, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_cfawm_charged' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end
}