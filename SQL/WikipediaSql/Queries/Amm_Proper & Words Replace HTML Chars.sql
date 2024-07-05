
Delete From AMM_ProperToWord Where WordText in ('!')

/*
Select top 100 WordText From AMM_ProperToWord
Where WordText like '%?%'
*/

/*
--Update AMM_Proper Set WordText=Replace(WordText,'&amp;','&')
Update AMM_ProperToWord Set WordText=Replace(WordText,'!','')
*/


/*
Update AMM_Proper Set WordText=Ltrim(Rtrim(WordText))
Update AMM_ProperToWord Set WordText=Ltrim(Rtrim(WordText))
*/



