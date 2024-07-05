SELECT    Top 2000     Min(ProperId), title As ProperText
FROM            AmmAllProper
Where 

title like '%being%'
 or title like '%person%'
 or title like '%matter%'
 or title like '%infinite%'
 or title like '%preoccupation%'
 or title like '%turning%'
 or title like '%quivering%'
 or title like '%habit%'
 or title like '%feel%'
 or title like '%deal%'
 or title like '%express%'
 or title like '%young%'
 or title like '%world%'
 or title like '%college%'
 or title like '%still%'
 or title like '%privy%'
 or title like '%sign%'
 or title like '%levity%'
 or title like '%reserve%'
 or title like '%quality%'
 or title like '%hope%'
 or title like '%horizon%'
 or title like '%consequence%'
 or title like '%quick%'
 or title like '%mind%'
 or title like '%sense%'
 or title like '%normal%'
 or title like '%least%'
 or title like '%secret%'
 or title like '%fundamental%'
 or title like '%revelation%'
 or title like '%like%'
 or title like '%one%'
 or title like '%advice%'
 or title like '%unknown%'
 or title like '%birth%'
 or title like '%repeat%'
 or title like '%people%'
 or title like '%hostile%'
 or title like '%wild%'
 or title like '%Father%'
 or title like '%accused%'
 or title like '%intimate%'
 or title like '%great%'
 or title like '%politician%'
 or title like '%veteran%'
 or title like '%victim%'
 or title like '%More%'
 or title like '%terms%'
 or title like '%little%'
 or title like '%sleep%'
 or title like '%years%'
 or title like '%remember%'
 or title like '%forget%'
 or title like '%attach%'
 or title like '%detect%'
 or title like '%afraid%'
 or title like '%marred%'
 or title like '%unmistakable%'
 or title like '%communicative%'
 or title like '%realized%'
 or title like '%curious%'
 or title like '%made%'
 or title like '%plagiaristic%'
 or title like '%missing%'
 or title like '%understood%'
 or title like '%just%'
 or title like '%inclined%'
 or title like '%abnormal%'
 or title like '%many%'
 or title like '%some%'
 or title like '%most%'
 or title like '%obvious%'
 or title like '%opened%'
 or title like '%reserved%'
 or title like '%younger%'
 or title like '%feigned%'
 or title like '%vulnerable%'
 or title like '%unsought%'
 or title like '%frequently%'
 or title like '%usually%'
 or title like '%unusually%'
 or title like '%unjustly%'
 or title like '%unequally%'
 or title like '%snobbishly%'
 and title not like '%(%'
Group by title
Order by Min(page_id)






--Select Min(ProperId), title from AmmAllProper 

--Where title in ('being','person','matter','infinite','preoccupation','way','turning','quivering','habit','feel','deal','express','young','world','college','still','OR','privy','sign','levity','reserve','quality','hope','horizon','consequence','A','quick','mind','sense','normal','least','secret','fundamental','revelation','like','one','IT','AM','advice','AN','I','unknown','birth','repeat','people','men','few','hostile','wild','AS','IN','ME','Father','accused','intimate','great','politician','have','veteran','victim','More','terms','are','little','sleep','say','years','remember','forget','attach','detect','afraid','marred','unmistakable','communicative','realized','all','curious','made','plagiaristic','missing','understood','just','inclined','abnormal','many','some','most','obvious','opened','reserved','younger','feigned','any','vulnerable','unsought','always','ever','not','frequently','also','usually','unusually','unjustly','unequally','snobbishly')

--Group by title



--Select * From AmmAllTerms Where WordText='Fitzgerald'

--SELECT    Top 20     Min(ProperId), title As ProperText
--FROM            AmmAllProper
--Where 
--	title like '%Gatsby%'
--	and title not like '%(%'
--Group by title
--Order by Min(page_id)

--'being','person','matter','infinite','preoccupation','way','turning','quivering','habit','feel','deal','express','young','world','college','still','OR','privy','sign','levity','reserve','quality','hope','horizon','consequence','A','quick','mind','sense','normal','least','secret','fundamental','revelation','like','one','IT','AM','advice','AN','I','unknown','birth','repeat','people','men','few','hostile','wild','AS','IN','ME','Father','accused','intimate','great','politician','have','veteran','victim','More','terms','are','little','sleep','say','years','remember','forget','attach','detect','afraid','marred','unmistakable','communicative','realized','all','curious','made','plagiaristic','missing','understood','just','inclined','abnormal','many','some','most','obvious','opened','reserved','younger','feigned','any','vulnerable','unsought','always','ever','not','frequently','also','usually','unusually','unjustly','unequally','snobbishly'