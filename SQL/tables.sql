create table umpire (
    LicenseNumber varchar(9) primary key,
    First_Name varchar(20),
    Last_Name varchar(20)
);

create table coaches (
    LicenseID char(8) primary key,
    First_Name varchar(20),
    Last_Name varchar(20),
    Active varchar(5),
    WinPercent numeric
);

create table managers (
    LicenseID char(8) primary key,
    First_Name varchar(20),
    Last_Name varchar(20),
    Active varchar(5),
    WinPercent numeric
);

create table teams (
    UnID char(6),
    T_Name varchar(20),
    NumPlayed int,
    NumWon int,
    Home varchar(50) unique,
    Manager char(8),
    Coach char(8),
    primary key(UnID),
    foreign key(Manager) references managers(LicenseID),
    foreign key(Coach) references coaches(LicenseID)
);

create table players (
    LicenseNumber char(11) primary key,
    P_Name varchar(50),
    Assists int, 
    P_Status varchar(5),
    Goals int,
    ShotPercent numeric,
    Nationality varchar(30),
    Age int,
    Cur_Team char(6),
    foreign key(Cur_Team) references teams(UnID)
);

create table games (
    gameID char(6) primary key,
    Date date,
    Ump_License char(9) references umpire(LicenseNumber),
    WinningTeam char(6) references teams(UID),
    Team2 char(6) references teams(UID)
    field varchar(50) references teams(Home)
);

create table violations (
    UID char(9) primary key,
    Type varchar(30),
    Player char(11) references players(LicenseNumber),
    gameID char(6) references games(gameID)
);

create table goals (
    GID char(9) primary key,
    Shooter char(11) references players(LicenseNumber),
    gameID char(6) references games(gameID)
);

create table player_contracts (
    ContractID char(9) primary key,
    Team char(6) references teams(UID),
    Person varchar(11) references players(LicenseNumber),
    ContractEnd date,
    ContractStart date,
    Salary int
);

create table coach_contracts (
    ContractID char(9) primary key,
    Team char(6) references teams(UID),
    Person varchar(11) references coaches(LicenseID),
    ContractEnd date,
    ContractStart date,
    Salary int
);

create table manager_contracts (
    ContractID char(9) primary key,
    Team char(6) references teams(UID),
    Person varchar(11) references managers(LicenseID),
    ContractEnd date,
    ContractStart date,
    Salary int
);