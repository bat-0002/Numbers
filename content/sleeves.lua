if CardSleeves then
    CardSleeves.Sleeve {
        key = "snone",
        atlas = "sleeves",
        pos = { x = 0, y = 0 },
        config = {
            discards = -1,
            hands = -2,
            extra_hand_bonus = 0,
            extra_discard_bonus = -1,
            no_interest = true,
            consumable_slot = -2,
            joker_slot = -2,
            vouchers = { 'v_magic_trick' }
        },
    }
    --[[
    CardSleeves.Sleeve {
        key = "sall",
        atlas = "sleeves",
        pos = { x = 1, y = 0 },
        config = {
            discards = 1, -- red deck
            dollars = 10, -- yellow deck
            extra_hand_bonus = 2, -- green deck
            extra_discard_bonus = 1, -- green deck
            no_interest = true, -- green deck
            vouchers = { 'v_crystal_ball', 'v_telescope', 'v_tarot_merchant', 'v_planet_merchant', 'v_overstock_norm' }, -- magic, nebula, zodiac deck
            consumables = { 'c_fool', 'c_fool', 'c_hex' }, -- magic, ghost deck
            consumable_slot = -1, -- nebula deck
            spectral_rate = 2, -- ghost deck
            randomize_rank_suit = true, -- erratic deck
            no_faces = true, -- abandoned deck
            hand_size = 2, -- painted deck
            ante_scaling = 2, -- plasma deck
        },
        loc_vars = function(self)
            local key, vars
            if self.get_current_deck_key() == "b_bstuff_sall" then
                key = self.key .. "_alt"
                self.config = {}
                vars = {}
            else
                key = self.key
                self.config = {
                    discards = 1, -- red deck
                    dollars = 10, -- yellow deck
                    extra_hand_bonus = 2, -- green deck
                    extra_discard_bonus = 1, -- green deck
                    no_interest = true, -- green deck
                    vouchers = { 'v_crystal_ball', 'v_telescope', 'v_tarot_merchant', 'v_planet_merchant', 'v_overstock_norm' }, -- magic, nebula, zodiac deck
                    consumables = { 'c_fool', 'c_fool', 'c_hex' }, -- magic, ghost deck
                    consumable_slot = -1, -- nebula deck
                    spectral_rate = 2, -- ghost deck
                    randomize_rank_suit = true, -- erratic deck
                    no_faces = true, -- abandoned deck
                    hand_size = 2, -- painted deck
                    ante_scaling = 2, -- plasma deck
                }
            vars = { self.config.discards, self.config.dollars, self.config.extra_hand_bonus, self.config.extra_discard_bonus, self.config.no_interest, self.config.vouchers, self.config.consumables, self.config.consumable_slot, self.config.spectral_rate, self.config.hand_size, self.config.ante_scaling, self.config.randomize_rank_suit, self.config.no_faces, { localize { type = 'name_text', key = 'tag_double', set = 'Tag' } } }
        end,
        apply = function(self, back)
            G.E_MANAGER:add_event(Event({ -- checkered deck
                func = function()
                    for k, v in pairs(G.playing_cards) do
                        if v.base.suit == 'Clubs' then
                            v:change_suit('Spades')
                        end
                        if v.base.suit == 'Diamonds' then
                            v:change_suit('Hearts')
                        end
                        return true
                    end
                end
            }))
        end,
        calculate = function(self, back, context) -- anaglyph
            if context.round_eval and G.GAME.last_blind and G.GAME.last_blind.boss then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        add_tag(Tag('tag_double'))
                        play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                        return true
                    end
                }))
            end
            if context.final_scoring_step then -- plasma
                return {
                    balance = true
                }
            end
            G.GAME.starting_params.no_faces = true
        end
    }
    ]]
end