-- ENHANCEMENTS --

-- +6 Mult for every turn this stays in your hand
-- might need to update the text live here with "N': you need a main_end with a text node using ref_table and ref_value" too
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
