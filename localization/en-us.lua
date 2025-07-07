return {
    descriptions = {
        Back = {
            -- b_cfawm_brown_seal = {
            --     name = "Brown Seal",
            --     text = {
            --         "Oops! All Brown Seal",
            --     },
            -- },
            b_cfawm_periwinkle_seal = {
                name = "Periwinkle Seal Deck",
                text = {
                    "Oops! All {T:cfawm_periwinkle_seal}Periwinkle Seal",
                    "{C:blue}#1#{} hand",
                    "every round",
                },
            },
            b_cfawm_cardboard_seal = {
                name = "Cardboard Seal Deck",
                text = {
                    "Oops! All {T:cfawm_cardboard_seal}Cardboard Seal",
                    "{C:red}#1#{} discard",
                    "every round",
                },
            },
            b_cfawm_acetate = {
                name = "Acetate Deck",
                text = {
                    "Oops! All {T:e_cfawm_acetate}Acetate",
                    "{C:red}#1#{} discard",
                    "{C:blue}#2#{} hand",
                    "every round",
                },
            }
        },
        Blind = {},
        Edition = {
            e_cfawm_acetate = {
                name = "Acetate",
                text = {
                    "Additionally scores {C:attention}x#1#{}",
                    "of the current {C:chips}chips{} and {C:mult}mult{}",
                    "{C:inactive}(rounded up)",
                },
            },
             e_cfawm_unkempt = {
                name = "Unkempt",
                text = {
                    "Doesn't do much at the moment"
                },
            },
        },
        Enhanced = {},
        Joker = {
            j_cfawm_digit_joker = {
                name = "Digit Joker",
                text = {
                    "Each played {C:attention}Zero{} gives",
                    "{X:mult,C:white} X#1# {} Mult when scored",
                },
            },
        },
        Other = {
            -- cfawm_brown_seal = {
            --     name = 'Brown Seal',
            --     text = {
            --         'Discards (with effects) the card to the',
            --         'right when {C:attention}discarded',
            --     },
            -- },
            cfawm_periwinkle_seal = {
                name = 'Periwinkle Seal',
                text = {
                    "{C:green}#1# in #2#{} chance",
                    "to gain {C:blue}+1{} temporary hand",
                    "or {C:red}+1{} temporary discard",
                    "when this card is scores"
                },
            },
            cfawm_cardboard_seal = {
                name = 'Cardboard Seal',
                text = {
                    "When {C:attention}discarded,",
                    "{C:green}#1# in #2#{} chance",
                    "to add a {C:attention}copy{}",
                    "to hand after drawing"
                },
            },
        },
        Planet = {
            ["c_cfawm_hd_189733b"] = {
                name = 'HD 189733b',
                 text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                },
            },
            ["c_cfawm_wasp-12b"] = {
                name = 'WASP-12b',
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                },
            },
        },
        Spectral = {},
        Stake = {},
        Tag = {},
        Tarot = {},
        Voucher = {},
    },
    misc = {
        achievement_descriptions = {},
        achievement_names = {},
        blind_states = {},
        challenge_names = {},
        collabs = {},
        dictionary = {},
        high_scores = {},
        labels = {
            --cfawm_brown_seal = "Brown Seal",
            cfawm_periwinkle_seal = "Periwinkle Seal",
            cfawm_cardboard_seal = "Cardboard Seal",
            cfawm_acetate = "Acetate",
            cfawm_unkempt = "Unkempt"
        },
        poker_hand_descriptions = {
            cfawm_Funny = {
                'A 6, 9, 4, 2, and 0 in that order.',
                'This is a funny hand',
            },
            cfawm_Roundabout = {
                'Every card is from a different suit',
            },
            ["cfawm_Rounda' Five"] = {
                "A Roundabout and a Five of a Kind",
            },
            ["cfawm_Rounda' Funny"] = {
                "A Roundabout and a Funny",
            },
            ["cfawm_Rounda' House"] = {
                "A Roundabout and a Full House",
            },
            ["cfawm_Funny Flush"] = {
                "A Funny and a Flush",
            },
        },
        poker_hands = {
            cfawm_Funny = 'Funny',
            cfawm_Roundabout = 'Roundabout',
            ["cfawm_Rounda' Five"] = "Rounda' Five",
            ["cfawm_Rounda' Funny"] = "Rounda' Funny",
            ["cfawm_Rounda' House"] = "Rounda' House",
            ["cfawm_Funny Flush"] = "Funny Flush",
        },
        quips = {},
        ranks = {
            cfawm_0 = '0',
            cfawm_Peasant = 'Peasant',
        },
        suits_plural = {
            cfawm_Triangles = 'Triangles',
        },
        suits_singular = {
            cfawm_Triangles = 'Triangle',
        },
        tutorial = {},
        v_dictionary = {},
        v_text = {},
    },
}