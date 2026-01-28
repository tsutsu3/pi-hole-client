package io.github.tsutsu3.pi_hole_client.widget.testutils

import io.github.tsutsu3.pi_hole_client.widget.common.ToggleWidgetState
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetState
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetStatus

/**
 * テストデータのファクトリー関数
 */
object TestData {

    /**
     * 標準的なWidgetStateを生成
     */
    fun createWidgetState(
        serverId: String = "test-server-1",
        serverName: String = "Test Server",
        status: WidgetStatus = WidgetStatus.BLOCKING_ON,
        totalQueries: String = "50,000",
        blockedQueries: String = "10,000",
        percentBlocked: String = "20.0%",
        domainsOnAdlists: String = "100,000",
        uptime: String = "1d 0h",
        cpuTemp: String = "45°C",
        cpuUsage: String = "10%",
        memUsage: String = "50%",
        updatedAt: String = "2026-01-28 10:00:00",
        actionsEnabled: Boolean = true
    ): WidgetState {
        return WidgetState(
            serverId = serverId,
            serverName = serverName,
            status = status,
            totalQueries = totalQueries,
            blockedQueries = blockedQueries,
            percentBlocked = percentBlocked,
            domainsOnAdlists = domainsOnAdlists,
            uptime = uptime,
            cpuTemp = cpuTemp,
            cpuUsage = cpuUsage,
            memUsage = memUsage,
            updatedAt = updatedAt,
            actionsEnabled = actionsEnabled
        )
    }

    /**
     * 標準的なToggleWidgetStateを生成
     */
    fun createToggleWidgetState(
        serverId: String = "test-server-1",
        serverName: String = "Test Server",
        status: WidgetStatus = WidgetStatus.BLOCKING_ON,
        actionsEnabled: Boolean = true
    ): ToggleWidgetState {
        return ToggleWidgetState(
            serverId = serverId,
            serverName = serverName,
            status = status,
            actionsEnabled = actionsEnabled
        )
    }

    /**
     * エラー状態のWidgetStateを生成
     */
    fun createErrorWidgetState(
        serverName: String = "Test Server"
    ): WidgetState {
        return createWidgetState(
            serverName = serverName,
            status = WidgetStatus.ERROR,
            actionsEnabled = false
        )
    }

    /**
     * 認証必要状態のWidgetStateを生成
     */
    fun createAuthRequiredWidgetState(
        serverName: String = "Test Server"
    ): WidgetState {
        return createWidgetState(
            serverName = serverName,
            status = WidgetStatus.AUTH_REQUIRED,
            actionsEnabled = false
        )
    }

    /**
     * ブロック無効状態のWidgetStateを生成
     */
    fun createBlockingOffWidgetState(
        serverName: String = "Test Server"
    ): WidgetState {
        return createWidgetState(
            serverName = serverName,
            status = WidgetStatus.BLOCKING_OFF
        )
    }

    /**
     * エラー状態のToggleWidgetStateを生成
     */
    fun createErrorToggleWidgetState(
        serverName: String = "Test Server"
    ): ToggleWidgetState {
        return createToggleWidgetState(
            serverName = serverName,
            status = WidgetStatus.ERROR,
            actionsEnabled = false
        )
    }

    /**
     * 認証必要状態のToggleWidgetStateを生成
     */
    fun createAuthRequiredToggleWidgetState(
        serverName: String = "Test Server"
    ): ToggleWidgetState {
        return createToggleWidgetState(
            serverName = serverName,
            status = WidgetStatus.AUTH_REQUIRED,
            actionsEnabled = false
        )
    }
}
