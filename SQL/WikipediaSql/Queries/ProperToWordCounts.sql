
Select Top 200 WordText, Count(ProperId) As WordCount
From AMM_ProperToWord
Group By WordText
Order By Count(ProperId)


Select Top 10 WordText, Count(ProperId) As WordCount
From AMM_ProperToWord
Group By WordText
Order By Count(ProperId) Desc


--Select Count(*) From AMM_ProperToWord

--Select Top 1000 * From AMM_ProperToWord