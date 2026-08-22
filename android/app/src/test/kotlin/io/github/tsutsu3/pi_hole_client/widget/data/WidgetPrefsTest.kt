package io.github.tsutsu3.pi_hole_client.widget.data

import android.content.Context
import androidx.test.core.app.ApplicationProvider
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner

@RunWith(RobolectricTestRunner::class)
class WidgetPrefsTest {

    private lateinit var prefs: WidgetPrefs

    @Before
    fun setUp() {
        WidgetPrefs.clearInstanceForTest()
        prefs = WidgetPrefs.getInstance(ApplicationProvider.getApplicationContext<Context>())
    }

    @Test
    fun getSid_returnsNullWhenNeverSaved() {
        assertNull(prefs.getSid("http://never-saved"))
    }

    @Test
    fun getSid_returnsEmptyStringAfterSavingEmpty() {
        prefs.saveSid("http://no-auth", "")

        assertEquals("", prefs.getSid("http://no-auth"))
    }

    @Test
    fun hasUsableSession_trueForEmptySidPushedByFlutter() {
        prefs.saveSid("http://no-auth", "")
        prefs.setSidValid("http://no-auth", true)

        assertTrue(prefs.hasUsableSession("http://no-auth"))
    }

    @Test
    fun hasUsableSession_falseWhenSidNeverPushed() {
        prefs.setSidValid("http://never-pushed", true)

        assertFalse(prefs.hasUsableSession("http://never-pushed"))
    }

    @Test
    fun hasUsableSession_falseWhenEmptySidMarkedInvalid() {
        prefs.saveSid("http://revoked", "")
        prefs.setSidValid("http://revoked", false)

        assertFalse(prefs.hasUsableSession("http://revoked"))
    }

    @Test
    fun hasUsableSession_trueForNormalSid() {
        prefs.saveSid("http://normal", "abc123")
        prefs.setSidValid("http://normal", true)

        assertTrue(prefs.hasUsableSession("http://normal"))
    }

    @Test
    fun hasUsableSession_falseAfterRemoveServer() {
        prefs.saveSid("http://removed", "")
        prefs.setSidValid("http://removed", true)

        prefs.removeServer("http://removed")

        assertNull(prefs.getSid("http://removed"))
        assertFalse(prefs.hasUsableSession("http://removed"))
    }
}
