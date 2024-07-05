Truncate Table AMM_Proper_Snap_Weight

Insert into AMM_Proper_Snap_Weight
	(ProperId, TotalWords, TotalWeight)

SELECT
	AMM_ProperToWord.ProperId, Count(AMM_ProperToWord.ProperId), Sum(AMM_ProperToWord_Snap_Count.Weight)
FROM	AMM_ProperToWord_Snap_Count INNER JOIN
                         AMM_ProperToWord ON AMM_ProperToWord_Snap_Count.WordText = AMM_ProperToWord.WordText
Group By AMM_ProperToWord.ProperId


--SELECT        ProperId, TotalWords, TotalWeight
--FROM            AMM_Proper_Snap_Weight



