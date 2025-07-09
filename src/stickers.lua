-- STICKERS --

-- Heavy: Takes up an additional card slot.
-- WOW THIS DOESNT WORK!!
SMODS.Sticker {
    key = "heavy",
    badge_colour = HEX('59C79B'),
    atlas = 'cfawm_stickers',
    pos = { x = 0, y = 0 },
    config = { card_limit = -1 },
    should_apply = function(self, card, center, area, bypass_roll)
        return G.GAME.modifiers.enable_heavies_in_shop
    end,
    apply = function(self, card, val)
        card.ability[self.key] = val
        card.ability.card_limit = -1
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.card_limit } }
    end,
}