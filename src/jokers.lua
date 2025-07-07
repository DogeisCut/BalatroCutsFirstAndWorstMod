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

SMODS.Joker {
    key = "sine_wave",
    atlas = 'cfawm_jokers',
    pos = { x = 1, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 5,
    config = { extra = { max = 25, min = 0 } },
    -- N': you need a main_end with a text node using ref_table and ref_value
    loc_vars = function(self, info_queue, card)
        main_end  = {

        }
        return { main_end = main_end }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.min + ((math.cos(G.TIMERS.REAL) + 1) / 2) * (card.ability.extra.max - card.ability.extra.min)
            }
        end
    end
}


