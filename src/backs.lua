-- None Deck
SMODS.Back {
    key = "none",
    pos = { x = 0, y = 0 },
    config = { discards = -1, hands = -2, dollars = -10, extra_hand_bonus = -2, extra_discard_bonus = -1, no_interest = true, consumable_slot = -2, hand_size = -2, ante_scaling = 2, joker_slot = -1, shop_size = -1, voucher = 'magic_trick' },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.discards, self.config.hands, self.config.dollars, self.config.extra_hand_bonus, self.config.extra_discard_bonus, self.config.joker_slot, self.config.consumable_slot, self.config.hand_size, self.config.ante_scaling, self.config.shop_size,  } }
    end,
}