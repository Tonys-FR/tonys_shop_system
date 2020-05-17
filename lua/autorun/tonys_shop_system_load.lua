local function TSSLoadFile(fdir)
	local files,dirs = file.Find(fdir.."*", "LUA")

	for _,file in ipairs(files) do
		if string.match(file, ".lua") then 
			if SERVER then 
				print("[Tony Shop System] All files is started ! | version 1.0.1")
				AddCSLuaFile(fdir..file)
			end
				include(fdir..file)
		end
	end

	for _,dir in ipairs(dirs) do 
		TSSLoadFile(fdir..dir.."/")
	end
end

TSSLoadFile("tss/")