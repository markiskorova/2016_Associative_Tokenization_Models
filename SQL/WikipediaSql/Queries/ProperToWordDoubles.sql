
SELECT        TOP (200) AMM_ProperToWord.ProperId, AMM_ProperToWord.WordText, AMM_ProperToWord_Snap_Count.WordCount
FROM            AMM_ProperToWord LEFT OUTER JOIN
                         AMM_ProperToWord_Snap_Count ON AMM_ProperToWord.WordText = AMM_ProperToWord_Snap_Count.WordText
Order By ProperId





--Select Count(*) From AMM_ProperToWord

--Select Top 1000 * From AMM_ProperToWord