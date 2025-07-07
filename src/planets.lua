-- PLANETS --

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
