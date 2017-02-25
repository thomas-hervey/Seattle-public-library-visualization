 SELECT DISTINCT
    spl.deweyClass.bibNumber, spl.deweyClass.deweyClass
FROM
    spl.deweyClass
        INNER JOIN
    spl.itemToBib
        INNER JOIN
    spl.itemType
        INNER JOIN
    spl3.x_splOrgWebScraping ON spl.deweyClass.bibNumber = spl.itemToBib.bibNumber
        AND spl.itemToBib.itemNumber = spl.itemType.itemNumber
        AND spl3.x_splOrgWebScraping.bib = spl.deweyClass.bibNumber
WHERE
    type >= 2006
        AND deweyClass.bibNumber = 2321358
        and deweyClass.deweyClass >= 1
        AND (itemType = 'acbk' OR itemType = 'arbk'
        OR itemType = 'bcbk'
        OR itemType = 'drbk'
        OR itemType = 'jcbk'
        OR itemType = 'jrbk')