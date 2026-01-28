package io.github.tsutsu3.pi_hole_client.widget.ui.stats

import androidx.compose.ui.unit.DpSize
import androidx.compose.ui.unit.dp
import org.junit.Assert.assertEquals
import org.junit.Test

class PiHoleGlanceWidgetTest {

    // Layout resolution tests
    @Test
    fun testLayoutResolution_tallWidget() {
        // Tall widget: small size (< 2 columns or < 2 rows)
        // Very small widget (1 column, 1 row)
        val size1 = DpSize(100.dp, 80.dp)
        assertEquals(WidgetLayoutType.TALL, resolveLayoutType(size1))

        // 1 column, 2 rows
        val size2 = DpSize(100.dp, 110.dp)
        assertEquals(WidgetLayoutType.TALL, resolveLayoutType(size2))

        // 2 columns but only 1 row
        val size3 = DpSize(140.dp, 100.dp)
        assertEquals(WidgetLayoutType.TALL, resolveLayoutType(size3))

        // 3 columns but only 1 row
        val size4 = DpSize(210.dp, 100.dp)
        assertEquals(WidgetLayoutType.TALL, resolveLayoutType(size4))
    }

    @Test
    fun testLayoutResolution_mediumWidget() {
        // Medium widget: 2 columns, 2+ rows
        val size1 = DpSize(140.dp, 110.dp)
        assertEquals(WidgetLayoutType.MEDIUM, resolveLayoutType(size1))

        val size2 = DpSize(140.dp, 180.dp)
        assertEquals(WidgetLayoutType.MEDIUM, resolveLayoutType(size2))

        val size3 = DpSize(200.dp, 180.dp)
        assertEquals(WidgetLayoutType.MEDIUM, resolveLayoutType(size3))
    }

    @Test
    fun testLayoutResolution_largeWidget() {
        // Large widget: 3 columns, 2+ rows
        val size1 = DpSize(210.dp, 110.dp)
        assertEquals(WidgetLayoutType.LARGE, resolveLayoutType(size1))

        val size2 = DpSize(300.dp, 180.dp)
        assertEquals(WidgetLayoutType.LARGE, resolveLayoutType(size2))

        val size3 = DpSize(350.dp, 150.dp)
        assertEquals(WidgetLayoutType.LARGE, resolveLayoutType(size3))
    }

    @Test
    fun testLayoutResolution_extraLargeWidget() {
        // Extra large widget: 4 columns, 2+ rows
        val size1 = DpSize(360.dp, 110.dp)
        assertEquals(WidgetLayoutType.EXTRA_LARGE, resolveLayoutType(size1))

        val size2 = DpSize(400.dp, 180.dp)
        assertEquals(WidgetLayoutType.EXTRA_LARGE, resolveLayoutType(size2))

        val size3 = DpSize(500.dp, 200.dp)
        assertEquals(WidgetLayoutType.EXTRA_LARGE, resolveLayoutType(size3))
    }

    @Test
    fun testLayoutResolution_edgeCases() {
        // Test boundary values

        // Just below 2 columns threshold (140dp)
        assertEquals(WidgetLayoutType.TALL, resolveLayoutType(DpSize(139.dp, 110.dp)))
        // Exactly at 2 columns threshold
        assertEquals(WidgetLayoutType.MEDIUM, resolveLayoutType(DpSize(140.dp, 110.dp)))

        // Just below 3 columns threshold (210dp)
        assertEquals(WidgetLayoutType.MEDIUM, resolveLayoutType(DpSize(209.dp, 110.dp)))
        // Exactly at 3 columns threshold
        assertEquals(WidgetLayoutType.LARGE, resolveLayoutType(DpSize(210.dp, 110.dp)))

        // Just below 4 columns threshold (360dp)
        assertEquals(WidgetLayoutType.LARGE, resolveLayoutType(DpSize(359.dp, 110.dp)))
        // Exactly at 4 columns threshold
        assertEquals(WidgetLayoutType.EXTRA_LARGE, resolveLayoutType(DpSize(360.dp, 110.dp)))

        // Just below 2 rows threshold (110dp)
        assertEquals(WidgetLayoutType.TALL, resolveLayoutType(DpSize(210.dp, 109.dp)))
        // Exactly at 2 rows threshold
        assertEquals(WidgetLayoutType.LARGE, resolveLayoutType(DpSize(210.dp, 110.dp)))
    }

