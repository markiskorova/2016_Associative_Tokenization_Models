USE [AMM]
GO

/****** Object:  StoredProcedure [dbo].[ProcessTermsList]    Script Date: 5/10/2016 3:37:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[ProcessPropers]
	@InputId bigint
AS
BEGIN

SET NOCOUNT ON;


Insert Into AMM_ProcessProper (ProperId, TotalWords, TotalWeight, InputId)
SELECT Distinct AMM_ProperToWord.ProperId, AMM_Proper_Snap_Weight.TotalWords, AMM_Proper_Snap_Weight.TotalWeight, @InputId
FROM            AMM_ProperToWord INNER JOIN
                         AMM_ProcessInputTerm ON AMM_ProperToWord.WordText = AMM_ProcessInputTerm.WordText INNER JOIN
                         AMM_Proper_Snap_Weight ON AMM_ProperToWord.ProperId = AMM_Proper_Snap_Weight.ProperId
Where AMM_ProcessInputTerm.TermWeight >= 400
And AMM_ProcessInputTerm.TermId Not Between 990000 And 999999		--Cheap way to filter tiny terms for now


Update AMM_ProcessProper Set CountedWords=TermCount From (Select Count(Distinct TermId) As TermCount, AMM_ProperToWord.ProperId
FROM            AMM_ProperToWord 
					INNER JOIN
						AMM_ProcessProper 
							ON AMM_ProperToWord.ProperId = AMM_ProcessProper.ProperId
					INNER JOIN
                         (Select Distinct WordText, TermId From AMM_ProcessInputTerm) As DInputTerm 
							ON AMM_ProperToWord.WordText = DInputTerm.WordText 
Group By AMM_ProperToWord.ProperId) As SP
					INNER JOIN
						AMM_ProcessProper 
							ON SP.ProperId = AMM_ProcessProper.ProperId
Where AMM_ProcessProper.InputId=@InputId


Update AMM_ProcessProper Set CountedWeightDistinct=SumWeight From (Select Sum(Distinct TermWeight) As SumWeight, AMM_ProperToWord.ProperId
FROM            AMM_ProperToWord 
					INNER JOIN
						AMM_ProcessProper 
							ON AMM_ProperToWord.ProperId = AMM_ProcessProper.ProperId
					INNER JOIN
                         (Select Distinct WordText, TermWeight From AMM_ProcessInputTerm) As DInputTerm 
							ON AMM_ProperToWord.WordText = DInputTerm.WordText 
Group By AMM_ProperToWord.ProperId) As SP
					INNER JOIN
						AMM_ProcessProper 
							ON SP.ProperId = AMM_ProcessProper.ProperId
Where AMM_ProcessProper.InputId=@InputId


Update AMM_ProcessProper Set CountedWeightSum=SumWeight From (Select Sum(TermWeight) As SumWeight, AMM_ProperToWord.ProperId
FROM            AMM_ProperToWord 
					INNER JOIN
						AMM_ProcessProper 
							ON AMM_ProperToWord.ProperId = AMM_ProcessProper.ProperId
					INNER JOIN
                         (Select WordText, TermWeight From AMM_ProcessInputTerm) As DInputTerm 
							ON AMM_ProperToWord.WordText = DInputTerm.WordText 
Group By AMM_ProperToWord.ProperId) As SP
					INNER JOIN
						AMM_ProcessProper 
							ON SP.ProperId = AMM_ProcessProper.ProperId
Where AMM_ProcessProper.InputId=@InputId


Update AMM_ProcessProper Set ToAssociate=1
FROM            AMM_ProcessProper INNER JOIN
                         AmmAllProper ON AMM_ProcessProper.ProperId = AmmAllProper.ProperId
Where AMM_ProcessProper.InputId=@InputId
And (
	(TotalWords=1 And CountedWords=1 And TotalWeight>1000 And CountedWeightSum>2000)
  Or
	(TotalWords=2 And CountedWords>=1 And TotalWeight>800 And CountedWeightDistinct>800 And CountedWeightSum>24000)
  Or
	(TotalWords=3
	And (
			(TotalWeight>800 And CountedWeightDistinct>(400*(TotalWords-1)))
			And ((CountedWeightDistinct/CountedWords) > 800)
		)
	 And (CountedWeightDistinct>TotalWeight/2 And CountedWeightSum>TotalWeight*2))
	 )





END

GO


