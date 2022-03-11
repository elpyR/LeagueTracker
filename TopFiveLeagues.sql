-- create the leagues and teams --

CREATE TABLE Leagues(
	Id int IDENTITY NOT NULL,
	LeagueName nvarchar(50) NOT NULL,
	CountryCode char(2) NULL,
 CONSTRAINT PK_Leagues PRIMARY KEY (Id))
GO

CREATE TABLE Teams(
	Id int IDENTITY NOT NULL,
	TeamName nvarchar(50) NOT NULL,
	CountryCode char(2) NULL,
 CONSTRAINT PK_Teams PRIMARY KEY (Id))
GO

CREATE TABLE Leagues_Teams(
	LeagueId int NOT NULL,
	TeamId int NOT NULL,
 CONSTRAINT PK_Leagues_Teams PRIMARY KEY (LeagueId,	TeamId))
GO

-- insert leagues --

INSERT INTO Leagues(LeagueName, CountryCode) VALUES
 ('English Premier League', 'EN'),
 ('Italian Serie A', 'IT'),
 ('Spanish La Liga', 'ES'),
 ('German Bundesliga', 'DE'),
 ('French Ligue One', 'FR')
GO

--insert teams--

--English Premier League--

INSERT INTO Teams(TeamName, CountryCode) VALUES
 ('Brentford', 'EN'),
 ('Leicester City', 'EN'),
 ('Aston Villa', 'EN'),
 ('Wolves', 'EN'),
 ('Crystal Palace', 'EN'),
 ('Southampton', 'EN'),
 ('Newcastle United', 'EN'),
 ('Norwich', 'EN'),
 ('Tottenham Hotspur', 'EN'),
 ('Manchester United', 'EN'),
 ('Manchester City', 'EN'),
 ('Brighton', 'EN'),
 ('Chelsea', 'EN'),
 ('Burnley', 'EN'),
 ('West Ham United', 'EN'),
 ('Arsenal', 'EN'),
 ('Watford', 'EN'),
 ('Everton', 'EN'),
 ('Liverpool', 'EN'),
 ('Leeds', 'EN')
GO

--Assign the EN teams to "English Premier League"--
INSERT INTO Leagues_Teams(LeagueId, TeamId)
SELECT (SELECT MIN(Id) FROM Leagues WHERE LeagueName='English Premier League'), Id 
FROM Teams WHERE CountryCode='EN'
GO

--Italian Serie A--

INSERT INTO Teams(TeamName, CountryCode) VALUES
 ('AC Milan', 'IT'),
 ('Inter Milan', 'IT'),
 ('Lazio', 'IT'),
 ('Roma', 'IT'),
 ('Juventus', 'IT'),
 ('Napoli', 'IT'),
 ('Genoa', 'IT'),
 ('Atalanta', 'IT'),
 ('Fiorentina', 'IT'),
 ('Verona', 'IT'),
 ('Sassuolo', 'IT'),
 ('Torino', 'IT'),
 ('Venezia', 'IT'),
 ('Bologna', 'IT'),
 ('Empoli', 'IT'),
 ('Sampdoria', 'IT'),
 ('Udinese', 'IT'),
 ('Spezia', 'IT'),
 ('Cagliari', 'IT'),
 ('Salernitana', 'IT')
GO

--Assign the IT teams to "Italian Serie A"--
INSERT INTO Leagues_Teams(LeagueId, TeamId)
SELECT (SELECT MIN(Id) FROM Leagues WHERE LeagueName='Italian Serie A'), Id 
FROM Teams WHERE CountryCode='IT'
GO

--German Bundesliga--

INSERT INTO Teams(TeamName, CountryCode) VALUES
 ('Bayern Munich', 'DE'),
 ('Borussia Dortmund', 'DE'),
 ('Bayer Leverkussen', 'DE'),
 ('RB Leipzig', 'DE'),
 ('VFL Wolfsburg', 'DE'),
 ('Hoffenheim', 'DE'),
 ('Union Berlin', 'DE'),
 ('Mainz', 'DE'),
 ('Koln', 'DE'),
 ('Augsburg', 'DE'),
 ('Eintracht Frankfurt', 'DE'),
 ('Monchengladbach', 'DE'),
 ('VfL Bochum', 'DE'),
 ('Hertha Berlin', 'DE'),
 ('Arminia', 'DE'),
 ('VfB Stuttgart', 'DE'),
 ('Furth', 'DE'),
 ('SC Freiburg', 'DE')
