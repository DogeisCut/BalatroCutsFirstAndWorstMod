-- JOKERS --

-- x10 mult for each 0 card scored.

SMODS.Joker {
    key = "digit_joker",
    atlas = 'cfawm_jokers',
    pos = { x = 0, y = 0 },
    rarity = 2,
    blueprint_compat = true,
    cost = 5,
    config = { extra = { zero_mult = 10 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.zero_mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card:get_id() == SMODS.Ranks['cfawm_0'].id then
            return {
                mult = card.ability.extra.zero_mult
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
    config = { extra = { max = 500, min = 0, sine_chips = 0, sine_chips_string = "+sine(seconds) ", time_spent = 0 } },
    loc_vars = function(self, info_queue, card)
        main_end = {
            { n = G.UIT.T, config = { ref_table = card.ability.extra, ref_value = "sine_chips_string", colour = G.C.CHIPS, scale = 0.32 } },
            { n = G.UIT.T, config = { text = "Chips", colour = G.C.UI.TEXT_DARK, scale = 0.32 } },
        }
        return { main_end = main_end }
    end,
    update = function(self, card, dt)
        if G.STATE ~= G.STATES.HAND_PLAYED and not G.SETTINGS.paused then
            card.ability.extra.time_spent = card.ability.extra.time_spent + dt
            card.ability.extra.sine_chips = card.ability.extra.min + ((math.sin(card.ability.extra.time_spent) + 1) / 2) * (card.ability.extra.max - card.ability.extra.min)
            card.ability.extra.sine_chips = math.floor((card.ability.extra.sine_chips * 1) + 0.5) / 1
            card.ability.extra.sine_chips_string = '+' .. card.ability.extra.sine_chips .. " "
        end
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.sine_chips
            }
        end
    end
}

-- joker that occasionally puts playing cards in a storage area and has mult for how many are in there
-- joker that has a small chance to replace a played card with itself (still in your deck with a suit and rank) and it has like a mult and chip bonus or something but gets stronger the more of itself there are
-- joker with like +80 mult but it always self destructs after 3 rounds, but it gets another round of life for every consumable used and card destroyed
-- joker that has a rarity that is random each run (except legendary) and gets a mult bonus for each joker in your joker area with the same rarity
-- joker that makes anything that self destructs without a chance take two self destructs before actually getting destroyed, also makes jokers and like glass cards (with the 1 in whataver chance of self destructing) 33% less likely to do so
-- joker that makes all planet cards have like a slim chance to ALSO upgrade your most played hand (including the same hand planet cards)
-- pickle jar: turns into "open pickle jar" in 4 blinds, but will gain two blind-waits if you play the randomized-per-blind hand on the card
SMODS.Joker {
    key = "pickle_jar",
    atlas = 'cfawm_jokers',
    pos = { x = 2, y = 0 },
    rarity = 2,
    blueprint_compat = false,
    perishable_compat = false,
    cost = 5,
    config = { extra = { blinds_left = 4, bad_poker_hand = 'High Card' }, },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_cfawm_open_pickle_jar
         return { vars = { card.ability.extra.blinds_left, localize(card.ability.extra.bad_poker_hand, 'poker_hands'), card.ability.extra.blinds_left == 1 and "blind" or "blinds" } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            -- get most played hand, keeping note of ties...
            local most_played_hand_keys = {}
            local most_played_hand_amount = 0
            for handname, hand in pairs(G.GAME.hands) do
                if hand.played > most_played_hand_amount then
                    most_played_hand_amount = hand.played
                    most_played_hand_keys = { handname }
                elseif hand.played == most_played_hand_amount then
                    table.insert(most_played_hand_keys, handname)
                end
            end

            -- pick random in the tied table
            local most_played_hand_key = nil
            if #most_played_hand_keys > 0 then
                most_played_hand_key = pseudorandom_element(most_played_hand_keys, 'pickle_jar_tiebreaker')
            end

            -- randomize bad poker hand
            local _poker_hands = {}
            for handname, _ in pairs(G.GAME.hands) do
                if SMODS.is_poker_hand_visible(handname) and handname ~= card.ability.extra.bad_poker_hand then
                    _poker_hands[#_poker_hands + 1] = handname
                    -- most played hand bias :troll:
                    if most_played_hand_key and handname == most_played_hand_key then
                        for _ = 1, 2 do
                            _poker_hands[#_poker_hands + 1] = handname
                        end
                    end
                end
            end
            card.ability.extra.bad_poker_hand = pseudorandom_element(_poker_hands, 'pickle_jar')

            -- decrease blind and potentially open :3
            card.ability.extra.blinds_left = card.ability.extra.blinds_left - 1
            if card.ability.extra.blinds_left <= 0 then
                card:set_ability("j_cfawm_open_pickle_jar")
                return { message = 'Opened!', colour = G.C.GREEN }
            end
        end
        -- punish for playing the bad hand
        if context.before and context.main_eval and context.scoring_name == card.ability.extra.bad_poker_hand then
            card.ability.extra.blinds_left = card.ability.extra.blinds_left + 2
            return { message = 'Bad Hand!', colour = G.C.RED }
        end
    end
}

-- open pickle jar: big xmult or something that makes the restriction worth it
SMODS.Joker {
    key = "open_pickle_jar",
    atlas = 'cfawm_jokers',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 20,
    in_pool = function()
        return false
    end,
    config = { extra = { xmult = 12 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}