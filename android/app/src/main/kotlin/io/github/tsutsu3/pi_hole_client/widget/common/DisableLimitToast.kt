package io.github.tsutsu3.pi_hole_client.widget.common

import android.content.Context
import android.os.Handler
import android.os.Looper
import android.widget.Toast
import io.github.tsutsu3.pi_hole_client.R

/**
 * Shows "Pi-hole can be disabled again in 3h 05m" after a widget tap that
 * the disable limit refused.
 *
 * Android hides toasts from apps in the background when their notifications
 * are turned off, so on Android 13+ it shows only if notifications are allowed.
 */
fun showDisableLimitToast(context: Context, remainingMs: Long) {
    val totalMinutes = ((remainingMs + 59_999L) / 60_000L).coerceAtLeast(1L)
    val hours = totalMinutes / 60
    val minutes = totalMinutes % 60
    val remaining = if (hours > 0) "${hours}h ${minutes.toString().padStart(2, '0')}m" else "${minutes}m"
    val appContext = context.applicationContext
    val message = appContext.getString(R.string.widget_disable_limit_toast, remaining)
    Handler(Looper.getMainLooper()).post {
        Toast.makeText(appContext, message, Toast.LENGTH_LONG).show()
    }
}
