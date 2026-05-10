# 🚗🏍️ Vehicle Rental Management System
## IntelliJ IDEA Setup Guide

---

## ✅ Step 1 - Requirements Install Karo

1. **Java JDK 17+** → https://www.oracle.com/java/technologies/downloads/
2. **IntelliJ IDEA (Community Free)** → https://www.jetbrains.com/idea/download/
3. **MySQL Server** → https://dev.mysql.com/downloads/mysql/
4. **MySQL Connector JAR** → https://dev.mysql.com/downloads/connector/j/
   - Download karke `mysql-connector-j-X.X.X.jar` file rakho

---

## 🗄️ Step 2 - Database Setup

MySQL Workbench ya Command Line mein:
```sql
source C:/path/to/VehicleRental_IntelliJ/database.sql
```
Ya:
- MySQL Workbench open karo
- File > Open SQL Script > `database.sql` select karo
- ▶️ Run button dabao

---

## 📂 Step 3 - IntelliJ mein Project Open Karo

1. IntelliJ IDEA kholein
2. **"Open"** click karein (New Project nahi!)
3. `VehicleRental_IntelliJ` folder select karein → **OK**
4. IntelliJ khud project detect kar lega ✅

---

## 🔌 Step 4 - MySQL JAR Add Karo

1. **File > Project Structure** (Ctrl+Alt+Shift+S)
2. Left mein **"Libraries"** click karein
3. **"+" button** dabao → **"Java"** select karein
4. `mysql-connector-j-8.x.x.jar` file locate karke select karein
5. **Apply > OK**

---

## ⚙️ Step 5 - Database Password Set Karo

`src/main/java/database/DBConnection.java` file kholein:

```java
private static final String PASSWORD = ""; // apna MySQL password yahan likhein
```

Agar MySQL install karte waqt password nahi rakha toh empty chhorain.

---

## ▶️ Step 6 - Run Karo

1. `src/main/java/Main.java` file kholein
2. Line 1 ke saath left side mein **▶️ green arrow** dikhai dega
3. Click karein → **"Run 'Main.main()'"**
4. Login screen aa jayegi! 🎉

Ya phir:
- **Run > Run 'Main'** (Shift+F10)

---

## 🔐 Default Login

| Role  | Username | Password |
|-------|----------|----------|
| Admin | admin    | admin123 |
| Agent | agent1   | agent123 |

---

## 📁 Project Structure (IntelliJ)

```
VehicleRental_IntelliJ/
├── VehicleRentalSystem.iml      ← IntelliJ module file
├── database.sql                  ← MySQL script
├── lib/                          ← MySQL JAR yahan rakh sakte ho
├── HOW_TO_USE.md
└── src/
    └── main/
        └── java/
            ├── Main.java          ← ⭐ RUN THIS FILE
            ├── database/
            │   └── DBConnection.java
            ├── models/
            │   ├── Vehicle.java
            │   ├── Customer.java
            │   └── Booking.java
            ├── gui/
            │   ├── LoginFrame.java
            │   ├── DashboardFrame.java
            │   ├── VehiclePanel.java
            │   ├── CustomerPanel.java
            │   ├── BookingPanel.java
            │   └── ReportPanel.java
            └── utils/
                └── PrintUtils.java
```

---

## 🐛 Common Errors & Fix

| Error | Fix |
|-------|-----|
| `ClassNotFoundException: com.mysql.cj.jdbc.Driver` | MySQL JAR add karo (Step 4) |
| `Connection refused` | MySQL service start karo |
| `Unknown database` | database.sql run karo |
| `Access denied` | DBConnection.java mein password sahi karo |
| Red underlines in code | File > Invalidate Caches > Restart |

---

## 💡 IntelliJ Tips

- **Ctrl+Shift+F10** → Current file run karo
- **Alt+Enter** → Auto fix suggestions
- **Ctrl+Alt+L** → Code format karo
- Agar errors aayein: **File > Invalidate Caches/Restart**

---

*SW121 - OOP CEP Project | Mehran University, Khairpur*
