-- To get visual select & replace (see tii)
local get_visual = function(args, parent)
	if (#parent.snippet.env.LS_SELECT_RAW > 0) then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else
		return sn(nil, i(1))
	end
end


return {

	-- Insert a standard basic snippet (for luasnip)
	s({
			trig = "snip",
			dscr = "Create the boilerplate for writing a new snippet",
		},
		fmt(
			[[
				s(
					{
						trig = "<>",
						dscr = "<>",

					},
					{ t("<>"), }
				),
			]],
			{
				i(1, "trigger"),
				i(2, "description"),
				i(3, "snip text"),
			},
			{
				delimiters = "<>",
			}

		)
	),

	-- A more complex snip with long formatting and arguments
	s(
		{
			trig = "csnip",
			dscr = "Boilerplate for a more complicated snippet",
		},
		fmt(
			[=[
				s(
					{
						trig = "<>",
						dscr = "<>",
					},
					fmt(
						[[
							<>
						]],
						{
							i(1, "<>"),
						},
						{
							delimiters = "<>",
						}
					)
				),
				
			]=],
			{
				i(1, "trigger"),
				i(2, "description"),
				i(3, "snippet formatted text"),
				i(4, "arg text"),
				i(5, "<>"),
			},
			{
				delimiters = "<>",
			}
		)
	),

	-- to add more snip arguments after csnip
	s(
		{
			trig = "snarg",
			dscr = "An argument for a snippet",
		},
		fmt(
			[[
				i(<>, "<>"),
			]],
			{
				i(1, "num"),
				i(2, "arg name"),
			},
			{
				delimiters = "<>",
			}
		)
	),


	-- To return multiple snippets, use one 'return' statement per snippet
	-- and return a table of Lua snippets
	-- s(
	-- 	{ trig = "foo" },
	-- 	{ t("Another snippet.") }
	-- ),

}
