
--Select Count(*) From AMM_ProperToWord_Snap_Count

/*

Select top 10000 * from AMM_ProperToWord_Snap_Count
Where Weight<800
Order by WordCount 

*/



Declare @Max int, @Avg int, @StDev int
Select 
	@Max=Max(WordCount),		--As [Max],
	@Avg=AVG(WordCount),		--As [AVG],
	@StDev=STDEV(WordCount)		--As [STDEV]
	--STDEVP(WordCount) As [STDEVP] 
From AMM_ProperToWord_Snap_Count

Select top 1000 WordText, WordCount, ((WordCount-@Avg)/@StDev) As DevAbove
From AMM_ProperToWord_Snap_Count
--Where WordCount between (@Max/2)-100 And (@Max/2)+100
Order by ((WordCount-@Avg)/@StDev) Desc



--Declare @Med int
--SELECT @Med = (
--   (SELECT MAX(WordCount) FROM (SELECT TOP 50 PERCENT WordCount FROM AMM_ProperToWord_Snap_Count Order by WordCount) As t)
-- + (SELECT MIN(WordCount) FROM (SELECT TOP 50 PERCENT WordCount FROM AMM_ProperToWord_Snap_Count Order by WordCount Desc) As b)
--) / 2



--Select top 1000 WordText, (WordCount-@Avg)/@StDev As NoStdDev
--From AMM_ProperToWord_Snap_Count
--Order by (WordCount-@Avg)/@StDev Desc




