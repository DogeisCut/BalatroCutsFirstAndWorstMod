-- SEALS --

SMODS.Seal {
	key = 'Periwinkle',
	atlas = 'cfawm_enhancers',
	pos = { x = 1, y = 0 },
    badge_colour = HEX('CCCCFF'),
	loc_vars = function(self, info_queue, card)
		return { vars = { G.GAME.probabilities.normal, 5.0 } }
	end,
	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
            local ret = {}
			if pseudorandom('periwinkle_seal_gain') < G.GAME.probabilities.normal / 5.0 then
				if pseudorandom('periwinkle_seal_hand_or_discard') < 1 / 2.0 then
					ret.message = "+1 Hand!"
                    ret.colour = G.C.BLUE
					ease_hands_played(1)
                else
                    ret.message = "+1 Discard!"
					ret.colour = G.C.RED
					ease_discard(1)
				end
			end
			return ret
		end
	end,
}

SMODS.Seal {
	key = 'Cardboard',
	atlas = 'cfawm_enhancers',
	pos = { x = 2, y = 0 },
    badge_colour = HEX('BB7547'),
    loc_vars = function(self, info_queue, card)
		return { vars = { G.GAME.probabilities.normal, 3.0 } }
    end,
	-- Yes this adding the cards AFTER drawing is intentional.
	calculate = function(self, card, context)
		if context.discard and context.other_card == card then
            local ret = {}
            if pseudorandom('cardboard_seal_duplicate') < G.GAME.probabilities.normal / 3.0 then
				G.playing_card = (G.playing_card and G.playing_card + 1) or 1
				local copy_card = copy_card(card, nil, nil, G.playing_card)
                copy_card:add_to_deck()
				copy_card.states.visible = nil
                G.E_MANAGER:add_event(Event({
					blocking = false,
                    func = function()
						if G.STATE ~= G.STATES.SELECTING_HAND then
							return false
						end
						G.deck.config.card_limit = G.deck.config.card_limit + 1
						table.insert(G.playing_cards, copy_card)
						G.hand:emplace(copy_card)
                        G.E_MANAGER:add_event(Event({
							blocking = false,
                            func = function()
                                if G.STATE ~= G.STATES.SELECTING_HAND then
                                    return false
                                end
							copy_card:start_materialize()
							return true
						end
					}))
					return true
				end
			}))

				ret.message = localize('k_copied_ex')
				ret.colour = G.C.CHIPS
				ret.func = function() 
					G.E_MANAGER:add_event(Event({
						func = function()
							SMODS.calculate_context({ playing_card_added = true, cards = { copy_card } })
							return true
						end
					}))
				end
			end
			return ret
		end
	end,
}
