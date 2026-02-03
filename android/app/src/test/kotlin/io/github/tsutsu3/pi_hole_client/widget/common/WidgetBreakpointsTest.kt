package io.github.tsutsu3.pi_hole_client.widget.common

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class WidgetBreakpointsTest {

    @Test
    fun `getWidgetSizeClass returns XS for tiny widgets`() {
        assertEquals(WidgetSizeClass.XS, getWidgetSizeClass(50f, 50f))
        assertEquals(WidgetSizeClass.XS, getWidgetSizeClass(60f, 60f))
    }

    @Test
    fun `getWidgetSizeClass returns SM for small widgets`() {
        assertEquals(WidgetSizeClass.SM, getWidgetSizeClass(80f, 80f))
        assertEquals(WidgetSizeClass.SM, getWidgetSizeClass(90f, 90f))
    }

    @Test
    fun `getWidgetSizeClass returns MD for medium widgets`() {
        assertEquals(WidgetSizeClass.MD, getWidgetSizeClass(100f, 100f))
        assertEquals(WidgetSizeClass.MD, getWidgetSizeClass(120f, 120f))
    }

    @Test
    fun `getWidgetSizeClass returns LG for large widgets`() {
        assertEquals(WidgetSizeClass.LG, getWidgetSizeClass(150f, 150f))
        assertEquals(WidgetSizeClass.LG, getWidgetSizeClass(180f, 180f))
    }

    @Test
    fun `getWidgetSizeClass returns XL for extra large widgets`() {
        assertEquals(WidgetSizeClass.XL, getWidgetSizeClass(250f, 250f))
        assertEquals(WidgetSizeClass.XL, getWidgetSizeClass(300f, 200f))
    }

    @Test
    fun `getWidgetSizeClass handles non-square widgets correctly`() {
        // 2x1 compact widget on phone (~170x70) = sqrt(11900) ≈ 109 → MD
        assertEquals(WidgetSizeClass.MD, getWidgetSizeClass(170f, 70f))

        // 3x2 stats widget (~255x140) = sqrt(35700) ≈ 189 → LG
        assertEquals(WidgetSizeClass.LG, getWidgetSizeClass(255f, 140f))
    }

    @Test
    fun `getWidgetSizingSpec returns valid spec for all size classes`() {
        val sizes = listOf(
            Pair(50f, 50f),   // XS
            Pair(80f, 80f),   // SM
            Pair(120f, 120f), // MD
            Pair(180f, 180f), // LG
            Pair(300f, 200f), // XL
        )

        for ((width, height) in sizes) {
            val spec = getWidgetSizingSpec(width, height)

            // Verify all values are positive
            assertTrue("titleFontSize > 0", spec.titleFontSize.value > 0)
            assertTrue("valueFontSize > 0", spec.valueFontSize.value > 0)
            assertTrue("labelFontSize > 0", spec.labelFontSize.value > 0)
            assertTrue("captionFontSize > 0", spec.captionFontSize.value > 0)
            assertTrue("padding > 0", spec.padding.value > 0)
            assertTrue("iconSize > 0", spec.iconSize.value > 0)
        }
    }

    @Test
    fun `font size hierarchy is maintained across all size classes`() {
        val specs = WidgetSizeClass.entries.map { sizeClass ->
            when (sizeClass) {
                WidgetSizeClass.XS -> getWidgetSizingSpec(50f, 50f)
                WidgetSizeClass.SM -> getWidgetSizingSpec(80f, 80f)
                WidgetSizeClass.MD -> getWidgetSizingSpec(120f, 120f)
                WidgetSizeClass.LG -> getWidgetSizingSpec(180f, 180f)
                WidgetSizeClass.XL -> getWidgetSizingSpec(300f, 200f)
            }
        }

        for (spec in specs) {
            assertTrue(
                "valueFontSize >= labelFontSize",
                spec.valueFontSize.value >= spec.labelFontSize.value
            )
            assertTrue(
                "labelFontSize >= captionFontSize",
                spec.labelFontSize.value >= spec.captionFontSize.value
            )
        }
    }

    @Test
    fun `sizing increases with larger size classes`() {
        val xs = getWidgetSizingSpec(50f, 50f)
        val xl = getWidgetSizingSpec(300f, 200f)

        assertTrue("XL title > XS title", xl.titleFontSize.value > xs.titleFontSize.value)
        assertTrue("XL padding > XS padding", xl.padding.value > xs.padding.value)
        assertTrue("XL iconSize > XS iconSize", xl.iconSize.value > xs.iconSize.value)
    }

    @Test
    fun `getLayoutHint returns TALL for tall widgets`() {
        assertEquals(WidgetLayoutHint.TALL, getLayoutHint(50f, 150f))  // aspect 0.33
        assertEquals(WidgetLayoutHint.TALL, getLayoutHint(60f, 200f))  // aspect 0.3
    }

    @Test
    fun `getLayoutHint returns WIDE for wide widgets`() {
        assertEquals(WidgetLayoutHint.WIDE, getLayoutHint(300f, 100f)) // aspect 3.0
        assertEquals(WidgetLayoutHint.WIDE, getLayoutHint(250f, 60f))  // aspect 4.17
    }

    @Test
    fun `getLayoutHint returns NORMAL for balanced widgets`() {
        assertEquals(WidgetLayoutHint.NORMAL, getLayoutHint(100f, 100f)) // aspect 1.0
        assertEquals(WidgetLayoutHint.NORMAL, getLayoutHint(150f, 100f)) // aspect 1.5
        assertEquals(WidgetLayoutHint.NORMAL, getLayoutHint(100f, 150f)) // aspect 0.67
    }

    @Test
    fun `getWidgetSizingSpec returns valid card and button specs for all size classes`() {
        val sizes = listOf(
            Pair(50f, 50f),   // XS
            Pair(80f, 80f),   // SM
            Pair(120f, 120f), // MD
            Pair(180f, 180f), // LG
            Pair(300f, 200f), // XL
        )

        for ((width, height) in sizes) {
            val spec = getWidgetSizingSpec(width, height)

            // Verify new spec values are positive
            assertTrue("buttonSize > 0", spec.buttonSize.value > 0)
            assertTrue("buttonIconSize > 0", spec.buttonIconSize.value > 0)
            assertTrue("cardCornerRadius > 0", spec.cardCornerRadius.value > 0)
            assertTrue("cardPadding > 0", spec.cardPadding.value > 0)
            assertTrue("cardGap > 0", spec.cardGap.value > 0)
            assertTrue("headerSpacing > 0", spec.headerSpacing.value > 0)

            // Verify button icon fits inside button
            assertTrue(
                "buttonIconSize < buttonSize",
                spec.buttonIconSize.value < spec.buttonSize.value
            )
        }
    }

    @Test
    fun `card and button sizing increases with larger size classes`() {
        val xs = getWidgetSizingSpec(50f, 50f)
        val xl = getWidgetSizingSpec(300f, 200f)

        assertTrue("XL buttonSize > XS buttonSize", xl.buttonSize.value > xs.buttonSize.value)
        assertTrue("XL cardPadding > XS cardPadding", xl.cardPadding.value > xs.cardPadding.value)
        assertTrue("XL cardGap > XS cardGap", xl.cardGap.value > xs.cardGap.value)
        assertTrue("XL headerSpacing > XS headerSpacing", xl.headerSpacing.value > xs.headerSpacing.value)
    }
}
