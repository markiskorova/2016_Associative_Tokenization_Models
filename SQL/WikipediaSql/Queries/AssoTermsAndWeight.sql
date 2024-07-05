SELECT        AMM_Association.AssoId, AMM_WeightType.WeightTypeId, AMM_WeightType.WeightPerc, AMM_WeightType.Description, AMM_NodeToTerm.NodeId, 
                         AmmAllTerms.TermId, AmmAllTerms.WordText
FROM            AMM_WeightType INNER JOIN
                         AMM_Association ON AMM_WeightType.WeightTypeId = AMM_Association.WeightTypeId INNER JOIN
                         AMM_Asso ON AMM_Association.AssoId = AMM_Asso.AssoId INNER JOIN
                         AMM_NodeToTerm ON AMM_Association.NodeId = AMM_NodeToTerm.NodeId INNER JOIN
                         AmmAllTerms ON AMM_NodeToTerm.TermId = AmmAllTerms.TermId