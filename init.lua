--By @Farfadet46

local maximus=10
local value_of = 0

-- Load support for MT game translation.
local S = minetest.get_translator("dice")

minetest.register_chatcommand("dice_max", {
	func = function(name, param)
		if param == "" or tonumber(param) > maximus then
			minetest.chat_send_player(name, "------------------------------------")
			minetest.chat_send_player(name, S("** Incorrect settings - Please set a maximum value for the DICE. It can't be upper than 10.**."))
			minetest.chat_send_player(name, "------------------------------------")
			minetest.chat_send_player(name, S("** Reminder, the value of the DICE is @1 **",param))
			return
		else
		maximus = param
		minetest.chat_send_player(name, S("The maximum value of the DICE is now : @1",param))
		end
	end
	
})

minetest.register_node("dice:blocos", {
	description = S("Dice"),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dice_blocos.png"},
	drop = "",
	inventory_image = "dice_blocos.png",
	wield_image = "dice_blocos.png",
	groups = {dig_immediate=3},
	sounds = default.node_sound_wood_defaults(),
	
	on_place = function(itemstack, placer, pointed_thing)
		value_of = math.random(1,maximus)
		local stack = ItemStack("dice:blocos_".. value_of)
		local ret = minetest.item_place(stack, placer, pointed_thing)
		minetest.chat_send_all( S("The DICE did : @1",value_of) )
	end,
})

for i=1,maximus do
	minetest.register_node("dice:blocos_"..i, {
		description = S("Dice_@1",i),
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
