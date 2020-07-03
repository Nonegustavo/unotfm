onEvent("PopupAnswer", function(id, p, msg)
	if p == OWNER then
		if id == 10 then
			ui.removeTextArea(99999, p)
			if #msg <= 140 and #msg ~= 0 then
				CONFIG.custom.desc = msg
				window.update(p, "CUSTOM")
			else
				tfm.exec.chatMessage("<r>"..translate(p, "CUSTOM_ERROR"), p)
			end
		elseif id >= 1 and id <= 5 then
			ui.removeTextArea(99999, p)
			if #msg>0 and customValidAmount(id, msg) then
				customEditAction(p, id, "amount", msg)
				window.update(p, "CUSTOM")
			else
				tfm.exec.chatMessage("<r>"..translate(p, "CUSTOM_ERROR"), p)
			end
		end
	end
end)