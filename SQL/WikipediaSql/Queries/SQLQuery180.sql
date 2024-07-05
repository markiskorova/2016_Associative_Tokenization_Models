SELECT DISTINCT AMM_ProcessProper.ProperId, AmmAllProper.title
FROM            AMM_ProcessProper INNER JOIN
                         AmmAllProper ON AMM_ProcessProper.ProperId = AmmAllProper.ProperId
Where ToAssociate=1
Order by ProperId

/*
SELECT        InputId, ProperId, TotalWords, TotalWeight, CountedWords, CountedWeightDistinct, CountedWeightSum, ToAssociate
FROM            AMM_ProcessProper
Where ToAssociate=1
Order by ProperId
*/
