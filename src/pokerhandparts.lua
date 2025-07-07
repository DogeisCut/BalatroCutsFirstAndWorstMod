-- POKER HAND PARTS --

SMODS.PokerHandPart {
	key = "funny",
	func = function(hand)
		if #hand < 5 then return {} end

		local required_ids = {6, 9, 4, 2, SMODS.Ranks['cfawm_0'].id}

		local found_ids = {}
		for _, card in ipairs(hand) do
			found_ids[card:get_id()] = card
		end

		for _, id in ipairs(required_ids) do
			if not found_ids[id] then
				return {}
			end
		end

		local positions = {}
		for _, global_card in ipairs(G.hand.cards) do
			local gid = global_card:get_id()
			if found_ids[gid] then
				positions[#positions + 1] = { id = gid, index = #positions + 1 }
			end
		end

		local last_index = -1
		for _, required_id in ipairs(required_ids) do
			for i, gcard in ipairs(G.hand.cards) do
				if gcard:get_id() == required_id then
					if i > last_index then
						last_index = i
						break
					else
						return {}
					end
				end
			end
		end

		local scored_cards = {}
		for _, id in ipairs(required_ids) do
			table.insert(scored_cards, found_ids[id])
		end

		return { scored_cards }
	end,
}

SMODS.PokerHandPart {
	key = "roundabout",
	func = function(hand)
		if #hand < 5 then return {} end

		local scored_cards = {}
		local suits_found = {}
		local unique_count = 0

		for _, card in ipairs(hand) do
            local suit = card.base.suit
			local special = false
            if SMODS.has_no_suit(card) then
                suit = ''
				special = true
            end
            if SMODS.has_any_suit(card) and card:can_calculate() then
                suit = 'wild'
				special = true
            end
            if suit and not suits_found[suit] then
				-- Check if a already found suit is smeared to be the same as the current card's suit (i hope this logic is correct...)
                for found_suit, _ in pairs(suits_found) do
                    if not special and SMODS.smeared_check(card, found_suit) then
						break
					end
				end
				suits_found[suit] = card
				unique_count = unique_count + 1
			end
		end

		if unique_count == #hand then
			for _, card in pairs(suits_found) do
				table.insert(scored_cards, card)
			end
			return { scored_cards }
		end

		return {}
	end,
}
