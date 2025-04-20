-- Create tables with relationships for FightPicks database

-- Users table
CREATE TABLE "Users" (
    id UUID PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

-- Leagues table
CREATE TABLE "Leagues" (
    id UUID PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    league_start DATE NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

-- League_Members table with foreign keys
CREATE TABLE "League_Members" (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES "Users"(id),
    leage_id UUID NOT NULL REFERENCES "Leagues"(id),
    score INTEGER NOT NULL DEFAULT 0,
    remaining_doubles INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

-- Fighters table
CREATE TABLE "Fighters" (
    id UUID PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    weightclass VARCHAR(255),
    fighter_id INTEGER,
    mma_id INTEGER,
    nickname VARCHAR(255),
    wins INTEGER,
    losses INTEGER,
    no_contests INTEGER,
    draws INTEGER,
    dob DATE,
    weight VARCHAR(255),
    height VARCHAR(255),
    reach VARCHAR(255),
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

-- Events table
CREATE TABLE "Events" (
    id UUID PRIMARY KEY,
    date DATE NOT NULL,
    name VARCHAR(255) NOT NULL,
    start_time TIMESTAMP,
    timezone VARCHAR(255),
    location VARCHAR(255),
    venue VARCHAR(255),
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

-- Fights table with foreign keys
CREATE TABLE "Fights" (
    id UUID PRIMARY KEY,
    fighter_1 UUID NOT NULL REFERENCES "Fighters"(id),
    fighter_2 UUID NOT NULL REFERENCES "Fighters"(id),
    event UUID NOT NULL REFERENCES "Events"(id),
    weightclass VARCHAR(255),
    rounds INTEGER,
    winner UUID REFERENCES "Fighters"(id),
    method VARCHAR(255),
    round_end INTEGER,
    time_end VARCHAR(255),
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

-- Picks table with foreign keys
CREATE TABLE "Picks" (
    id UUID PRIMARY KEY,
    "user" UUID NOT NULL REFERENCES "League_Members"(id),
    event UUID NOT NULL REFERENCES "Events"(id),
    league UUID NOT NULL REFERENCES "Leagues"(id),
    fight UUID NOT NULL REFERENCES "Fights"(id),
    winner UUID NOT NULL REFERENCES "Fighters"(id),
    method VARCHAR(255) NOT NULL,
    double BOOLEAN NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

-- Create indexes for foreign keys
CREATE INDEX idx_league_members_user_id ON "League_Members"(user_id);
CREATE INDEX idx_league_members_league_id ON "League_Members"(leage_id);
CREATE INDEX idx_fights_fighter_1 ON "Fights"(fighter_1);
CREATE INDEX idx_fights_fighter_2 ON "Fights"(fighter_2);
CREATE INDEX idx_fights_event ON "Fights"(event);
CREATE INDEX idx_picks_user ON "Picks"("user");
CREATE INDEX idx_picks_event ON "Picks"(event);
CREATE INDEX idx_picks_league ON "Picks"(league);
CREATE INDEX idx_picks_fight ON "Picks"(fight);
CREATE INDEX idx_picks_winner ON "Picks"(winner);

-- Seed data

-- Users
INSERT INTO "Users" (id, first_name, last_name, email, password, created_at, updated_at) VALUES
('11111111-1111-1111-1111-111111111111', 'John', 'Doe', 'john@example.com', 'hashedpassword123', NOW(), NOW()),
('22222222-2222-2222-2222-222222222222', 'Jane', 'Smith', 'jane@example.com', 'hashedpassword456', NOW(), NOW());

-- Leagues
INSERT INTO "Leagues" (id, name, league_start, created_at, updated_at) VALUES
('33333333-3333-3333-3333-333333333333', 'UFC 2024 League', '2024-01-01', NOW(), NOW()),
('44444444-4444-4444-4444-444444444444', 'Fight Club League', '2024-01-01', NOW(), NOW());

-- League_Members
INSERT INTO "League_Members" (id, user_id, leage_id, score, remaining_doubles, created_at, updated_at) VALUES
('55555555-5555-5555-5555-555555555555', '11111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333333', 0, 3, NOW(), NOW()),
('66666666-6666-6666-6666-666666666666', '22222222-2222-2222-2222-222222222222', '33333333-3333-3333-3333-333333333333', 0, 3, NOW(), NOW());

-- Fighters
INSERT INTO "Fighters" (id, name, weightclass, fighter_id, mma_id, nickname, wins, losses, no_contests, draws, dob, weight, height, reach, created_at, updated_at) VALUES
('77777777-7777-7777-7777-777777777777', 'Jon Jones', 'Heavyweight', 1001, 2001, 'Bones', 27, 1, 1, 0, '1987-07-19', '248', '6''4"', '84.5"', NOW(), NOW()),
('88888888-8888-8888-8888-888888888888', 'Israel Adesanya', 'Middleweight', 1002, 2002, 'The Last Stylebender', 24, 3, 0, 0, '1989-07-22', '185', '6''4"', '80"', NOW(), NOW()),
('99999999-9999-9999-9999-999999999999', 'Alexander Volkanovski', 'Featherweight', 1003, 2003, 'The Great', 25, 3, 0, 0, '1988-09-29', '145', '5''6"', '71.5"', NOW(), NOW()),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Sean O''Malley', 'Bantamweight', 1004, 2004, 'Sugar', 17, 1, 1, 0, '1994-10-24', '135', '5''11"', '72"', NOW(), NOW());

-- Events
INSERT INTO "Events" (id, date, name, start_time, timezone, location, venue, created_at, updated_at) VALUES
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '2024-03-09', 'UFC 299', '2024-03-09 22:00:00', 'EST', 'Miami, Florida', 'Kaseya Center', NOW(), NOW()),
('cccccccc-cccc-cccc-cccc-cccccccccccc', '2024-04-13', 'UFC 300', '2024-04-13 22:00:00', 'EST', 'Las Vegas, Nevada', 'T-Mobile Arena', NOW(), NOW());

-- Fights
INSERT INTO "Fights" (id, fighter_1, fighter_2, event, weightclass, rounds, winner, method, round_end, time_end, created_at, updated_at) VALUES
('dddddddd-dddd-dddd-dddd-dddddddddddd', '77777777-7777-7777-7777-777777777777', '88888888-8888-8888-8888-888888888888', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Heavyweight', 5, NULL, NULL, NULL, NULL, NOW(), NOW()),
('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '99999999-9999-9999-9999-999999999999', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'cccccccc-cccc-cccc-cccc-cccccccccccc', 'Featherweight', 5, NULL, NULL, NULL, NULL, NOW(), NOW());

-- Picks
INSERT INTO "Picks" (id, "user", event, league, fight, winner, method, double, created_at, updated_at) VALUES
('ffffffff-ffff-ffff-ffff-ffffffffffff', '55555555-5555-5555-5555-555555555555', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '33333333-3333-3333-3333-333333333333', 'dddddddd-dddd-dddd-dddd-dddddddddddd', '77777777-7777-7777-7777-777777777777', 'KO/TKO', false, NOW(), NOW()),
('11111111-2222-3333-4444-555555555555', '66666666-6666-6666-6666-666666666666', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '33333333-3333-3333-3333-333333333333', 'dddddddd-dddd-dddd-dddd-dddddddddddd', '88888888-8888-8888-8888-888888888888', 'Decision', true, NOW(), NOW());
