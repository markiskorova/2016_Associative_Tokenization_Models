SELECT AMM_ProperToWord.ProperId, AMM_ProperToWord.WordText FROM AMM_ProperToWord INNER JOIN AMM_ProperToWord_Snap_Count ON AMM_ProperToWord.WordText = AMM_ProperToWord_Snap_Count.WordText 
Where AMM_ProperToWord.WordText In ('The','other','girl','Daisy','made','an','attempt','to','rise','she','leaned','slightly','forward','with','a','conscientious','expression','then','she','laughed','an','absurd','charming','little','laugh','and','I','laughed','too','and','came','forward','into','the','room','Tom','Buchanan','who','had','been','hovering','restlessly','about','the','room','stopped','and','rested','his','hand','on','my','shoulder','What','you','doing','Nick','You','will','I','answered','shortly','You','will','if','you','stay','in','the','East','Oh','I''ll','stay','in','the','East','don''t','you','worry','he','said','glancing','at','Daisy','and','then','back','at','me','as','if','he','were','alert','for','something','more','I''d','be','a','God','damned','fool','to','live','anywhere','else') 
And AMM_ProperToWord_Snap_Count.Weight >= 300

order by wordtext