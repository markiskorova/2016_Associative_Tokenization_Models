
Truncate Table AMM_ProcessProper


Declare @InputId bigint=10000001


--Insert Terms
Insert Into AMM_ProcessProper (ProperId, TotalWords, TotalWeight, KeyValue, InputId)
SELECT Distinct AMM_ProperToWord.ProperId, AMM_Proper_Snap_Weight.TotalWords, AMM_Proper_Snap_Weight.TotalWeight, AMM_ProcessInputTerm.KeyValue, @InputId
FROM            AMM_ProperToWord INNER JOIN
                         AMM_ProcessInputTerm ON AMM_ProperToWord.WordText = AMM_ProcessInputTerm.WordText AND AMM_ProcessInputTerm.KeyValue=0
						INNER JOIN
                         AMM_Proper_Snap_Weight ON AMM_ProperToWord.ProperId = AMM_Proper_Snap_Weight.ProperId
Where AMM_ProcessInputTerm.TermWeight >= 400
And AMM_ProcessInputTerm.TermId Not Between 990000 And 999999		--Cheap way to filter tiny terms for now


--Insert Key Terms
Insert Into AMM_ProcessProper (ProperId, Title, InputId, KeyValue, ToAssociate)
SELECT   0, AMM_ProcessInputTerm.WordText, @InputId, AMM_ProcessInputTerm.KeyValue, 1
FROM	AMM_ProcessInputTerm 						
Where InputId=@InputId
And AMM_ProcessInputTerm.KeyValue>0

--Link Keyterms to Proper 
Update AMM_ProcessProper Set AMM_ProcessProper.ProperId=AmmAllProperUnion.ProperId
FROM            AMM_ProcessProper INNER JOIN
                         AmmAllProperUnion ON AMM_ProcessProper.Title=AmmAllProperUnion.title
Where AMM_ProcessProper.InputId=@InputId

--Insert into Propers terms not found where value is>2 (input header info: title, author, etc...)
Insert Into AmmNewProper (title)
Select Title From AMM_ProcessProper Where ProperId=0 And KeyValue>2 And InputId=@InputId

--Remove keyterms with value >= 2 and no proper association
--Delete From AMM_ProcessProper Where ProperId<=2 And InputId=@InputId

--Link Keyterms to Proper (including inserted)
Update AMM_ProcessProper Set AMM_ProcessProper.ProperId=AmmAllProperUnion.ProperId
FROM            AMM_ProcessProper INNER JOIN
                         AmmAllProperUnion ON AMM_ProcessProper.Title=AmmAllProperUnion.title
Where AMM_ProcessProper.InputId=@InputId

Update AMM_ProcessProper Set AMM_ProcessProper.Title=AmmAllProperUnion.title
FROM            AMM_ProcessProper INNER JOIN
                         AmmAllProperUnion ON AMM_ProcessProper.ProperId = AmmAllProperUnion.ProperId
Where AMM_ProcessProper.InputId=@InputId




Update AMM_ProcessProper Set AMM_ProcessProper.TotalWords=AMM_Proper_Snap_Weight.TotalWords, AMM_ProcessProper.TotalWeight=AMM_Proper_Snap_Weight.TotalWeight
FROM            AMM_ProcessProper INNER JOIN
                         AMM_Proper_Snap_Weight ON AMM_ProcessProper.ProperId = AMM_Proper_Snap_Weight.ProperId
Where InputId=@InputId
And KeyValue>0

Update AMM_ProcessProper Set TotalWords = (LEN(Title)-LEN(REPLACE(Title,' ',''))+1)
Where InputId=@InputId
And KeyValue>0

Update AMM_ProcessProper Set CountedWords=TotalWords
Where InputId=@InputId
And KeyValue>0



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
	And KeyValue=0



Update AMM_ProcessProper Set CountedWords=TotalWords
Where InputId=@InputId
And KeyValue>0



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


Update AMM_ProcessProper Set TotalWeight=1000*TotalWords
Where InputId=@InputId
And TotalWeight=0
And KeyValue>0




Update AMM_ProcessProper Set CountedWeightDistinct=TotalWeight
Where InputId=@InputId
And KeyValue>0
And CountedWeightDistinct<TotalWeight




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


Update AMM_ProcessProper Set CountedWeightSum=CountedWeightDistinct
Where InputId=@InputId
And KeyValue>0
And CountedWeightSum=0



Update AMM_ProcessProper Set CountedWeightSum=CountedWeightSum*(KeyValue+1)
Where InputId=@InputId




Update AMM_ProcessProper Set ToAssociate=1
FROM            AMM_ProcessProper
Where AMM_ProcessProper.InputId=@InputId
And (
	(TotalWords=1 And CountedWords=1 And TotalWeight>1000 And CountedWeightSum>2000)
  Or
	(TotalWords=2 And CountedWords>=1 And TotalWeight>800 And CountedWeightDistinct>800 And CountedWeightSum>TotalWeight*7)
		Or
	(TotalWords=2 And TotalWeight>1000 And CountedWeightDistinct>1000 And CountedWeightSum>TotalWeight*4)
  Or
	(TotalWords>=3
	And (
			(TotalWeight>800 And CountedWeightDistinct>(400*(TotalWords-1)))
			And ((CountedWeightDistinct/CountedWords) > 800)
		)
	 And (CountedWeightDistinct>TotalWeight/2 And CountedWeightSum>TotalWeight*2))
	 )

Update AMM_ProcessProper Set ToAssociate=1 Where InputId=@InputId And KeyValue>0


Delete From AMM_ProcessProper Where CountedWeightSum=0 Or CountedWeightDistinct<333
Delete From AMM_ProcessProper Where IsNull(ToAssociate, 0)=0