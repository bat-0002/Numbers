-- Fake Bloodstone
SMODS.Joker {
    key = "fake_bloodstone",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    config = { extra = { odds = 2, Xmult = 1 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'bstuff_fake_bloodstone')
        return { vars = {numerator, denominator, card.ability.extra.Xmult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") and SMODS.pseudorandom_probability(card, 'bstuff_fake_bloodstone', 1, card.ability.extra.odds) then
            return { xmult = self.config.Xmult, message = localize({ type = 'variable', key = 'a_xmult', vars = { self.config.Xmult } }), colour = G.C.MULT, sound = 'multhit2' }
        end
    end
}