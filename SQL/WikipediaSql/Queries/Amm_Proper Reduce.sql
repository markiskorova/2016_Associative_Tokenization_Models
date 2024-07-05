--Update AMM_Proper Set WordText = Replace(WordText,')',' ')

--Update AMM_Proper Set WordText = RTRIM(WordText)


--Select top 100 * From AMM_Proper Where WordText Like '%(disambiguation)%'

--Select top 100 WordText from Amm_ProperToWord Where WordText = '-'

Select distinct (WordText) From Amm_ProperToWord Where Len(WordText) = 2

--Delete From Amm_ProperToWord Where WordText = '-'

/*
Select top 100 * From AMM_Proper Where WordText = 'National Coalition'
Order by WordText
*/



