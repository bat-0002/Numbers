if CardSleeves then
    CardSleeves.Sleeve {
        key = "none",
        -- atlas = "sleeves"
        pos = { x = 0, y = 0 },
        config = {
            discards = -1,
            hands = -2,
            dollars = -10,
            extra_hand_bonus = -2,
            extra_discard_bonus = -1,
            no_interest = true,
            consumable_slot = -2,
            joker_slot = -2,
            vouchers = { 'v_magic_trick' }
        },
    }
end