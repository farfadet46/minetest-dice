local maximus=10
local valeur_de = 0

minetest.register_chatcommand("dice_max", {
	func = function(name, param)
		if param == "" or tonumber(param) > 10 then
			minetest.chat_send_player(name, "------------------------------------")
			minetest.chat_send_player(name, " ** Parametres incorrects - Veuillez renseigner la valeur maximum du DE. Elle ne peut pas depasser 10. **")
			minetest.chat_send_player(name, "------------------------------------")
			minetest.chat_send_player(name, " ** Rappel de la valeur du DE : ".. valeur_de .." **")
			return
		else
		maximus = param
		minetest.chat_send_player(name, "La valeur maximum du dé est maintenant de : " ..param )
		end
	--	minetest.chat_send_all( "Le DE a fait : " ..param )
	end
	
})
--[[
minetest.register_chatcommand("triche", {
		minetest.chat_send_all( "/me a voullu tricher !")
	end
})
]]--
minetest.register_node("dice:blocos_1", {
	description = "Dice_1",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dice_blocos_1.png"},
	drop = "",
	inventory_image = "dice_blocos.png",
	wield_image = "dice_blocos_1.png",
	groups = {dig_immediate=3},
	sounds = default.node_sound_wood_defaults(),
	
	on_place = function(itemstack, placer, pointed_thing)
		valeur_de = math.random(1,maximus)
		local stack = ItemStack("dice:blocos_".. valeur_de)
		local ret = minetest.item_place(stack, placer, pointed_thing)
		minetest.chat_send_all( "Le DE a fait : " ..valeur_de )
	end,
})

for i=2,maximus do
	minetest.register_node("dice:blocos_"..i, {
		description = "Dice_"..i,
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		drop = "",
		tiles = {"dice_blocos_"..i..".png"},
		groups = {dig_immediate=3, not_in_creative_inventory=1},
		sounds = default.node_sound_wood_defaults(),
	})
end

--FIN DU FICHIER INIT
