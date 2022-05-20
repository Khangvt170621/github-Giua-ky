use SPORT

SELECT d.madoi, d.maclb, td.maphg, COUNT(td.matd)
FROM DOI d, DOI_TD dtd, TRANDAU TD
WHERE d.maclb = dtd.maclb
    AND d.madoi = dtd.madoi
    AND dtd.matd = td.matd
    AND td.maphg = 49
GROUP BY d.madoi, d.maclb, td.maphg
HAVING COUNT(td.matd) = (
    SELECT COUNT(td.matd)
    FROM TRANDAU td 
    WHERE td.maphg = 49
)


SELECT * 
FROM VANDONGVIEN vdv
WHERE vdv.mavdv NOT IN(
    SELECT DISTINCT vdv.mavdv
    FROM VANDONGVIEN vdv, VDV_DOI vdvd, DOI_TD dtd
    WHERE vdv.maclb = dtd.maclb
        AND vdv.mavdv = vdvd.mavdv
        AND vdvd.madoi = dtd.madoi
)