return {
	s(
		{
			trig = "fn",
			dscr = "Function boilerplate",
		},
		fmt(
			[[
				func <>(<>) <> {
					<>
				}
			]],
			{
				i(1, "name"),
				i(2, "params"),
				i(3, "returns"),
				i(0, "body"),
			},
			{
				delimiters = "<>",
			}
		)
	),

	s(
		{
			trig = "nrfn",
			dscr = "Function boilerplate with no return val",
		},
		fmt(
			[[
				func <>(<>) {
					<>
				}
			]],
			{
				i(1, "name"),
				i(2, "params"),
				i(0, "body"),
			},
			{
				delimiters = "<>",
			}
		)
	),

}
