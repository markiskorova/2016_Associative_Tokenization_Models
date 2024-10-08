
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[GetSubmissionStatusId]
(
	@IsSuccess Bit,
	@IsOpened Bit,
	@IsProcessed Bit,
	@IsAccepted Bit,
	@IsNotified Bit
)
RETURNS Int
AS
BEGIN
	Declare @StatusId Int

	Select 
		@StatusId=SubmissionStatus_Id 
	From SubmissionStatus 
	Where 
		SubmissionStatus_Id > -1
		And @IsSuccess=@IsSuccess 
		And @IsOpened=@IsOpened 
		And @IsProcessed=@IsProcessed 
		And @IsAccepted=@IsAccepted 
		And @IsNotified=@IsNotified 
	
	If @StatusId Is Null
		Set @StatusId=-1
	
	Return @StatusId
END