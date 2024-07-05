--ProcessTermsList

Declare @InputId bigint = 10000001




--Get Weight from Snap Count
Update        AMM_ProcessInputTerm Set TermWeight=AMM_ProperToWord_Snap_Count.[Weight]
FROM            AMM_ProperToWord_Snap_Count INNER JOIN
                         AMM_ProcessInputTerm ON AMM_ProperToWord_Snap_Count.WordText = AMM_ProcessInputTerm.WordText
Where AMM_ProcessInputTerm.InputId=@InputId --And KeyValue=0



--Get max TermId from AmmAllTerms
Update        AMM_ProcessInputTerm Set TermID=AmmAllTermxMaxId.TermId
FROM            AMM_ProcessInputTerm INNER JOIN
                         AmmAllTermxMaxId ON AMM_ProcessInputTerm.WordText = AmmAllTermxMaxId.WordText
Where AMM_ProcessInputTerm.InputId=@InputId --And KeyValue=0

--Look for Variations
Update        AMM_ProcessInputTerm Set TermID=AmmAllTermxMaxId.TermId
FROM            AmmAllTermxMaxId INNER JOIN AMM_ProcessInputTerm 
					ON 
		(AMM_ProcessInputTerm.WordText=AmmAllTermxMaxId.WordText+'s'
	Or	AMM_ProcessInputTerm.WordText=AmmAllTermxMaxId.WordText+'''s'
	Or	AMM_ProcessInputTerm.WordText=AmmAllTermxMaxId.WordText+''''
	Or	AMM_ProcessInputTerm.WordText=AmmAllTermxMaxId.WordText+'es'
	Or	AMM_ProcessInputTerm.WordText=AmmAllTermxMaxId.WordText+'ed'
	Or	AMM_ProcessInputTerm.WordText=AmmAllTermxMaxId.WordText+'ing'
	Or	AMM_ProcessInputTerm.WordText=AmmAllTermxMaxId.WordText+'ly'
	Or	AMM_ProcessInputTerm.WordText=AmmAllTermxMaxId.WordText+'d'
	Or	AMM_ProcessInputTerm.WordText=AmmAllTermxMaxId.WordText+'n''t'
	Or	AMM_ProcessInputTerm.WordText=AmmAllTermxMaxId.WordText+'''nt')
Where AMM_ProcessInputTerm.InputId=@InputId
	--And AmmAllTermxMaxId.TermType='S'
	And AMM_ProcessInputTerm.TermId=0 
	--And KeyValue=0


--Get TermID from AmmNewTerms where not found in AmmAllTerms
Update        AMM_ProcessInputTerm Set TermID=AmmNewTerms.TermId
FROM            AMM_ProcessInputTerm INNER JOIN
                         AmmNewTerms ON AMM_ProcessInputTerm.WordText = AmmNewTerms.WordText
Where AMM_ProcessInputTerm.InputId=@InputId
	And AMM_ProcessInputTerm.TermID=0 --And KeyValue=0

--Insert new terms into AmmNewTerms
Insert Into AmmNewTerms (WordText)
	Select WordText From AMM_ProcessInputTerm 
	Where AMM_ProcessInputTerm.InputId=@InputId And TermId=0 And KeyValue=0

--Get TermID from newly added AmmNewTerms 
Update        AMM_ProcessInputTerm Set TermID=AmmNewTerms.TermId
FROM            AMM_ProcessInputTerm INNER JOIN
                         AmmNewTerms ON AMM_ProcessInputTerm.WordText = AmmNewTerms.WordText
Where AMM_ProcessInputTerm.InputId=@InputId
	And AMM_ProcessInputTerm.TermID=0 And KeyValue=0


--Add Value to Key Terms where no TermWeight was found
Update AMM_ProcessInputTerm Set TermWeight=100*KeyValue
Where InputId=@InputId
	And KeyValue>0
	And TermWeight=0


--Remove KeyTerms where len=1 or in tinyterms
Delete from AMM_ProcessInputTerm
Where InputId=@InputId
	And (
		KeyValue>0  
			And (
			(Len(WordText)=1) Or (TermId Between 990000 And 999999)
			)
		)



































----Get Weight from Snap Count
--Update        AMM_ProcessInputTerm Set TermWeight=AMM_ProperToWord_Snap_Count.[Weight]
--FROM            AMM_ProperToWord_Snap_Count INNER JOIN
--                         AMM_ProcessInputTerm ON AMM_ProperToWord_Snap_Count.WordText = AMM_ProcessInputTerm.WordText
--Where AMM_ProcessInputTerm.InputId=@InputId

----Get max TermId from AmmAllTerms
--Update        AMM_ProcessInputTerm Set TermID=AmmAllTermxMaxId.TermId
--FROM            AMM_ProcessInputTerm INNER JOIN
--                         AmmAllTermxMaxId ON AMM_ProcessInputTerm.WordText = AmmAllTermxMaxId.WordText



----Get TermID from AmmNewTerms where not found in AmmAllTerms
--Update        AMM_ProcessInputTerm Set TermID=AmmNewTerms.TermId
--FROM            AMM_ProcessInputTerm INNER JOIN
--                         AmmNewTerms ON AMM_ProcessInputTerm.WordText = AmmNewTerms.WordText
--Where AMM_ProcessInputTerm.TermID=0

----Look for Variations
--SELECT        AmmAllTerms.TermId, AMM_ProcessInputTerm.WordText, AmmAllTerms.WordText AS RootWordText
--FROM            AmmAllTerms INNER JOIN AMM_ProcessInputTerm 
--					ON 
--		(AMM_ProcessInputTerm.WordText=AmmAllTerms.WordText+'s'
--	Or	AMM_ProcessInputTerm.WordText=AmmAllTerms.WordText+'''s'
--	Or	AMM_ProcessInputTerm.WordText=AmmAllTerms.WordText+''''
--	Or	AMM_ProcessInputTerm.WordText=AmmAllTerms.WordText+'es'
--	Or	AMM_ProcessInputTerm.WordText=AmmAllTerms.WordText+'ed'
--	Or	AMM_ProcessInputTerm.WordText=AmmAllTerms.WordText+'ing'
--	Or	AMM_ProcessInputTerm.WordText=AmmAllTerms.WordText+'ly'
--	Or	AMM_ProcessInputTerm.WordText=AmmAllTerms.WordText+'d')
--Where
--	AmmAllTerms.TermType='S'
--	And AMM_ProcessInputTerm.TermId=0



----Insert new terms into AmmNewTerms
--Insert Into AmmNewTerms (WordText)
--	Select WordText From AMM_ProcessInputTerm Where TermId=0

----Get TermID from newly added AmmNewTerms 
--Update        AMM_ProcessInputTerm Set TermID=AmmNewTerms.TermId
--FROM            AMM_ProcessInputTerm INNER JOIN
--                         AmmNewTerms ON AMM_ProcessInputTerm.WordText = AmmNewTerms.WordText
--Where AMM_ProcessInputTerm.TermID=0


--/*
--SELECT      AmmAllTermxMaxId.TermId, AmmAllTermxMaxId.WordText
--FROM            AMM_ProcessInputTerm INNER JOIN
--                         AmmAllTermxMaxId ON AMM_ProcessInputTerm.WordText = AmmAllTermxMaxId.WordText



--SELECT        AmmAllTerms.TermId, AMM_ProcessInputTerm.WordText, AmmAllTerms.WordText AS RootWordText
--FROM            AmmAllTerms INNER JOIN AMM_ProcessInputTerm 
--					ON 
--		(AMM_ProcessInputTerm.WordText=AmmAllTerms.WordText+'s'
--	Or	AMM_ProcessInputTerm.WordText=AmmAllTerms.WordText+'''s'
--	Or	AMM_ProcessInputTerm.WordText=AmmAllTerms.WordText+'es'
--	Or	AMM_ProcessInputTerm.WordText=AmmAllTerms.WordText+'ed'
--	Or	AMM_ProcessInputTerm.WordText=AmmAllTerms.WordText+'ing'
--	Or	AMM_ProcessInputTerm.WordText=AmmAllTerms.WordText+'ly'
--	Or	AMM_ProcessInputTerm.WordText=AmmAllTerms.WordText+'d')
--Where
--	AmmAllTerms.TermType='S'
----	AND TERM ID NOT ALREADY FOUND
--*/

