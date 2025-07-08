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
                mult = card.ability.extra.min + ((math.sin(G.TIMERS.REAL) + 1) / 2) * (card.ability.extra.max - card.ability.extra.min)
            }
        end
    end
}

-- joker that occasionally puts playing cards in a storage area and has mult for how many are in there
-- joker that has a small chance to replace a played card with itself (still in your deck with a suit and rank) and it has like a mult and chip bonus or something but gets stronger the more of itself there are
-- joker with like +80 mult but it always self destructs after 3 rounds, but it gets another round of life for every consumable used and card destroyed
-- joker that has a rarity that is random each run (except legendary) and gets a mult bonus for each joker in your area with the same rarity
-- joker that makes anything that self destructs without a chance take two self destructs before actually getting destroyed, also makes jokers and like glass cards (with the 1 in whataver chance of self destructing) 33% less likely to do so
-- joker that makes all planet cards have like a slim chance to ALSO upgrade your most played hand (including the same hand planet cards)
-- pickle jar: turns into "open pickle jar" in 4 blinds, but will gain a blind-wait if you play the randomized-per-round hand on the card
-- open pickle jar: big xmult or something that makes the restriction worth it