    // estimateColumns tests
    @Test
    fun testEstimateColumns_boundaries() {
        // 1 column (< 140dp)
        assertEquals(1, estimateColumns(0))
        assertEquals(1, estimateColumns(100))
        assertEquals(1, estimateColumns(139))

        // 2 columns (140-209dp)
        assertEquals(2, estimateColumns(140))
        assertEquals(2, estimateColumns(180))
        assertEquals(2, estimateColumns(209))

        // 3 columns (210-359dp)
        assertEquals(3, estimateColumns(210))
        assertEquals(3, estimateColumns(300))
        assertEquals(3, estimateColumns(359))

        // 4 columns (360+dp)
        assertEquals(4, estimateColumns(360))
        assertEquals(4, estimateColumns(400))
        assertEquals(4, estimateColumns(1000))
    }

    // estimateRows tests
    @Test
    fun testEstimateRows_boundaries() {
        // 1 row (< 110dp)
        assertEquals(1, estimateRows(0))
        assertEquals(1, estimateRows(80))
        assertEquals(1, estimateRows(109))

        // 2 rows (110-179dp)
        assertEquals(2, estimateRows(110))
        assertEquals(2, estimateRows(150))
        assertEquals(2, estimateRows(179))

        // 3 rows (180+dp)
        assertEquals(3, estimateRows(180))
        assertEquals(3, estimateRows(250))
        assertEquals(3, estimateRows(500))
    }

    // formatCompactNumber tests
    @Test
    fun testFormatCompactNumber_lessThan1K() {
        assertEquals("0", formatCompactNumber(0))
        assertEquals("1", formatCompactNumber(1))
        assertEquals("100", formatCompactNumber(100))
        assertEquals("999", formatCompactNumber(999))
    }

    @Test
    fun testFormatCompactNumber_thousands() {
        assertEquals("1K", formatCompactNumber(1000))
        assertEquals("1.5K", formatCompactNumber(1500))
        assertEquals("10K", formatCompactNumber(10000))
        assertEquals("99.9K", formatCompactNumber(99900))
        assertEquals("100K", formatCompactNumber(100000))
        assertEquals("999K", formatCompactNumber(999000))
    }

    @Test
    fun testFormatCompactNumber_millions() {
        assertEquals("1M", formatCompactNumber(1000000))
        assertEquals("1.5M", formatCompactNumber(1500000))
        assertEquals("10M", formatCompactNumber(10000000))
        assertEquals("100M", formatCompactNumber(100000000))
        assertEquals("999M", formatCompactNumber(999000000))
    }

    @Test
    fun testFormatCompactNumber_billions() {
        assertEquals("1B", formatCompactNumber(1000000000))
        assertEquals("1.5B", formatCompactNumber(1500000000))
        assertEquals("10B", formatCompactNumber(10000000000))
        assertEquals("100B", formatCompactNumber(100000000000))
    }

    @Test
    fun testFormatCompactNumber_trillions() {
        assertEquals("1T", formatCompactNumber(1000000000000))
        assertEquals("1.5T", formatCompactNumber(1500000000000))
        assertEquals("999T", formatCompactNumber(999000000000000))
    }

    @Test
    fun testFormatCompactNumber_edgeCases() {
        // Boundary at 1000
        assertEquals("999", formatCompactNumber(999))
        assertEquals("1K", formatCompactNumber(1000))

        // Boundary at 1000000
        assertEquals("999K", formatCompactNumber(999000))
        assertEquals("1M", formatCompactNumber(1000000))

        // Boundary at 1000000000
        assertEquals("999M", formatCompactNumber(999000000))
        assertEquals("1B", formatCompactNumber(1000000000))
    }

    @Test
    fun testFormatCompactNumber_stringInput() {
        // Test string overload with valid numbers
        assertEquals("1K", formatCompactNumber("1,000"))
        assertEquals("1.5K", formatCompactNumber("1,500"))
        assertEquals("100K", formatCompactNumber("100,000"))
        assertEquals("1M", formatCompactNumber("1,000,000"))

        // Test with spaces
        assertEquals("1K", formatCompactNumber(" 1000 "))
        assertEquals("1.5K", formatCompactNumber(" 1,500 "))

        // Test with invalid input (should return original)
        assertEquals("invalid", formatCompactNumber("invalid"))
        assertEquals("", formatCompactNumber(""))
        assertEquals("--", formatCompactNumber("--"))
    }

    @Test
    fun testFormatCompactNumber_decimalPrecision() {
        // Values less than 100 in the unit show 1 decimal place
        assertEquals("1.5K", formatCompactNumber(1500))
        assertEquals("10K", formatCompactNumber(10000))
        assertEquals("99.9K", formatCompactNumber(99900))

        // Values >= 100 in the unit show no decimal places
        assertEquals("100K", formatCompactNumber(100000))
        assertEquals("150K", formatCompactNumber(150000))
        assertEquals("999K", formatCompactNumber(999000))

        // Same pattern for millions
        assertEquals("1.5M", formatCompactNumber(1500000))
        assertEquals("10M", formatCompactNumber(10000000))
        assertEquals("100M", formatCompactNumber(100000000))
    }
}
