package io.github.tsutsu3.pi_hole_client.widget.common

import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.TextUnit
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

/**
 * Bootstrap-style breakpoint system for widgets.
 *
 * Instead of continuous calculation, use discrete size categories
 * with predefined specs - easier to test and maintain.
 */
enum class WidgetSizeClass {
    /** Very small: ~1x1 on small phones */
    XS,
    /** Small: 2x1 on phones, 1x1 on tablets */
    SM,
    /** Medium: 2x2 on phones, 2x1 on tablets */
    MD,
    /** Large: 3x2 on phones, 2x2 on tablets */
    LG,
    /** Extra large: 4x2+ on phones, 3x2+ on tablets */
    XL,
}

/**
 * Pre-defined sizing specification for each breakpoint.
 * All values are tested and verified for each size class.
 */
data class WidgetSizingSpec(
    // Typography
    val titleFontSize: TextUnit,
    val valueFontSize: TextUnit,
    val labelFontSize: TextUnit,
    val captionFontSize: TextUnit,
    // Spacing
    val padding: Dp,
    val spacing: Dp,
    val cornerRadius: Dp,
    // Icons
    val iconSize: Dp,
    val smallIconSize: Dp,
    // Stats widget specific
    val buttonSize: Dp,
    val buttonIconSize: Dp,
    val cardCornerRadius: Dp,
    val cardPadding: Dp,
    val cardGap: Dp,
    val headerSpacing: Dp,
)

/**
 * Determines the size class based on widget dimensions.
 *
 * Uses the geometric mean of width and height to classify,
 * similar to how Bootstrap uses viewport width.
 */
fun getWidgetSizeClass(widthDp: Float, heightDp: Float): WidgetSizeClass {
    val base = kotlin.math.sqrt(widthDp * heightDp)
    return when {
        base < 70f -> WidgetSizeClass.XS   // ~60x60 or smaller
        base < 100f -> WidgetSizeClass.SM  // ~80x80 to ~100x100
        base < 140f -> WidgetSizeClass.MD  // ~100x100 to ~140x140
        base < 200f -> WidgetSizeClass.LG  // ~140x140 to ~200x200
        else -> WidgetSizeClass.XL         // larger
    }
}

/**
 * Pre-defined sizing specs for each breakpoint.
 * These values are tested across multiple devices.
 */
private val sizingSpecs = mapOf(
    WidgetSizeClass.XS to WidgetSizingSpec(
        titleFontSize = 10.sp,
        valueFontSize = 11.sp,
        labelFontSize = 9.sp,
        captionFontSize = 8.sp,
        padding = 4.dp,
        spacing = 2.dp,
        cornerRadius = 10.dp,
        iconSize = 36.dp,
        smallIconSize = 10.dp,
        buttonSize = 28.dp,
        buttonIconSize = 16.dp,
        cardCornerRadius = 8.dp,
        cardPadding = 4.dp,
        cardGap = 3.dp,
        headerSpacing = 2.dp,
    ),
    WidgetSizeClass.SM to WidgetSizingSpec(
        titleFontSize = 12.sp,
        valueFontSize = 14.sp,
        labelFontSize = 10.sp,
        captionFontSize = 9.sp,
        padding = 6.dp,
        spacing = 4.dp,
        cornerRadius = 12.dp,
        iconSize = 44.dp,
        smallIconSize = 12.dp,
        buttonSize = 32.dp,
        buttonIconSize = 18.dp,
        cardCornerRadius = 10.dp,
        cardPadding = 6.dp,
        cardGap = 4.dp,
        headerSpacing = 3.dp,
    ),
    WidgetSizeClass.MD to WidgetSizingSpec(
        titleFontSize = 14.sp,
        valueFontSize = 16.sp,
        labelFontSize = 11.sp,
        captionFontSize = 10.sp,
        padding = 8.dp,
        spacing = 4.dp,
        cornerRadius = 14.dp,
        iconSize = 52.dp,
        smallIconSize = 12.dp,
        buttonSize = 34.dp,
        buttonIconSize = 20.dp,
        cardCornerRadius = 12.dp,
        cardPadding = 8.dp,
        cardGap = 5.dp,
        headerSpacing = 4.dp,
    ),
    WidgetSizeClass.LG to WidgetSizingSpec(
        titleFontSize = 16.sp,
        valueFontSize = 16.sp,
        labelFontSize = 12.sp,
        captionFontSize = 10.sp,
        padding = 10.dp,
        spacing = 6.dp,
        cornerRadius = 16.dp,
        iconSize = 60.dp,
        smallIconSize = 14.dp,
        buttonSize = 36.dp,
        buttonIconSize = 22.dp,
        cardCornerRadius = 12.dp,
        cardPadding = 8.dp,
        cardGap = 6.dp,
        headerSpacing = 5.dp,
    ),
    WidgetSizeClass.XL to WidgetSizingSpec(
        titleFontSize = 16.sp,
        valueFontSize = 18.sp,
        labelFontSize = 12.sp,
        captionFontSize = 10.sp,
        padding = 10.dp,
        spacing = 6.dp,
        cornerRadius = 18.dp,
        iconSize = 72.dp,
        smallIconSize = 14.dp,
        buttonSize = 38.dp,
        buttonIconSize = 22.dp,
        cardCornerRadius = 12.dp,
        cardPadding = 8.dp,
        cardGap = 6.dp,
        headerSpacing = 5.dp,
    ),
)

/**
 * Gets the sizing spec for the given widget dimensions.
 *
 * Usage:
 * ```kotlin
 * val size = LocalSize.current
 * val spec = getWidgetSizingSpec(size.width.value, size.height.value)
 *
 * Text(
 *     text = "Server",
 *     style = TextStyle(fontSize = spec.titleFontSize),
 * )
 * ```
 */
fun getWidgetSizingSpec(widthDp: Float, heightDp: Float): WidgetSizingSpec {
    val sizeClass = getWidgetSizeClass(widthDp, heightDp)
    return sizingSpecs[sizeClass] ?: sizingSpecs[WidgetSizeClass.MD]!!
}

/**
 * Aspect ratio aware layout hints.
 * Helps decide layout structure for extreme aspect ratios.
 */
enum class WidgetLayoutHint {
    /** Normal aspect ratio (0.5 to 2.0) - standard layout */
    NORMAL,
    /** Very tall (< 0.5) - consider vertical stacking */
    TALL,
    /** Very wide (> 2.0) - consider horizontal layout, smaller elements */
    WIDE,
}

fun getLayoutHint(widthDp: Float, heightDp: Float): WidgetLayoutHint {
    val aspectRatio = widthDp / heightDp
    return when {
        aspectRatio < 0.5f -> WidgetLayoutHint.TALL
        aspectRatio > 2.0f -> WidgetLayoutHint.WIDE
        else -> WidgetLayoutHint.NORMAL
    }
}