GO

--Assign the DE teams to "German Bundesliga"--
INSERT INTO Leagues_Teams(LeagueId, TeamId)
SELECT (SELECT MIN(Id) FROM Leagues WHERE LeagueName='German Bundesliga'), Id 
FROM Teams WHERE CountryCode='DE'
GO

--Spanish La Liga--

INSERT INTO Teams(TeamName, CountryCode) VALUES
 ('Real Madrid', 'ES'),
 ('Barcelona', 'ES'),
 ('Sevilla', 'ES'),
 ('Atletico Madrid', 'ES'),
 ('Villareal', 'ES'),
 ('Real Betis', 'ES'),
 ('Real Sociedad', 'ES'),
 ('Valencia', 'ES'),
 ('Celta Vigo', 'ES'),
 ('Espanyol', 'ES'),
 ('Athletic Club', 'ES'),
 ('Celta Vigo', 'ES'),
 ('Getafe', 'ES'),
 ('Rayo Vallecano', 'ES'),
 ('Mallorca', 'ES'),
 ('Alaves', 'ES'),
 ('Levante', 'ES'),
 ('Cadiz', 'ES')
GO

--Assign the ES teams to "Spanish La Liga"--
INSERT INTO Leagues_Teams(LeagueId, TeamId)
SELECT (SELECT MIN(Id) FROM Leagues WHERE LeagueName='Spanish La Liga'), Id 
FROM Teams WHERE CountryCode='ES'
GO

--French Ligue One--

INSERT INTO Teams(TeamName, CountryCode) VALUES
 ('PSG', 'FR'),
 ('Lille', 'FR'),
 ('Lyon', 'FR'),
 ('Nice', 'FR'),
 ('Marseille', 'FR'),
 ('AS Monaco', 'FR'),
 ('Rennes', 'FR'),
 ('Strasbourg', 'FR'),
 ('Lens', 'FR'),
 ('Nantes', 'FR'),
 ('Montpellier', 'FR'),
 ('Metz', 'FR'),
 ('Bordeaux', 'FR'),
 ('Brest', 'FR'),
 ('Reims', 'FR'),
 ('Angers', 'FR'),
 ('Clermont Foot', 'FR'),
 ('St. Etienne', 'FR'),
 ('Lorient', 'FR'),
 ('Troyes', 'FR')
GO

--Assign the FR teams to "French Ligue One"--
INSERT INTO Leagues_Teams(LeagueId, TeamId)
SELECT (SELECT MIN(Id) FROM Leagues WHERE LeagueName='French Ligue One'), Id 
FROM Teams WHERE CountryCode='FR'
GO

--Display all leagues--

SELECT *
FROM TopFiveLeagues.dbo.Leagues

--Display teams in English Premier League--

SELECT TeamName
FROM TopFiveLeagues.dbo.Teams
WHERE CountryCode = 'EN'

--Display teams in Italian Serie A--

SELECT TeamName
FROM TopFiveLeagues.dbo.Teams
WHERE CountryCode = 'IT'

--Display teams in German Budesliga--

SELECT TeamName
FROM TopFiveLeagues.dbo.Teams
WHERE CountryCode = 'DE'

--Display teams in Spanish La Liga--

SELECT TeamName
FROM TopFiveLeagues.dbo.Teams
WHERE CountryCode = 'ES'

--Display teams in French Ligue One--

SELECT TeamName
FROM TopFiveLeagues.dbo.Teams
WHERE CountryCode = 'FR'

--Join Tables--

SELECT *
FROM TopFiveLeagues.dbo.Leagues
INNER JOIN TopFiveLeagues.dbo.Teams
ON Leagues.Id = Teams.Id