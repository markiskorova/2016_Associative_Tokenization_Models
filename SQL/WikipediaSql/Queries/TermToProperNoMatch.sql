--Select * From AmmAllTerms Where WordText='smile'

--Select * From AmmAllProper Where title like '%smile%'

SELECT    Top 10000    AmmAllTerms.WordText, AmmAllProper.title
FROM            AmmAllProper, AmmAllTerms
                           
Where 
Len(WordText) > 2
And AmmAllTerms.TermType='S'
And title not like '%(%'
And
	(title Like '% ' + WordText
  or title Like WordText + ' %'
  or title Like '% ' + WordText + ' %'
  or title = WordText
	)

