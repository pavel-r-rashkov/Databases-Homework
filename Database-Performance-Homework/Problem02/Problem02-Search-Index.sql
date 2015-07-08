CREATE INDEX IX_Games_GameDate
ON Games (GameDate)

-- clear cache
DBCC DROPCLEANBUFFERS;

SET STATISTICS IO  ON
SET STATISTICS TIME  ON

SELECT * FROM Games
WHERE GameDate BETWEEN GETDATE() AND DATEADD(HOUR, 5, GETDATE())