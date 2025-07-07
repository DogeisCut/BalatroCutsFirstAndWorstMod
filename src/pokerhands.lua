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
    key = "Rounda' Five",
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
    key = "Rounda' Funny",
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
    key = "Rounda' House",
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
