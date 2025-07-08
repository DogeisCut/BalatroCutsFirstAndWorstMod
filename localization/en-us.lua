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
                name = "Redemption Deck",
                text = {
                    "All playing cards",
                    "have a {C:attention,T:cfawm_Periwinkle}Periwinkle Seal",
                    "{C:blue}#1#{} hand",
                    "every round",
                },
            },
            b_cfawm_cardboard_seal = {
                name = "Recycle Deck",
                text = {
                    "All playing cards",
                    "have a {C:attention,T:cfawm_Cardboard}Cardboard Seal",
                    "{C:red}#1#{} discard",
                    "every round",
                },
            },
            b_cfawm_acetate = {
                name = "Deck of Transparency",
                text = {
                    "All cards are {C:dark_edition,T:e_cfawm_acetate}Acetate Cards",
                    "{C:red}#1#{} discard",
                    "{C:blue}#2#{} hand",
                    "every round",
                },
            },
            b_cfawm_unkempt = {
                name = "Deck of Filth",
                text = {
                    "All cards are {C:dark_edition,T:e_cfawm_unkempt}Unkempt Cards",
                    "{C:red}#1#{} discard",
                    "{C:blue}#2#{} hand",
                    "every round",
                },
            },
            b_cfawm_charged = {
                name = "The Electrician's Deck",
                text = {
                    "All playing cards",
                    "are {C:attention,T:m_cfawm_charged}Charged Cards",
                    "{C:blue}#1#{} hand",
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
        Enhanced = {
            m_cfawm_charged = {
                name = "Charged Card",
                text = {
                    "{C:mult}+#1#{} Mult for every played",
                    "hand this stays in hand",
                    "{C:inactive}(Currently {C:red}+#2#{C:inactive} Mult)",
                },
            },
        },
        Joker = {
            j_cfawm_digit_joker = {
                name = "Digit Joker",
                text = {
                    "Each played {C:attention}Zero{} gives",
                    "{X:mult,C:white} X#1# {} Mult when scored",
                },
            },
            j_cfawm_sine_wave = {
                name = "Sine Wave",
                text = {
                    "",
                },
            },
            j_cfawm_pickle_jar = {
                name = "Pickle Jar",
                text = {
                    "Will turn into a {C:attention}Open Pickle Jar",
                    "in {C:attention}#1#{} #3# but will gain two",
                    "blinds if a {C:attention}#2#{} is played",
                    "{C:inactive}(Poker hand randomized each blind)"
                },
            },
            j_cfawm_open_pickle_jar = {
                name = "Open Pickle Jar",
                text = {
                    "{X:mult,C:white} X#1# {} Mult",
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
        Tag = {
            tag_cfawm_acetate = {
                name = "Acetate Tag",
                text = {
                    "Next base edition shop",
                    "Joker is free and",
                    "becomes {C:dark_edition}Acetate",
                },
            },
            tag_cfawm_unkempt = {
                name = "Unkempt Tag",
                text = {
                    "Next base edition shop",
                    "Joker is free and",
                    "becomes {C:dark_edition}Unkempt",
                },
            },
        },
        Tarot = {
            c_cfawm_lightning = {
                name = "The Lightning",
                text = {
                    "Enhances {C:attention}#1#",
                    "selected cards to",
                    "{C:attention}#2#s",
                },
            },
        },
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