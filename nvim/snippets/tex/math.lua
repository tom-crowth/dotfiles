-- To get visual select & replace (see tii)
local get_visual = function(args, parent)
	if (#parent.snippet.env.LS_SELECT_RAW > 0) then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else
		return sn(nil, i(1))
	end
end


return {

	s(
		{ trig = ";a", snippetType = "autosnippet" },
		{ t("\\alpha") }
	),
	s(
		{ trig = ";b", snippetType = "autosnippet" },
		{ t("\\beta") }
	),
	s(
		{ trig = ";g", snippetType = "autosnippet" },
		{ t("\\gamma") }
	),
	s(
		{ trig = "tt", dscr = "Expands tt into \texttt{}" },
		{
			t("\\texttt{"),
			i(1),
			t("}"),
		}
	),
	s(
		{ trig = "eq", dscr = "A LaTeX equation environment" },
		fmt(
			[[
				\begin{equation}
					<>
				\end{equation}
			]],
			{ i(1) },
			{ delimiters = "<>" }
		)
	),
	s(
		{ trig = "env", snippetType = "autosnippet" },
		fmta(
			[[
				\begin{<>}
					<>
				\end{<>}
			]],
			{
				i(1), i(2), rep(1),
			}
		)
	),

	s(
		{ trig = "hr", dscr = "The hyperref package's href{}{} command" },
		fmta(
			[[\href{<>}{<>}]],
			{
				i(1, "url"),
				i(2, "display name"),
			}
		)
	),

	s(
		{ trig = "tii", dscr = "Expands tii around selected text" },
		fmta(
			"\\textit{<>}",
			{ d(1, get_visual) }
		)
	),

}
