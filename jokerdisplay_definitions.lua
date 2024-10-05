------------------------------
-- JokerDisplay Integration --
------------------------------

local jd_def = JokerDisplay.Definitions

jd_def['j_thepsychic'] = { -- Psychic Joker
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "x_mult" }
            }
        }
    },
    calc_function = function(card)
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        card.joker_display_values.x_mult = hand and #hand > 0 and #hand <= card.ability.extra.size and
        card.ability.extra.xmult or 1
    end
}

jd_def['j_thehead'] = { -- Head Joker
    retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
        return playing_card:is_suit("Hearts") and 1 or 0
    end
}

jd_def['j_theplant'] = { -- Plant Joker
    retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
        return playing_card:is_face() and 1 or 0
    end
}

jd_def['j_thehook'] = { -- Hook Joker

}

jd_def['j_thepillar'] = { -- Pillar Joker
    retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
        local is_retriggered = false
        for _, previously_played_card in pairs(joker_card.ability.extra.cards) do
            if previously_played_card == playing_card.base.id .. playing_card.base.suit then
                is_retriggered = true
                break
            end
        end
        return is_retriggered and 1 or 0
    end
}

jd_def['j_thearm'] = { -- Arm Joker

}

jd_def['j_theeye'] = { -- Eye Joker
    reminder_text = {
        { text = '(' },
        { ref_table = "card.joker_display_values", ref_value = "active_text" },
        { text = ')' },
    },
    calc_function = function(card)
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, _ = JokerDisplay.evaluate_hand(hand)
        local active = G.GAME.hands[text] and G.GAME.hands[text].played_this_round >= 1
        card.joker_display_values.active = active
        card.joker_display_values.active_text = card.joker_display_values.active and
            localize('k_active') or "Inactive"
    end,
}

jd_def['j_thetooth'] = { -- Tooth Joker
    text = {
        { text = "+$",                             colour = G.C.GOLD },
        { ref_table = "card.joker_display_values", ref_value = "dollars" }
    },
    text_config = { colour = G.C.GOLD },
    calc_function = function(card)
        local dollars = 0
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                dollars = dollars + card.ability.extra *
                    JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
            end
        end
        card.joker_display_values.dollars = dollars
    end
}

jd_def['j_thehouse'] = { -- House Joker
    extra = {
        {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "odds" },
            { text = " in " },
            { ref_table = "card.ability.extra",        ref_value = "odds" },
            { text = ")" },
        }
    },
    extra_config = { colour = G.C.GREEN, scale = 0.3 },
    calc_function = function(card)
        card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
    end
}

jd_def['j_thewater'] = { -- Water Joker

}

jd_def['j_thewindow'] = { -- Window Joker
    retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
        return playing_card:is_suit("Diamonds") and 1 or 0
    end
}

jd_def['j_thewheel'] = { -- Wheel Joker
    extra = {
        {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "odds" },
            { text = " in " },
            { ref_table = "card.ability.extra",        ref_value = "odds" },
            { text = ")" },
        }
    },
    extra_config = { colour = G.C.GREEN, scale = 0.3 },
    calc_function = function(card)
        card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
    end
}

jd_def['j_theserpent'] = { -- Serpent Joker

}

jd_def['j_themark'] = { -- Mark Joker
    text = {
        { ref_table = "card.joker_display_values", ref_value = "count" },
        { text = "x",                              scale = 0.35 },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.SECONDARY_SET.Tarot },
    },
    extra = {
        {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "odds" },
            { text = " in " },
            { ref_table = "card.ability.extra",        ref_value = "odds" },
            { text = ")" },
        }
    },
    extra_config = { colour = G.C.GREEN, scale = 0.3 },
    calc_function = function(card)
        local count = 0
        local playing_hand = next(G.play.cards)
        for _, playing_card in ipairs(G.hand.cards) do
            if playing_hand or not playing_card.highlighted then
                if playing_card.facing and not (playing_card.facing == 'back') and playing_card:is_face() then
                    count = count + JokerDisplay.calculate_card_triggers(playing_card, nil, true)
                end
            end
        end
        card.joker_display_values.count = count
        card.joker_display_values.localized_text = localize("k_tarot")
        card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
    end
}

jd_def['j_themanacle'] = { -- Manacle Joker
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "Xmult" }
            }
        }
    },
}

jd_def['j_theneedle'] = { -- Needle Joker

}

jd_def['j_thefish'] = { -- Fish Joker
    extra = {
        {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "odds" },
            { text = " in " },
            { ref_table = "card.ability.extra",        ref_value = "odds" },
            { text = ")" },
        }
    },
    extra_config = { colour = G.C.GREEN, scale = 0.3 },
    calc_function = function(card)
        card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
    end
}

jd_def['j_thegoad'] = { -- Goad Joker
    retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
        return playing_card:is_suit("Spades") and 1 or 0
    end
}

jd_def['j_themouth'] = { -- Mouth Joker
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "x_mult" }
            }
        }
    },
    calc_function = function(card)
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, _ = JokerDisplay.evaluate_hand(hand)
        card.joker_display_values.x_mult = G.GAME.hands[text] and
            ((not next(G.play.cards) and G.GAME.hands[text].played_this_round < 1) or
                (next(G.play.cards) and G.GAME.hands[text].played_this_round == 1)) and
            card.ability.extra.Xmult or 1
    end
}

jd_def['j_theflint'] = { -- Flint Joker
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "x_mult" }
            }
        }
    },
    calc_function = function(card)
        local count = 0
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                count = count +
                    JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
            end
        end
        card.joker_display_values.x_mult = tonumber(string.format("%.2f", (card.ability.extra.Xmult ^ count)))
    end,
}

jd_def['j_thewall'] = { -- Wall Joker

}

jd_def['j_theox'] = { -- Ox Joker
    text = {
        { text = "+$" },
        { ref_table = "card.joker_display_values", ref_value = "dollars" }
    },
    text_config = { colour = G.C.GOLD },
    calc_function = function(card)
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, _ = JokerDisplay.evaluate_hand(hand)
        card.joker_display_values.dollars = (text ~= 'Unknown' and G.GAME and G.GAME.hands[text] and
            math.min(G.GAME.hands[text].played, card.ability.max)) or 0
    end
}

jd_def['j_theclub'] = { -- Club Joker
    retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
        return playing_card:is_suit("Clubs") and 1 or 0
    end
}
