Select TermId, TermType, WordText
FROM AmmAllTerms

Union

Select TermId, 'S' As TermType, WordText
From AmmNewTerms




