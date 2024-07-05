SELECT        AMM_ProcessProper.ProperId, AMM_ProcessProper.TotalWords, AMM_ProcessProper.TotalWeight, AMM_ProcessProper.CountedWords, 
                         AMM_ProcessProper.CountedWeightDistinct, AMM_ProcessProper.CountedWeightSum, AMM_ProcessProper.KeyValue, AMM_ProcessProper.Title, 
                         AMM_ProperToWord_Snap_Count.Weight,
				Cast(CountedWeightDistinct As float),
				Cast(CountedWeightSum As Float),
				Cast(1500*(1-(Cast(CountedWeightDistinct As float)/Cast(CountedWeightSum As Float))) As Int),
				Cast((TotalWeight+1)*Cast(CountedWeightSum As Float)/Cast(CountedWeightDistinct As float)/10 As Int)
FROM            AMM_ProcessProper LEFT OUTER JOIN
                         AMM_ProperToWord_Snap_Count ON AMM_ProcessProper.Title = AMM_ProperToWord_Snap_Count.WordText

Order by Cast((TotalWeight+1)*Cast(CountedWeightSum As Float)/Cast(CountedWeightDistinct As float)/10 As Int) Desc







		 

