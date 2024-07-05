--Declare @Text varchar(8000) = '“How do you get to West Egg village ?” he asked helplessly.
--I lived at West Egg, the — well, the less fashionable of the two, though this is a most superficial tag to express the bizarre and not a little sinister contrast between them.My house was at the very tip of the egg, only fifty yards from the Sound, and squeezed between two huge places that rented for twelve or fifteen thousand a season.The one on my right was a colossal affair by any standard — it was a factual imitation of some Hotel de Ville in Normandy, with a tower on one side, spanking new under a thin beard of raw ivy, and a marble swimming pool, and more than forty acres of lawn and garden.It was Gatsby’s mansion.Or, rather, as I didn’t know Mr.Gatsby, it was a mansion inhabited by a gentleman of that name.My own house was an eyesore, but it was a small eyesore, and it had been overlooked, so I had a view of the water, a partial view of my neighbor’s lawn, and the consoling proximity of millionaires — all for eighty dollars a month.
--Across the courtesy bay the white palaces of fashionable East Egg glittered along the water, and the history of the summer really begins on the evening I drove over there to have dinner with the Tom Buchanans. Daisy was my second cousin once removed, and I’d known Tom in college.And just after the war I spent two days with them in Chicago.
--He had changed since his New Haven years. Now he was a sturdy straw-haired man of thirty with a rather hard mouth and a supercilious manner.Two shining arrogant eyes had established dominance over his face and gave him the appearance of always leaning aggressively forward. Not even the effeminate swank of his riding clothes could hide the enormous power of that body — he seemed to fill those glistening boots until he strained the top lacing, and you could see a great pack of muscle shifting when his shoulder moved under his thin coat. It was a body capable of enormous leverage — a cruel body.
--The other girl, Daisy, made an attempt to rise — she leaned slightly forward with a conscientious expression — then she laughed, an absurd, charming little laugh, and I laughed too and came forward into the room.
--At any rate, Miss Baker’s lips fluttered, she nodded at me almost imperceptibly, and then quickly tipped her head back again — the object she was balancing had obviously tottered a little and given her something of a fright.Again a sort of apology arose to my lips. Almost any exhibition of complete self-sufficiency draws a stunned tribute from me.
--Tom Buchanan, who had been hovering restlessly about the room, stopped and rested his hand on my shoulder.
--“What you doing, Nick?”
--“You live in West Egg,” she remarked contemptuously. “I know somebody there.”
--“You must know Gatsby.”
--“Gatsby?” demanded Daisy. “What Gatsby?”'

--@Text like '%' + title + '%'



SELECT    Top 20    page_id, title
FROM            AmmAllProper
Where 
	title Like '%Gatsby%'
	And (title not like 'File:%' and title not like 'Wikipedia:%' and title not like 'Category:%') 
Order by page_id

