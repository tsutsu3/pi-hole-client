# R8 optimization can remove or rename classes used indirectly by Room, WorkManager, and Glance.
#
# Without these rules, release builds may fail with:
#   Failed to create an instance of class androidx.work.impl.WorkDatabase.canonicalName
# or Glance widget actions may stop working.
#
# Keep the required classes to ensure WorkManager initialization and widget
# actions continue to work in minified release builds.

# Room / WorkManager
-keep class * extends androidx.room.RoomDatabase { *; }
-keep class * extends androidx.work.ListenableWorker { *; }
-keep class * extends androidx.work.InputMerger { *; }
-keep class androidx.work.WorkerParameters { *; }

# App's Glance widgets only
-keep class io.github.tsutsu3.pi_hole_client.widget.ui.** extends androidx.glance.appwidget.GlanceAppWidget { *; }
-keep class io.github.tsutsu3.pi_hole_client.widget.ui.** extends androidx.glance.appwidget.GlanceAppWidgetReceiver { *; }
-keep class io.github.tsutsu3.pi_hole_client.widget.ui.** implements androidx.glance.appwidget.action.ActionCallback { *; }