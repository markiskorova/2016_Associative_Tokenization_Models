--LookupAssociationViewPart2



SELECT		Top 40	AmmAllProperUnion.title, 
				AMM_Association.Weight
FROM            AmmAllProperUnion INNER JOIN
                         AMM_NodeToProper ON AmmAllProperUnion.ProperId = AMM_NodeToProper.ProperId INNER JOIN
                         AMM_Association ON AMM_NodeToProper.NodeId = AMM_Association.NodeId






--SELECT		Top 40	AmmAllProperUnion.title, 
--				Sum(AMM_Association.Weight) As WeightSum, 
--				Cast(Log(Sum(AMM_Association.Weight), 2) As Decimal(10,1)) As WeightRank
--FROM            AmmAllProperUnion INNER JOIN
--                         AMM_NodeToProper ON AmmAllProperUnion.ProperId = AMM_NodeToProper.ProperId INNER JOIN
--                         AMM_Association ON AMM_NodeToProper.NodeId = AMM_Association.NodeId