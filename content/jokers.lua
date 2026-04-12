-- Fake Bloodstone
SMODS.Joker {
    key = "fake_bloodstone",
    unlocked = false,
    blueprint_compat = true,
    rarity = 1,
    cost = 7,
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    config = { extra = { odds = 2, Xmult = 1 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'bstuff_fake_bloodstone')
        return { vars = {numerator, denominator, card.ability.extra.Xmult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") and SMODS.pseudorandom_probability(card, 'bstuff_fake_bloodstone', 1, card.ability.extra.odds) then
            return {
                xmult = card.ability.extra.Xmult
            }
        end
    end,
    locked_loc_vars = function(self, info_queue, card)
        return { vars = { 30, localize('Hearts', 'suits_singular') } }
    end,
    check_for_unlock = function(self, args)
        if args.type == 'modify_deck' then
            local count = 0
            for _, playing_card in ipairs(G.playing_cards or {}) do
                if playing_card.base.suit == 'Hearts' then count = count + 1 end
                if count >= 30 then
                    return true
                end
            end
        end
        return false
    end
}