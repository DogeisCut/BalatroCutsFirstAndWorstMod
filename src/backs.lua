-- DECKS/BACKS --

-- Kingdom Deck: Contains several face cards in place of the numbered cards

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

-- Needs extra work to make the packs actually work
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