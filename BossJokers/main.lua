--- STEAMODDED HEADER
--- MOD_NAME: Boss Jokers
--- MOD_ID: BossJokers
--- MOD_AUTHOR: [KilledByLava]
--- MOD_DESCRIPTION: Adds Boss Jokers

----------------------------------------------
------------MOD CODE -------------------------

local jokers = {
    theclub = {
       name = "Club Joker",
       text = {
           "Retrigger all",
           "{C:suits}Club{} suit cards",
       },
       config = {extra = 1},
       pos = { x = 0, y = 0 },
       rarity= 2,
       cost = 6,
       blueprint_compat=true,
       eternal_compat=true,
       unlocked=true,
       discovered=true,
       effect= 'Suit repetition',
       atlas=nil,
       soul_pos=nil,

       set_ability = function (card, initial, delay_sprites)
            
       end,

       calculate = function(self,context)
        if context.repetition then
            if context.cardarea == G.play then
                if context.other_card:is_suit("Clubs") then
                        return {
                            message = "Again!",
                            repetitions = 1,
                            card = self
                            }
                end
            elseif context.cardarea == G.hand then
                if (next(context.card_effects[1]) or #context.card_effects > 1) then
                    if context.other_card:is_suit("Clubs") then
                        return {
                            message = "Again!",
                            repetitions = 1,
                            card = self
                        }
                    end
                end
            end
        end
        end,

       loc_def = function(self)
       end
   },

   thewindow = {
    name = "Window Joker",
    text = {
        "Retrigger all",
        "{C:suits}Diamond{} suit cards",
    },
    config = {extra = 1},
    pos = { x = 0, y = 0 },
    rarity= 2,
    cost = 6,
    blueprint_compat=true,
    eternal_compat=true,
    unlocked=true,
    discovered=true,
    effect= 'Suit repetition',
    atlas=nil,
    soul_pos=nil,

    set_ability = function (card, initial, delay_sprites)
         
    end,

    calculate = function(self,context)
     if context.repetition then
         if context.cardarea == G.play then
             if context.other_card:is_suit("Diamonds") then
                     return {
                         message = "Again!",
                         repetitions = 1,
                         card = self
                         }
             end
         elseif context.cardarea == G.hand then
             if (next(context.card_effects[1]) or #context.card_effects > 1) then
                 if context.other_card:is_suit("Diamonds") then
                     return {
                         message = "Again!",
                         repetitions = 1,
                         card = self
                     }
                 end
             end
         end
     end
     end,

    loc_def = function(self)
    end
    },

    thegoad = {
        name = "Goad Joker",
        text = {
            "Retrigger all",
            "{C:suits}Spade{} suit cards",
        },
        config = {extra = 1},
        pos = { x = 0, y = 0 },
        rarity= 2,
        cost = 6,
        blueprint_compat=true,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect= 'Suit repetition',
        atlas=nil,
        soul_pos=nil,
 
        set_ability = function (card, initial, delay_sprites)
             
        end,
 
        calculate = function(self,context)
         if context.repetition then
             if context.cardarea == G.play then
                 if context.other_card:is_suit("Spades") then
                         return {
                             message = "Again!",
                             repetitions = 1,
                             card = self
                             }
                 end
             elseif context.cardarea == G.hand then
                 if (next(context.card_effects[1]) or #context.card_effects > 1) then
                     if context.other_card:is_suit("Spades") then
                         return {
                             message = "Again!",
                             repetitions = 1,
                             card = self
                         }
                     end
                 end
             end
         end
         end,
 
        loc_def = function(self)
        end
    },

    thehead = {
        name = "Head Joker",
        text = {
            "Retrigger all",
            "{C:suits}Hearts{} suit cards",
        },
        config = {extra = 1},
        pos = { x = 0, y = 0 },
        rarity= 2,
        cost = 6,
        blueprint_compat=true,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect= 'Suit repetition',
        atlas=nil,
        soul_pos=nil,
 
        set_ability = function (card, initial, delay_sprites)
             
        end,
 
        calculate = function(self,context)
         if context.repetition then
             if context.cardarea == G.play then
                 if context.other_card:is_suit("Hearts") then
                         return {
                             message = "Again!",
                             repetitions = 1,
                             card = self
                             }
                 end
             elseif context.cardarea == G.hand then
                 if (next(context.card_effects[1]) or #context.card_effects > 1) then
                     if context.other_card:is_suit("Hearts") then
                         return {
                             message = "Again!",
                             repetitions = 1,
                             card = self
                         }
                     end
                 end
             end
         end
         end,
 
        loc_def = function(self)
        end
    },

    theplant = {
        name = "Plant Joker",
        text = {
            "Retrigger all",
            "face cards",
        },
        config = {extra = 1},
        pos = { x = 0, y = 0 },
        rarity= 3,
        cost = 8,
        blueprint_compat=true,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect= 'Suit repetition',
        atlas=nil,
        soul_pos=nil,
 
        set_ability = function (card, initial, delay_sprites)
             
        end,
 
        calculate = function(self,context)
         if context.repetition then
             if context.cardarea == G.play then
                 if context.other_card:is_face() then
                         return {
                             message = "Again!",
                             repetitions = 1,
                             card = self
                             }
                 end
             elseif context.cardarea == G.hand then
                 if (next(context.card_effects[1]) or #context.card_effects > 1) then
                     if context.other_card:is_face() then
                         return {
                             message = "Again!",
                             repetitions = 1,
                             card = self
                         }
                     end
                 end
             end
         end
         end,
 
        loc_def = function(self)
        end
    },

   theneedle = {
    name = "Needle Joker",
    text = {
        "{C:blue}+1{} hand",
    },
    config = {extra = 1},
    pos = { x = 0, y = 0 },
    rarity= 1,
    cost = 4,
    blueprint_compat=false,
    eternal_compat=true,
    unlocked=true,
    discovered=true,
    effect= 'Hands',
    atlas=nil,
    soul_pos=nil,

    set_ability = function (card, initial, delay_sprites)

    end,

    calculate = function(self,context)
        if context.setting_blind and not self.getting_sliced then
            ease_hands_played(self.ability.extra)
        end
     end,

    loc_def = function(self)
    end
    },

    thewater = {
        name = "Water Joker",
        text = {
            "Sell this card to",
            "get {C:red}+3{} discards"
        },
        config = {extra = 3},
        pos = { x = 0, y = 0 },
        rarity= 1,
        cost = 5,
        blueprint_compat=false,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect=nil,
        atlas=nil,
        soul_pos=nil,
    
        set_ability = function (card, initial, delay_sprites)
    
        end,
    
        calculate = function(self,context)
            if context.selling_self then
                ease_discard(self.ability.extra)
            end
         end,
    
        loc_def = function(self)
        end
    },

    thetooth = {
        name = "Tooth Joker",
        text = {
            "{C:money}$2{} per card played",
        },
        config = {extra = 2},
        pos = { x = 0, y = 0 },
        rarity= 3,
        cost = 8,
        blueprint_compat=true,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect=nil,
        atlas=nil,
        soul_pos=nil,
    
        set_ability = function (card, initial, delay_sprites)
    
        end,
    
        calculate = function(self,context)
            if context.individual then
                if context.cardarea == G.play then
                    return {
                        message = localize('$')..self.ability.extra,
                        colour = G.C.MONEY,
                        card = self,
                        dollars = self.ability.extra
                    }
                end
            end
         end,

        loc_def = function(self)
        end
    },

    thearm = {
        name = "Arm Joker",
        text = {
            "Sell this card to",
            "upgrade the most played",
            "Poker hand by 3 levels"
        },
        config = {extra = 3},
        pos = { x = 0, y = 0 },
        rarity= 2,
        cost = 6,
        blueprint_compat=false,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect=nil,
        atlas=nil,
        soul_pos=nil,
    
        set_ability = function (card, initial, delay_sprites)

        end,
    
        calculate = function(self,context)
            if context.selling_self then
                return{
                    level_up_hand(self, G.GAME.current_round.most_played_poker_hand, instant, 3)
                }
            end
         end,
    
        loc_def = function(self)
        end
    },

}
function SMODS.INIT.BlankJokerTemplate()
   --localization for the info queue key  
   G.localization.descriptions.Other["your_key"] = {
       name = "Club Joker", --tooltip name
       text = {
           "Retrigger all",
           "Club suit cards",
       }
   }
   init_localization()

   for k, v in pairs(jokers) do
       local joker = SMODS.Joker:new(v.name, k, v.config, v.pos, { name = v.name, text = v.text }, v.rarity, v.cost, v.unlocked, v.discovered, v.blueprint_compat, v.eternal_compat, v.effect, v.atlas ,v.soul_pos)
       joker:register()
       
       if not v.atlas then
           SMODS.Sprite:new("j_"..k, SMODS.findModByID("BossJokers").path, "j_"..k..".png", 71, 95, "asset_atli"):register() 
       end

       --add jokers calculate function:
       SMODS.Jokers[joker.slug].calculate=v.calculate
       --add jokers loc_def:
       SMODS.Jokers[joker.slug].loc_def=v.loc_def

       if(v.tooltip ~= nil) then
           SMODS.Jokers[joker.slug].tooltip=v.tooltip
       end
   end
   
end

--remove this section, this is to test
local Calculate_reroll_costRef = calculate_reroll_cost

function calculate_reroll_cost(skip_increment)
	Calculate_reroll_costRef(skip_increment)

	G.GAME.current_round.reroll_cost = 0
end
----------------------------------------------
------------MOD CODE END----------------------
