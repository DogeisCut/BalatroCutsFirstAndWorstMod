-- EDITIONS --

SMODS.Edition {
    key = 'acetate',
    shader = 'acetate',
    config = { extra = { score_passthrough = 0.5 } },
	--disable_shadow = true,
	disable_base_shader = true,
    in_shop = true,
    weight = 15,
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
    config = { extra = { mult = 2, double_chance = 3, chances = 3, adder = 2, } },
	--disable_shadow = true,
	disable_base_shader = true,
    in_shop = true,
    weight = 15,
    extra_cost = 2,
    sound = { sound = "cfawm_e_unkempt", per = 1, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.extra.mult,  G.GAME.probabilities.normal, card.edition.extra.double_chance, card.edition.extra.chances, card.edition.extra.adder } }
    end,
    get_weight = function(self)
        return self.weight
    end,
    calculate = function(self, card, context)
		if (context.main_scoring and context.cardarea == G.play) or context.pre_joker then
            local mult = card.edition.extra.mult
            local doubleCount = 0
            for i = 1, card.edition.extra.chances do
                if pseudorandom('unkempt_double_chance') < G.GAME.probabilities.normal / card.edition.extra.double_chance then
                    doubleCount = doubleCount + 1
                    mult = (mult * 2) + card.edition.extra.adder
                end
            end
            local message = nil
            if doubleCount > 0 then
                message = 'Doubled x' .. doubleCount .. '!'
            end
			return {
                message = message,
				mult = mult
			}
		end
	end,
}
