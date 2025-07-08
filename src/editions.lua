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
    sound = { sound = "cfawm_e_acetate", per = 1, vol = 0.4 },
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
    sound = { sound = "cfawm_e_unkempt", per = 1, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
    get_weight = function(self)
        return self.weight
    end,
}
