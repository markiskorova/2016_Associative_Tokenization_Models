Declare @Lookup varchar(255) = 'Artificial Intelligence'

--'Artificial Intelligence'
--'Anonymous'
--'Robot'

SELECT		Top 40	AmmAllProperUnion.title, 
				Sum(AMM_Association.Weight) As WeightSum, 
				Cast(Log(Sum(AMM_Association.Weight), 2) As Decimal(10,1)) As WeightRank
FROM            AmmAllProperUnion INNER JOIN
                         AMM_NodeToProper ON AmmAllProperUnion.ProperId = AMM_NodeToProper.ProperId INNER JOIN
                         AMM_Association ON AMM_NodeToProper.NodeId = AMM_Association.NodeId

Where AMM_Association.AssoId in (Select AssoId From AMM_Association Where NodeId in
									(SELECT	AMM_NodeToProper.NodeId
										FROM	AMM_NodeToProper INNER JOIN
												AmmAllProperUnion ON AMM_NodeToProper.ProperId = AmmAllProperUnion.ProperId
										Where AmmAllProperUnion.title like '%' + @Lookup + '%')
									)

Group By AmmAllProperUnion.title
--Having Cast(Log(Sum(AMM_Association.Weight)) As Decimal(10,1))>6.666
Order by Sum(AMM_Association.Weight) Desc


--Order by Title












--Where AMM_Association.AssoId in (Select AssoId From AMM_Association Where NodeId=@NodeId)






--Declare @NodeId bigint

--SELECT	@NodeId=AMM_NodeToProper.NodeId
--FROM	AMM_NodeToProper INNER JOIN
--		AmmAllProperUnion ON AMM_NodeToProper.ProperId = AmmAllProperUnion.ProperId
--Where AmmAllProperUnion.title=@Lookup

--Select @NodeId

--Declare @SumLookup int