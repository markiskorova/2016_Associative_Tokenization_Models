SELECT [enwiki-20160407-all-titles-in-ns0].page_title, Cast(1 as bit) As ns0
FROM [enwiki-20160407-all-titles-in-ns0]

Union

SELECT        [enwiki-20160407-all-titles].page_title, Cast(0 as bit) As ns0
From [enwiki-20160407-all-titles]



