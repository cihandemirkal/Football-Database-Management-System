
-- 1 - The stadium with the highest number of matches played:
select TOP 1 T.TeamName, S.StadiumName, count(*) as StadiumCount
from Matches M inner join Stadiums S on M.HomeTeam_Id = S.Team_Id
inner join Teams T on T.Team_Id = S.Team_Id 
group by TeamName, StadiumName
order by StadiumCount DESC


-- 2 - Ballon d’Or winning players:
select A.AwardName, P.FirstName, P.LastName, FP_Awards.Season_Id
from Awards A inner join FP_Awards on A.Award_Id = FP_Awards.Award_Id
inner join FootballPlayers P on P.FootballPlayer_Id = FP_Awards.FootballPlayer_Id
where A.Award_Id = 8
order by FP_Awards.Season_Id


-- 3 - 8.  the player's injury history:
select FP.FirstName,FP.LastName, I.Type_of_Injury, H.History_of_Injury, H.Duration_of_Injury    
from Injuries I inner join FP_HealthStatus H on I.Injury_Id = H.Injury_Id
inner join FootballPlayers FP on FP.FootballPlayer_Id = H.FootballPlayer_Id
where FP.FootballPlayer_Id = 8
order by I.Type_of_Injury


-- 4 - The team that won the most awards:
SELECT T.TeamName, COUNT(*) AS TotalAwards
FROM Teams T
INNER JOIN TeamAwards TA ON T.Team_Id = TA.Team_Id
INNER JOIN Awards A ON TA.Award_Id = A.Award_Id
WHERE T.Team_Id = (
  SELECT TOP 1 Team_Id
  FROM TeamAwards
  GROUP BY Team_Id
  ORDER BY COUNT(*) DESC
)
GROUP BY T.TeamName;


-- 5 - The player without a team:
select FP.FirstName + ' ' + FP.LastName as 'Fullname', T.TeamName
from FootballPlayers FP left join Teams T
on FP.Team_Id = T.Team_Id
where T.Team_Id is null
order by FirstName 


-- 6 - The manager with the most players:
select TOP 1 MN.FirstName, MN.LastName, MN.Email, COUNT(*) as MNCount
from Managers MN inner join FootballPlayers FP 
on MN.Manager_Id = FP.Manager_Id
group by MN.FirstName, MN.LastName, MN.Email
order by MNCount Desc


-- 7 - 3 players with high transfer costs:
select TOP 3 FP.FirstName, FP.LastName, TR.TransferFee, TR.TransferDate, O_T.TeamName as OldTeam, N_T.TeamName as NewTeam
from FootballPlayers FP inner join Transfers TR 
on FP.FootballPlayer_Id = TR.FootbalPlayer_Id
inner join Teams as N_T on TR.NewTeam_Id = N_T.Team_Id
inner join Teams as O_T on TR.OldTeam_Id = O_T.Team_Id
order by TR.TransferFee DESC


-- 8 - The player with the most goal contributions in the second season:
select TOP 1 FP.FirstName, FP.LastName, sum(FC.Goal + FC.Assist) as Total_GA
from FootballPlayers FP 
inner join FootballPlayerCareer FC on FP.FootballPlayer_Id = FC.FootballPlayer_Id
where FC.Season_Id = 2
group by FirstName, LastName
order by Total_GA Desc


-- 9 - Referee who has never officiated a match:
select R.FirstName + ' ' + R.LastName as 'Fullname', R.Nationality, R.Gender
from Referees R left join Matches M
on R.Referee_Id = M.Referee_Id
where M.Match_Id is null


-- 10 - The team with the most goals scored:
select Top 1 T.TeamName, SUM(M.HomeScore + M.AwayScore) as 'Total Goal'
from Teams T inner join Matches M on T.Team_Id = M.HomeTeam_Id or T.Team_Id = M.AwayTeam_Id 
group by T.TeamName
order by [Total Goal] Desc 


-- 11 - The top five matches with the largest goal differences:
select TOP 5 H_T.TeamName , A_T.TeamName, M.HomeScore, M.AwayScore, M.Season_Id, ABS(HomeScore - AwayScore) AS ScoreDiff
from Matches M
inner join Teams as H_T on M.HomeTeam_Id = H_T.Team_Id
inner join Teams as A_T on M.AwayTeam_Id = A_T.Team_Id
order by ScoreDiff Desc


-- 12 - Unemployed technical director:
select TD.FirstName, TD.LastName, TD.Nationality, TD.BirthDate, T.Team_Id 
from TechnicalDirectors TD left join Teams T
on TD.Team_Id = T.Team_Id
where TD.Team_Id is null







