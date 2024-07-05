--Select Top 100 ProperId, Count(WordText)
--From AMM_ProperToWord
--Group By ProperId

--Select Top 100 * FRom Amm_Proper_Snap_Weight
--Select * From Amm_Proper Where ProperId=15601719


/*
Truncate Table AMM_ProperToWord_Snap_Count

Insert Into AMM_ProperToWord_Snap_Count
	(WordText, WordCount)
Select WordText, Count(ProperId)
From AMM_ProperToWord
Group By WordText
*/


Declare @Total int = 1000
Declare @Avg float


--SELECT	@Avg=AVG(Cast(WordCount As float))
--FROM	AMM_ProperToWord_Snap_Count
--Select @Avg

Set @Avg=11.2457

Update AMM_ProperToWord_Snap_Count 
Set [Weight]=@Total*(1-LOG(WordCount/@Avg, 2)/10)

Update AMM_ProperToWord_Snap_Count
Set [Weight] = 0 Where Weight<0



/*
Update AMM_ProperToWord_Snap_Count 
Set AMM_ProperToWord_Snap_Count.[Weight] = Math_ProperWeightCalcRange.B
FROM            AMM_ProperToWord_Snap_Count INNER JOIN
                         Math_ProperWeightCalcRange ON AMM_ProperToWord_Snap_Count.WordCount Between Math_ProperWeightCalcRange.Amin And Math_ProperWeightCalcRange.Amax

*/

/*
Declare @MaxCount int
Select @MaxCount=Max(WordCount) From AMM_ProperToWord_Snap_Count
Update AMM_ProperToWord_Snap_Count Set Weight=Cast(1000-(1000*Power(WordCount, 0.2)/Power(@MaxCount, 0.2)) As int)
*/






--SELECT   top 100     AMM_ProperToWord_Snap_Count.WordCount, Math_ProperWeightCalcRange.Amin, Math_ProperWeightCalcRange.Amax, Math_ProperWeightCalcRange.B
--FROM            AMM_ProperToWord_Snap_Count INNER JOIN
--                         Math_ProperWeightCalcRange ON AMM_ProperToWord_Snap_Count.WordCount Between Math_ProperWeightCalcRange.Amin And Math_ProperWeightCalcRange.Amax
--Where WordCount>10


/*
Declare @sq float
Set @sq = Power(1000, 0.5)
Select @sq

*/
