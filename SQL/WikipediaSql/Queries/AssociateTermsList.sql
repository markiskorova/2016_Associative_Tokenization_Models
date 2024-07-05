--AssociateTermsList

Declare @InputId bigint = 10000001

--Associate Terms

--Find Nodes
Update        AMM_ProcessInputTerm Set AMM_ProcessInputTerm.NodeId=AMM_NodeToTerm.NodeId
FROM            AMM_NodeToTerm INNER JOIN
                         AMM_ProcessInputTerm ON AMM_NodeToTerm.TermId=AMM_ProcessInputTerm.TermId
Where InputId=@InputId


--Insert Nodes where there are none
Declare @TermId int
Declare @NodeId bigint

DECLARE dcursor CURSOR FOR  
Select TermId From AMM_ProcessInputTerm Where InputId=@InputId And NodeId=0

OPEN dcursor
FETCH NEXT FROM dcursor INTO @TermId

WHILE @@FETCH_STATUS = 0   
BEGIN   
	
	Insert Into AMM_Node Default Values
	Select @NodeId = @@IDENTITY

	Insert Into AMM_NodeToTerm (NodeId, TermId)
	Values (@NodeId, @TermId)
	
	FETCH NEXT FROM dcursor INTO @TermId
END   

Deallocate dcursor

--Find new Nodes
Update        AMM_ProcessInputTerm Set AMM_ProcessInputTerm.NodeId=AMM_NodeToTerm.NodeId
FROM            AMM_NodeToTerm INNER JOIN
                         AMM_ProcessInputTerm ON AMM_NodeToTerm.TermId=AMM_ProcessInputTerm.TermId
Where InputId=@InputId


--Associate Nodes by Text
Declare @AssoId bigint

Insert Into Amm_Asso Default Values
Select @AssoId=@@IDENTITY

Insert Into AMM_Association
	(NodeId, AssoId, WeightTypeId)
	Select NodeId, @AssoId, 115 From AMM_ProcessInputTerm Where InputId=@InputId

Declare @ParaIndex int

--Associate Nodes by Paragraph
DECLARE pcursor CURSOR FOR  
Select distinct ParaIndex From AMM_ProcessInputTerm Where InputId=@InputId

OPEN pcursor
FETCH NEXT FROM pcursor INTO @ParaIndex

WHILE @@FETCH_STATUS = 0   
BEGIN   
	
Insert Into Amm_Asso Default Values
Select @AssoId=@@IDENTITY

Insert Into AMM_Association
	(NodeId, AssoId, WeightTypeId)
	Select NodeId, @AssoId, 113 From AMM_ProcessInputTerm Where InputId=@InputId And ParaIndex=@ParaIndex
	
	FETCH NEXT FROM pcursor INTO @ParaIndex
END

Deallocate pcursor

  