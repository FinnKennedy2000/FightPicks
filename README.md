
# 🥊 FightPicks

**FightPicks** is a mobile-first fantasy league platform for UFC fans to create private leagues, pick fight outcomes, and compete over a season-based points system. Built with React Native, Go (or Kotlin) backend, PostgreSQL, and push notifications.

---

## 📖 Project Summary

FightPicks lets users:
- Create or join private fantasy leagues
- Pick fight outcomes for upcoming UFC events
- Earn points based on real fight results
- Compete on private league and season-wide leaderboards
- Get push notifications for deadlines and results

---

## 🎯 Core Objectives

- Mobile-first React Native application
- Season-based private fantasy leagues with invite codes
- Pick fighters for each UFC event
- Automated scoring based on fight outcomes
- League leaderboards and overall season ranking
- Notifications for key events (pick deadlines, results)
- Clean and scalable backend with PostgreSQL

---

## 📱 App Features

### User Features
- Register, log in, manage profile
- View upcoming UFC events and fight cards
- Pick fighters before event lock time
- Create and join private leagues via invite codes
- Track personal picks history
- View league and season leaderboards
- Receive push notifications for:
  - Pick deadlines  
  - Fight results  
  - Leaderboard updates  

### League Features
- Private league creation with invite codes
- Set season start date (specific UFC event)
- Track league member scores and rankings
- Season-long scoring and ranking system

### Fantasy Season & Scoring System
- Season begins at a set UFC event and continues for multiple cards
- Points awarded per fight:
  - Win by Decision: +5
  - Win by KO/TKO: +10
  - Win by Submission: +12
  - Finish in Round 1: +3
  - Underdog Win: +5
  - Perfect event card: +20
- Fight results fetched via API / scraper

### Admin Features (Post-MVP)
- Manage users and leagues
- Manually update fight results
- Adjust scores if necessary
- Remove abusive users

---

## ⚙️ Technical Scope

| Purpose         | Stack/Tool                     |
|:----------------|:--------------------------------|
| Mobile App      | React Native (Expo CLI)          |
| Backend API     | Go + Gin (or Kotlin + Ktor)      |
| Database        | PostgreSQL                       |
| Auth            | Supabase Auth                    |
| Notifications   | Expo Push Notifications          |
| Deployment      | Docker + Railway / Fly.io        |
| Fight Data      | Unofficial UFC API / scraper     |

---

## 📊 Data Models

### Users
- id  
- username  
- email  
- password_hash  
- avatar_url  
- created_at  

### Leagues
- id  
- name  
- owner_id  
- invite_code  
- created_at  
- season_start_event_id  

### LeagueMembers
- id  
- user_id  
- league_id  
- season_points  

### Events
- id  
- ufc_event_id  
- name  
- date  
- timezone  
- status  

### Fights
- id  
- event_id  
- fighter_a_id  
- fighter_b_id  
- fight_order  
- winner_id  
- method  
- round_finished  
- status  

### Fighters
- id  
- name  
- ufc_id  
- weight_class  

### Picks
- id  
- user_id  
- league_id  
- event_id  
- fight_id  
- picked_fighter_id  
- points_awarded  

---

## 🗓️ Development Process

### Phase 1: Project Setup
- React Native app scaffold (Expo)
- Backend scaffold (Go or Kotlin)
- Database schema & migrations
- Auth integration (Supabase)

### Phase 2: Core Functionality
- League creation & join flow
- Event listings & fight cards
- User picks storage

### Phase 3: Scoring & Leaderboards
- Fetch fight results
- Calculate and assign points
- League and season-wide leaderboards

### Phase 4: Notifications
- Push notifications for pick deadlines & fight results

### Phase 5: Polish
- Profile management
- UI animations and UX improvements

---

## 📌 Deliverables

- Mobile app (React Native)
- Backend API (Go or Kotlin)
- PostgreSQL database schema
- Docker setup for dev/local
- Scoring engine
- Notifications system
- MVP prototype deployed via Expo Go or Play Store Alpha

---

## 📎 Stretch Goals (Post-MVP)

- Live event commentary / chat per league
- Public leagues
- Customizable league scoring rules
- Achievements, badges, and milestones system

---

## 📛 Name

**FightPicks**

---

## 📌 License

TBD

---

## 📞 Contact

Built by Finn Kennedy ✌️
