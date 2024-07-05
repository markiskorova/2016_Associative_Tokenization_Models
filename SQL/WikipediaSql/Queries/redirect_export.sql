SELECT    top 1000    rd_from, rd_namespace, rd_title, rd_interwiki, rd_fragment
FROM            redirect_export
--where rd_interwiki<>''