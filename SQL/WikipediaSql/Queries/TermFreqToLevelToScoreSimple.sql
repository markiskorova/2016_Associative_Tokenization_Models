use [AMM]
Go


Declare @Freq int = 500		--Variable WordCount (Frequency)

Declare @Total int = 1000
Declare @Avg float
Declare @Rank int


--SELECT	@Avg=AVG(Cast(WordCount As float))
--FROM	AMM_ProperToWord_Snap_Count
--Select @Avg

Set @Avg=11.2457

Set @Rank = @Total*(1-LOG(@Freq/@Avg, 2)/10)


If @Rank < 0 Begin Set @Rank = 0 End

Select @Rank







