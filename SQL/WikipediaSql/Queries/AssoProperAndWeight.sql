SELECT        AMM_Asso.AssoId, AMM_WeightType.WeightTypeId, AMM_WeightType.WeightPerc, AMM_WeightType.Description, AMM_Node.NodeId, AmmAllProper.ProperId, 
                         AmmAllProper.title
FROM            AMM_WeightType INNER JOIN
                         AMM_Association ON AMM_WeightType.WeightTypeId = AMM_Association.WeightTypeId INNER JOIN
                         AMM_Asso ON AMM_Association.AssoId = AMM_Asso.AssoId INNER JOIN
                         AMM_Node ON AMM_Association.NodeId = AMM_Node.NodeId INNER JOIN
                         AMM_NodeToProper ON AMM_Node.NodeId = AMM_NodeToProper.NodeId INNER JOIN
                         AmmAllProper ON AMM_NodeToProper.ProperId = AmmAllProper.ProperId