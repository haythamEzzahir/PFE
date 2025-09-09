# 🚗 CarTrack — Smart Car Rental & Tracking App

> Your all-in-one solution for managing, renting, and tracking vehicles in real-time using Flutter & Firebase.

---

## 📱 Features

- 🔐 **User Authentication** (Email & Phone login)
- 🛻 **Vehicle Listing & Management**
- 📍 **Real-Time Vehicle Tracking (Google Maps)**
- 🧾 **Car Rental Booking System**
- 📤 **Admin Panel for Adding/Updating Cars**
- 💳 **Planned Online Payment Integration**
- 📲 **Modern, Responsive UI with Flutter**

---

## 📸 Screenshots

| Home Page | Active Vehicles | setting Page |
|-----------|-----------------|--------------|
| ![home](https://i.postimg.cc/PqMgHnM6/welcome.png) | ![map](https://camo.githubusercontent.com/56bf552d94d6269e616e14ac9a2af088d0f54b7aee2f4849ab5af869c26b5caf/68747470733a2f2f692e706f7374696d672e63632f6e726a706233674e2f53637265656e2d53686f742d323032352d30372d30362d61742d362d35322d31332d504d2e706e67) | ![setting](https://camo.githubusercontent.com/d5b8fc7773075c8128f13efe25b8fb154f90362841017289ffaf8e0628cbc6fc/68747470733a2f2f692e706f7374696d672e63632f3671764a317947582f53637265656e2d53686f742d323032352d30372d30362d61742d362d35332d33372d504d2e706e67) |

---

## ⚙️ Technologies Used

- **Flutter** — Frontend UI framework
- **Firebase** — Backend-as-a-Service  
  - Firestore (Database)  
  - Firebase Auth  
  - Firebase Storage  
- **Google Maps API** — Real-time location tracking
- **Geolocator** — GPS & permissions
- **Provider / Riverpod** — State Management
- **Figma / Visily** — UI/UX Design

---

## 🏗️ Architecture

**Modular Structure**
  - `/admin/screens/` → Admin-specific screens (e.g., Login, Home, Profile)
  - `/core/` → Core logic and services (e.g., Authentication, Utilities)
  - `/driver/` → Driver-specific screens (e.g., Vehicle Info, Driver Home)
  - `/routes/` → Centralized routing for pages (e.g., /login, /home, /profile)
  - `/shared/pages/` → Shared screens used by both Admin and Driver modules
  - `/main` → App entry point and main configuration
- **Clean Code & Separation of Concerns**

---

## 🚀 Getting Started

1. **Clone the repo**
   ```bash
   git clone https://github.com/haythamEzzahir/PFE.git HayMobility
   cd HayMobility
   flutter run

