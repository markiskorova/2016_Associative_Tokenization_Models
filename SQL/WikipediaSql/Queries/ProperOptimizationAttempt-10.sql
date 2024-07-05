select Max(ProperId), WordText From AMM_Proper
Where 
(
	'.' + WordText + '.' LIKE '%[^a-z]' + 'gatsby' + '[^a-z]%'
or	'.' + WordText + '.' LIKE '%[^a-z]' + 'fitzgerald' + '[^a-z]%'
or	'.' + WordText + '.' LIKE '%[^a-z]' + 'tom' + '[^a-z]%'
or	'.' + WordText + '.' LIKE '%[^a-z]' + 'buchanan' + '[^a-z]%'
or	'.' + WordText + '.' LIKE '%[^a-z]' + 'fay' + '[^a-z]%'
or	'.' + WordText + '.' LIKE '%[^a-z]' + 'daisy' + '[^a-z]%'
or	'.' + WordText + '.' LIKE '%[^a-z]' + 'jordan' + '[^a-z]%'
)
Group by WordText

--select Max(ProperId) From AMM_Proper
--Where '.' + WordText + '.' LIKE '%[^a-z]' + 'fitzgerald' + '[^a-z]%'
--Group by WordText



--24
--23
--2 queries: 48
--combined:  47


/*select (ProperId), WordText From AMM_Proper
Where 
--WordText not Like '%(%)'
--And
(
		'.' + WordText + '.' LIKE '%[^a-z]' + 'gatsby' + '[^a-z]%'
--or	'.' + WordText + '.' LIKE '%[^a-z]' + 'daisy' + '[^a-z]%'
)
--Group By WordText
*/



