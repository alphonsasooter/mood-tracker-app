A Mood Tracker App helps users record and analyze their emotions daily.
It can help them recognize emotional patterns, improve mental well-being, and identify what triggers certain moods.

Main Features

1. Daily Mood Logging

User selects how they feel today (e.g. 😄 Happy, 😢 Sad, 😐 Neutral, 😡 Angry, 😴 Tired).

Optionally, they can add a short note or reason (“Had a great day with friends!”).



2. Mood Calendar / History

View past moods in a calendar or list view.

Each day shows a color or emoji based on mood.



3. Statistics / Insights

Graphs showing mood trends over time (weekly, monthly).

Average mood score.

Most common moods.



4. Reminders

Push notifications reminding the user to log their mood daily.



5. (Optional Advanced) AI Insight

Use sentiment analysis on notes to detect mood automatically.

Suggest positivity quotes or activities based on mood.


Tech Stack (Flutter version)

Part	Tool

Frontend	Flutter (Dart)
Backend / Storage	Firebase Firestore / SQLite
Charts & Visualization	fl_chart package
Notifications	flutter_local_notifications
Authentication (optional)	Firebase Auth (Google Sign-In)



App Flow

1. Splash Screen → Onboarding → Home Page


2. Home Page shows today’s mood and button “+ Add Mood”


3. Mood Entry Page

Pick emoji → Write note → Save



4. Mood History Page

List or calendar of previous moods



5. Stats Page

Mood chart / Insights