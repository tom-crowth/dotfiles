local ls = require("luasnip")
-- local s = ls.snippet

-- To get visual select & replace (see tii)
local get_visual = function(args, parent)
	if (#parent.snippet.env.LS_SELECT_RAW > 0) then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else
		return sn(nil, i(1))
	end
end


return {
	-- A snippet that expands the trigger "hi" into the string "Hello, world!"
	s(
		{
			trig = "hi",
			dscr = "An autotriggering snippet that expands hi into hello world",
			regTrig = false,
			priority = 100,
			-- snippetType = "autosnippet",
		},

		{
			t("Hello, world!"),
		}
	),

	-- To return multiple snippets, use one 'return' statement per snippet
	-- and return a table of Lua snippets
	s(
		{ trig = "foo" },
		{ t("Another snippet.") }
	),

	-- put the latex stuff here for now until it's fixed


}
