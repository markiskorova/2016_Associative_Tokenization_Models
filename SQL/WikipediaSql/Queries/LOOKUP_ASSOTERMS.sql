Declare @Lookup varchar(255) = 'Artificial Intelligence'

--'Artificial Intelligence'
--'Anonymous'
--'Robot'


SELECT        TOP (100) AmmAllTermsUnion.WordText, SUM(AMM_Association.Weight*AMM_ProperToWord_Snap_Count.Weight) AS WeightSum, CAST(LOG(SUM(AMM_Association.Weight*AMM_ProperToWord_Snap_Count.Weight), 2) AS Decimal(10, 1)) AS WeightRank
FROM            AmmAllTermsUnion INNER JOIN
                         AMM_NodeToTerm ON AmmAllTermsUnion.TermId = AMM_NodeToTerm.TermId INNER JOIN
                         AMM_Association ON AMM_NodeToTerm.NodeId = AMM_Association.NodeId INNER JOIN
                         AMM_ProperToWord_Snap_Count ON AmmAllTermsUnion.WordText = AMM_ProperToWord_Snap_Count.WordText

Where AMM_Association.AssoId in (Select AssoId From AMM_Association Where NodeId in
									(SELECT	AMM_NodeToTerm.NodeId
										FROM	AMM_NodeToTerm INNER JOIN
												AmmAllTermsUnion ON AMM_NodeToTerm.TermId = AmmAllTermsUnion.TermId
										Where AmmAllTermsUnion.WordText like '%' + @Lookup + '%')
									)

Group By AmmAllTermsUnion.WordText, AMM_ProperToWord_Snap_Count.Weight
Order by CAST(LOG(SUM(AMM_Association.Weight), 10)*AMM_ProperToWord_Snap_Count.Weight AS Decimal(10, 1)) Desc