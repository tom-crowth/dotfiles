-- To get visual select & replace (see tii)
local get_visual = function(args, parent)
	if (#parent.snippet.env.LS_SELECT_RAW > 0) then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else
		return sn(nil, i(1))
	end
end


return {
	-- standard function snippet
	s(
		{
			trig = "def",
			dscr = "Set up a python function",
		},
		fmt(
			[[
			def <>(<>):
				<>

		]],
			{
				i(1, "func name"),
				i(2, "arguments"),
				i(3, "function body"),
			},
			{
				delimiters = "<>",
			}
		)
	),

	s(
		{
			trig = "main",
			dscr = "Set up the __main__ boilerplate",
		},
		fmt(
			[[
				if __name__ == '__main__':
					<>			

			]],
			{
				i(1, "main code"),
			},
			{
				delimiters = "<>",
			}
		)
	),

}
