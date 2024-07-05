--LookupAssociationViewPart1

Declare @Lookup varchar(255) = 'Artificial Intelligence'




SELECT        AMM_Association.AssoId
FROM            AMM_NodeToProper INNER JOIN
                         AmmAllProperUnion ON AMM_NodeToProper.ProperId = AmmAllProperUnion.ProperId INNER JOIN
                         AMM_Association ON AMM_NodeToProper.NodeId = AMM_Association.NodeId
Where AmmAllProperUnion.title like '%' + @Lookup + '%'




--Select AssoId From AMM_Association Where NodeId in
--(SELECT	AMM_NodeToProper.NodeId
--FROM	AMM_NodeToProper INNER JOIN
--		AmmAllProperUnion ON AMM_NodeToProper.ProperId = AmmAllProperUnion.ProperId
--Where AmmAllProperUnion.title like '%' + @Lookup + '%')




--SELECT	AMM_NodeToProper.NodeId
--FROM	AMM_NodeToProper INNER JOIN
--		AmmAllProperUnion ON AMM_NodeToProper.ProperId = AmmAllProperUnion.ProperId
--Where AmmAllProperUnion.title like '%' + @Lookup + '%'

