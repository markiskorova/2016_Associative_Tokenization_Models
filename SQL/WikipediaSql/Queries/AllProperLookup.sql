SELECT    Top 100    page_id, title
FROM            AmmAllProper
Where 
	(
	title Like '%Gatsby%'
	--or title Like '%Nick%'
	or title Like '%Carraway%'
	)
	And (title not like '%(%)%')
	And (title not like 'File:%' and title not like 'Wikipedia:%' and title not like 'Category:%')
Order by page_id


--SELECT   Top 10     AMM_NodeToProper.NodeId, AmmAllProper.page_id, AmmAllProper.title
--FROM            AMM_NodeToProper CROSS JOIN
--                         AmmAllProper
--Where title Like '%Great%'
----Where 'Gatsby' like '%' + Title + '%'
----	or 'Nick' like '%' + Title + '%'



