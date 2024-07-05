SELECT    Top 20     Min(ProperId), title As ProperText
FROM            AmmAllProper
Where 
	title like '%Gatsby%'
	and title not like '%(%'
Group by title
Order by Min(page_id)