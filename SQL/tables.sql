create table umpire (
    LicenseNumber char(9) primary key,
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
    UnID char(6) primary key,
    T_Name varchar(20),
    NumPlayed int,
    NumWon int,
    Home varchar(50) unique,
    Manager char(8),
    Coach char(8),
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
    gDate date,
    Ump_License char(9), 
    WinningTeam char(6), 
    Team2 char(6),
    gField varchar(50),
    foreign key(Ump_License) references umpire(LicenseNumber),
    foreign key(WinningTeam) references teams(UnID),
    foreign key(Team2) references teams(UnID),
    foreign key(gField) references teams(Home)
);

create table violations (
    UnID char(9) primary key,
    vType varchar(30),
    Player char(11), 
    gameID char(6), 
    foreign key(Player) references players(LicenseNumber),
    foreign key(gameID) references games(gameID)
);

create table goals (
    GID char(9) primary key,
    Shooter char(11), 
    gameID char(6),
    foreign key(Shooter) references players(LicenseNumber),
    foreign key(gameID) references games(gameID)
);

create table player_contracts (
    ContractID char(9) primary key,
    Team char(6), 
    Person char(11), 
    ContractEnd date,
    ContractStart date,
    Salary int,
    foreign key(Team) references teams(UnID),
    foreign key(Person) references players(LicenseNumber)
);

create table coach_contracts (
    ContractID char(9) primary key,
    Team char(6), 
    Person char(8),
    ContractEnd date,
    ContractStart date,
    Salary int,
    foreign key(Team) references teams(UnID),
    foreign key(Person) references coaches(LicenseID),
); 

create table manager_contracts (
    ContractID char(9) primary key,
    Team char(6),
    Person char(8),
    ContractEnd date,
    ContractStart date,
    Salary int,
    foreign key(Team) references teams(UnID),
    foreign key(Person) references managers(LicenseID)
);