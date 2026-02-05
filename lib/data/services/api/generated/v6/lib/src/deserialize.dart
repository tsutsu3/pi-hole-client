import 'package:pihole_v6_api/src/model/action_flushnetwork403_response.dart';
import 'package:pihole_v6_api/src/model/action_restartdns200_response.dart';
import 'package:pihole_v6_api/src/model/add_app200_response.dart';
import 'package:pihole_v6_api/src/model/add_auth400_response.dart';
import 'package:pihole_v6_api/src/model/add_auth401_response.dart';
import 'package:pihole_v6_api/src/model/add_auth429_response.dart';
import 'package:pihole_v6_api/src/model/add_client400_response.dart';
import 'package:pihole_v6_api/src/model/add_client401_response.dart';
import 'package:pihole_v6_api/src/model/add_client_request.dart';
import 'package:pihole_v6_api/src/model/address_maybe_array.dart';
import 'package:pihole_v6_api/src/model/address_object.dart';
import 'package:pihole_v6_api/src/model/app.dart';
import 'package:pihole_v6_api/src/model/app_app.dart';
import 'package:pihole_v6_api/src/model/bad_request.dart';
import 'package:pihole_v6_api/src/model/bad_request_error.dart';
import 'package:pihole_v6_api/src/model/batch_delete_clients_request_inner.dart';
import 'package:pihole_v6_api/src/model/batch_delete_domains_request_inner.dart';
import 'package:pihole_v6_api/src/model/batch_delete_groups_request_inner.dart';
import 'package:pihole_v6_api/src/model/batch_delete_lists_request_inner.dart';
import 'package:pihole_v6_api/src/model/blocking.dart';
import 'package:pihole_v6_api/src/model/blocking_bool.dart';
import 'package:pihole_v6_api/src/model/client_history.dart';
import 'package:pihole_v6_api/src/model/client_history_clients_value.dart';
import 'package:pihole_v6_api/src/model/client_history_history_inner.dart';
import 'package:pihole_v6_api/src/model/client_maybe_array.dart';
import 'package:pihole_v6_api/src/model/client_object.dart';
import 'package:pihole_v6_api/src/model/clients_get.dart';
import 'package:pihole_v6_api/src/model/clients_get_clients_inner.dart';
import 'package:pihole_v6_api/src/model/clients_post.dart';
import 'package:pihole_v6_api/src/model/clients_put.dart';
import 'package:pihole_v6_api/src/model/comment.dart';
import 'package:pihole_v6_api/src/model/components_schemas_comment.dart';
import 'package:pihole_v6_api/src/model/components_schemas_enabled.dart';
import 'package:pihole_v6_api/src/model/components_schemas_lists_processed.dart';
import 'package:pihole_v6_api/src/model/components_schemas_lists_processed_processed.dart';
import 'package:pihole_v6_api/src/model/components_schemas_lists_processed_processed_errors_inner.dart';
import 'package:pihole_v6_api/src/model/components_schemas_lists_processed_processed_success_inner.dart';
import 'package:pihole_v6_api/src/model/components_schemas_readonly.dart';
import 'package:pihole_v6_api/src/model/config.dart';
import 'package:pihole_v6_api/src/model/config_config.dart';
import 'package:pihole_v6_api/src/model/config_config_database.dart';
import 'package:pihole_v6_api/src/model/config_config_database_network.dart';
import 'package:pihole_v6_api/src/model/config_config_debug.dart';
import 'package:pihole_v6_api/src/model/config_config_dhcp.dart';
import 'package:pihole_v6_api/src/model/config_config_dns.dart';
import 'package:pihole_v6_api/src/model/config_config_dns_blocking.dart';
import 'package:pihole_v6_api/src/model/config_config_dns_cache.dart';
import 'package:pihole_v6_api/src/model/config_config_dns_domain.dart';
import 'package:pihole_v6_api/src/model/config_config_dns_rate_limit.dart';
import 'package:pihole_v6_api/src/model/config_config_dns_reply.dart';
import 'package:pihole_v6_api/src/model/config_config_dns_reply_host.dart';
import 'package:pihole_v6_api/src/model/config_config_dns_special_domains.dart';
import 'package:pihole_v6_api/src/model/config_config_files.dart';
import 'package:pihole_v6_api/src/model/config_config_files_log.dart';
import 'package:pihole_v6_api/src/model/config_config_misc.dart';
import 'package:pihole_v6_api/src/model/config_config_misc_check.dart';
import 'package:pihole_v6_api/src/model/config_config_ntp.dart';
import 'package:pihole_v6_api/src/model/config_config_ntp_ipv4.dart';
import 'package:pihole_v6_api/src/model/config_config_ntp_ipv6.dart';
import 'package:pihole_v6_api/src/model/config_config_ntp_sync.dart';
import 'package:pihole_v6_api/src/model/config_config_ntp_sync_rtc.dart';
import 'package:pihole_v6_api/src/model/config_config_resolver.dart';
import 'package:pihole_v6_api/src/model/config_config_webserver.dart';
import 'package:pihole_v6_api/src/model/config_config_webserver_api.dart';
import 'package:pihole_v6_api/src/model/config_config_webserver_api_temp.dart';
import 'package:pihole_v6_api/src/model/config_config_webserver_interface.dart';
import 'package:pihole_v6_api/src/model/config_config_webserver_paths.dart';
import 'package:pihole_v6_api/src/model/config_config_webserver_session.dart';
import 'package:pihole_v6_api/src/model/config_config_webserver_tls.dart';
import 'package:pihole_v6_api/src/model/count.dart';
import 'package:pihole_v6_api/src/model/database.dart';
import 'package:pihole_v6_api/src/model/database_owner.dart';
import 'package:pihole_v6_api/src/model/database_owner_group.dart';
import 'package:pihole_v6_api/src/model/database_owner_user.dart';
import 'package:pihole_v6_api/src/model/database_summary.dart';
import 'package:pihole_v6_api/src/model/devices.dart';
import 'package:pihole_v6_api/src/model/devices_devices_inner.dart';
import 'package:pihole_v6_api/src/model/devices_devices_inner_ips_inner.dart';
import 'package:pihole_v6_api/src/model/domain_maybe_array.dart';
import 'package:pihole_v6_api/src/model/domain_object.dart';
import 'package:pihole_v6_api/src/model/enabled.dart';
import 'package:pihole_v6_api/src/model/endpoints.dart';
import 'package:pihole_v6_api/src/model/endpoints_endpoints.dart';
import 'package:pihole_v6_api/src/model/endpoints_endpoints_get_inner.dart';
import 'package:pihole_v6_api/src/model/endpoints_endpoints_patch_inner.dart';
import 'package:pihole_v6_api/src/model/errors_bad_request.dart';
import 'package:pihole_v6_api/src/model/errors_bad_request_error.dart';
import 'package:pihole_v6_api/src/model/forbidden.dart';
import 'package:pihole_v6_api/src/model/forbidden_error.dart';
import 'package:pihole_v6_api/src/model/ftl.dart';
import 'package:pihole_v6_api/src/model/ftl_ftl.dart';
import 'package:pihole_v6_api/src/model/ftl_ftl_clients.dart';
import 'package:pihole_v6_api/src/model/ftl_ftl_database.dart';
import 'package:pihole_v6_api/src/model/ftl_ftl_database_domains.dart';
import 'package:pihole_v6_api/src/model/ftl_ftl_database_domains_allowed.dart';
import 'package:pihole_v6_api/src/model/ftl_ftl_database_domains_denied.dart';
import 'package:pihole_v6_api/src/model/ftl_ftl_database_regex.dart';
import 'package:pihole_v6_api/src/model/ftl_ftl_database_regex_allowed.dart';
import 'package:pihole_v6_api/src/model/ftl_ftl_database_regex_denied.dart';
import 'package:pihole_v6_api/src/model/ftl_ftl_dnsmasq.dart';
import 'package:pihole_v6_api/src/model/gateway.dart';
import 'package:pihole_v6_api/src/model/gateway_gateway_inner.dart';
import 'package:pihole_v6_api/src/model/get_activity_metrics200_response.dart';
import 'package:pihole_v6_api/src/model/get_auth200_response.dart';
import 'package:pihole_v6_api/src/model/get_auth_sessions200_response.dart';
import 'package:pihole_v6_api/src/model/get_auth_totp200_response.dart';
import 'package:pihole_v6_api/src/model/get_blocking200_response.dart';
import 'package:pihole_v6_api/src/model/get_client200_response.dart';
import 'package:pihole_v6_api/src/model/get_client_metrics200_response.dart';
import 'package:pihole_v6_api/src/model/get_client_suggestions200_response.dart';
import 'package:pihole_v6_api/src/model/get_clients200_response.dart';
import 'package:pihole_v6_api/src/model/get_config200_response.dart';
import 'package:pihole_v6_api/src/model/get_dbinfo200_response.dart';
import 'package:pihole_v6_api/src/model/get_dhcp200_response.dart';
import 'package:pihole_v6_api/src/model/get_dns_log200_response.dart';
import 'package:pihole_v6_api/src/model/get_domains200_response.dart';
import 'package:pihole_v6_api/src/model/get_domains_inner.dart';
import 'package:pihole_v6_api/src/model/get_endpoints200_response.dart';
import 'package:pihole_v6_api/src/model/get_ftlinfo200_response.dart';
import 'package:pihole_v6_api/src/model/get_gateway200_response.dart';
import 'package:pihole_v6_api/src/model/get_groups200_response.dart';
import 'package:pihole_v6_api/src/model/get_hostinfo200_response.dart';
import 'package:pihole_v6_api/src/model/get_interfaces200_response.dart';
import 'package:pihole_v6_api/src/model/get_lists200_response.dart';
import 'package:pihole_v6_api/src/model/get_logininfo200_response.dart';
import 'package:pihole_v6_api/src/model/get_messages200_response.dart';
import 'package:pihole_v6_api/src/model/get_messages_count200_response.dart';
import 'package:pihole_v6_api/src/model/get_metrics_database_summary200_response.dart';
import 'package:pihole_v6_api/src/model/get_metrics_query_types200_response.dart';
import 'package:pihole_v6_api/src/model/get_metrics_recent_blocked200_response.dart';
import 'package:pihole_v6_api/src/model/get_metrics_summary200_response.dart';
import 'package:pihole_v6_api/src/model/get_metrics_top_clients200_response.dart';
import 'package:pihole_v6_api/src/model/get_metrics_top_domains200_response.dart';
import 'package:pihole_v6_api/src/model/get_metrics_upstreams200_response.dart';
import 'package:pihole_v6_api/src/model/get_metricsinfo200_response.dart';
import 'package:pihole_v6_api/src/model/get_network200_response.dart';
import 'package:pihole_v6_api/src/model/get_padd200_response.dart';
import 'package:pihole_v6_api/src/model/get_queries200_response.dart';
import 'package:pihole_v6_api/src/model/get_routes200_response.dart';
import 'package:pihole_v6_api/src/model/get_search200_response.dart';
import 'package:pihole_v6_api/src/model/get_sensors200_response.dart';
import 'package:pihole_v6_api/src/model/get_suggestions200_response.dart';
import 'package:pihole_v6_api/src/model/get_systeminfo200_response.dart';
import 'package:pihole_v6_api/src/model/get_version200_response.dart';
import 'package:pihole_v6_api/src/model/groups.dart';
import 'package:pihole_v6_api/src/model/groups_get.dart';
import 'package:pihole_v6_api/src/model/groups_get_groups_inner.dart';
import 'package:pihole_v6_api/src/model/groups_post.dart';
import 'package:pihole_v6_api/src/model/groups_put.dart';
import 'package:pihole_v6_api/src/model/headers.dart';
import 'package:pihole_v6_api/src/model/headers_headers_inner.dart';
import 'package:pihole_v6_api/src/model/host.dart';
import 'package:pihole_v6_api/src/model/host_host.dart';
import 'package:pihole_v6_api/src/model/host_host_dmi.dart';
import 'package:pihole_v6_api/src/model/host_host_dmi_bios.dart';
import 'package:pihole_v6_api/src/model/host_host_dmi_board.dart';
import 'package:pihole_v6_api/src/model/host_host_dmi_product.dart';
import 'package:pihole_v6_api/src/model/host_host_dmi_sys.dart';
import 'package:pihole_v6_api/src/model/host_host_uname.dart';
import 'package:pihole_v6_api/src/model/http_version.dart';
import 'package:pihole_v6_api/src/model/interfaces.dart';
import 'package:pihole_v6_api/src/model/interfaces_interfaces_inner.dart';
import 'package:pihole_v6_api/src/model/interfaces_interfaces_inner_addresses_inner.dart';
import 'package:pihole_v6_api/src/model/interfaces_interfaces_inner_stats.dart';
import 'package:pihole_v6_api/src/model/interfaces_interfaces_inner_stats_rx_bytes.dart';
import 'package:pihole_v6_api/src/model/interfaces_interfaces_inner_stats_tx_bytes.dart';
import 'package:pihole_v6_api/src/model/invalid_zip.dart';
import 'package:pihole_v6_api/src/model/invalid_zip_error.dart';
import 'package:pihole_v6_api/src/model/item_missing.dart';
import 'package:pihole_v6_api/src/model/item_missing_error.dart';
import 'package:pihole_v6_api/src/model/kind.dart';
import 'package:pihole_v6_api/src/model/leases.dart';
import 'package:pihole_v6_api/src/model/leases_leases_inner.dart';
import 'package:pihole_v6_api/src/model/lists_components_schemas_comment.dart';
import 'package:pihole_v6_api/src/model/lists_components_schemas_lists_processed.dart';
import 'package:pihole_v6_api/src/model/lists_components_schemas_lists_processed_processed.dart';
import 'package:pihole_v6_api/src/model/lists_components_schemas_lists_processed_processed_errors_inner.dart';
import 'package:pihole_v6_api/src/model/lists_components_schemas_lists_processed_processed_success_inner.dart';
import 'package:pihole_v6_api/src/model/lists_components_schemas_readonly.dart';
import 'package:pihole_v6_api/src/model/lists_get.dart';
import 'package:pihole_v6_api/src/model/lists_get_lists_inner.dart';
import 'package:pihole_v6_api/src/model/lists_post.dart';
import 'package:pihole_v6_api/src/model/lists_processed.dart';
import 'package:pihole_v6_api/src/model/lists_processed_processed.dart';
import 'package:pihole_v6_api/src/model/lists_processed_processed_errors_inner.dart';
import 'package:pihole_v6_api/src/model/lists_processed_processed_success_inner.dart';
import 'package:pihole_v6_api/src/model/lists_put.dart';
import 'package:pihole_v6_api/src/model/log.dart';
import 'package:pihole_v6_api/src/model/log_log_inner.dart';
import 'package:pihole_v6_api/src/model/login.dart';
import 'package:pihole_v6_api/src/model/messages.dart';
import 'package:pihole_v6_api/src/model/messages_messages_inner.dart';
import 'package:pihole_v6_api/src/model/method.dart';
import 'package:pihole_v6_api/src/model/metrics.dart';
import 'package:pihole_v6_api/src/model/metrics_metrics.dart';
import 'package:pihole_v6_api/src/model/metrics_metrics_dhcp.dart';
import 'package:pihole_v6_api/src/model/metrics_metrics_dhcp_leases.dart';
import 'package:pihole_v6_api/src/model/metrics_metrics_dns.dart';
import 'package:pihole_v6_api/src/model/metrics_metrics_dns_cache.dart';
import 'package:pihole_v6_api/src/model/metrics_metrics_dns_cache_content_inner.dart';
import 'package:pihole_v6_api/src/model/metrics_metrics_dns_cache_content_inner_count.dart';
import 'package:pihole_v6_api/src/model/metrics_metrics_dns_replies.dart';
import 'package:pihole_v6_api/src/model/model_get.dart';
import 'package:pihole_v6_api/src/model/name_maybe_array.dart';
import 'package:pihole_v6_api/src/model/name_object.dart';
import 'package:pihole_v6_api/src/model/no_payload.dart';
import 'package:pihole_v6_api/src/model/no_payload_error.dart';
import 'package:pihole_v6_api/src/model/padd.dart';
import 'package:pihole_v6_api/src/model/padd_cache.dart';
import 'package:pihole_v6_api/src/model/padd_config.dart';
import 'package:pihole_v6_api/src/model/padd_iface.dart';
import 'package:pihole_v6_api/src/model/padd_iface_v4.dart';
import 'package:pihole_v6_api/src/model/padd_iface_v4_rx_bytes.dart';
import 'package:pihole_v6_api/src/model/padd_iface_v4_tx_bytes.dart';
import 'package:pihole_v6_api/src/model/padd_iface_v6.dart';
import 'package:pihole_v6_api/src/model/padd_queries.dart';
import 'package:pihole_v6_api/src/model/padd_sensors.dart';
import 'package:pihole_v6_api/src/model/password.dart';
import 'package:pihole_v6_api/src/model/post.dart';
import 'package:pihole_v6_api/src/model/post_teleporter200_response.dart';
import 'package:pihole_v6_api/src/model/post_teleporter400_response.dart';
import 'package:pihole_v6_api/src/model/post_teleporter_request_import.dart';
import 'package:pihole_v6_api/src/model/post_teleporter_request_import_gravity.dart';
import 'package:pihole_v6_api/src/model/put.dart';
import 'package:pihole_v6_api/src/model/queries.dart';
import 'package:pihole_v6_api/src/model/queries_clients.dart';
import 'package:pihole_v6_api/src/model/queries_gravity.dart';
import 'package:pihole_v6_api/src/model/queries_queries.dart';
import 'package:pihole_v6_api/src/model/queries_queries_replies.dart';
import 'package:pihole_v6_api/src/model/queries_queries_status.dart';
import 'package:pihole_v6_api/src/model/queries_queries_types.dart';
import 'package:pihole_v6_api/src/model/query_types.dart';
import 'package:pihole_v6_api/src/model/query_types_types.dart';
import 'package:pihole_v6_api/src/model/readonly.dart';
import 'package:pihole_v6_api/src/model/recent_blocked.dart';
import 'package:pihole_v6_api/src/model/remote_addr.dart';
import 'package:pihole_v6_api/src/model/replace_client200_response.dart';
import 'package:pihole_v6_api/src/model/replace_client_request.dart';
import 'package:pihole_v6_api/src/model/replace_domain200_response.dart';
import 'package:pihole_v6_api/src/model/replace_domain400_response.dart';
import 'package:pihole_v6_api/src/model/replace_domain_request.dart';
import 'package:pihole_v6_api/src/model/replace_group200_response.dart';
import 'package:pihole_v6_api/src/model/replace_lists200_response.dart';
import 'package:pihole_v6_api/src/model/routes.dart';
import 'package:pihole_v6_api/src/model/routes_routes_inner.dart';
import 'package:pihole_v6_api/src/model/schemas_comment.dart';
import 'package:pihole_v6_api/src/model/schemas_enabled.dart';
import 'package:pihole_v6_api/src/model/schemas_groups.dart';
import 'package:pihole_v6_api/src/model/schemas_lists_processed.dart';
import 'package:pihole_v6_api/src/model/schemas_lists_processed_processed.dart';
import 'package:pihole_v6_api/src/model/schemas_lists_processed_processed_errors_inner.dart';
import 'package:pihole_v6_api/src/model/schemas_lists_processed_processed_success_inner.dart';
import 'package:pihole_v6_api/src/model/schemas_queries.dart';
import 'package:pihole_v6_api/src/model/schemas_queries_queries_inner.dart';
import 'package:pihole_v6_api/src/model/schemas_queries_queries_inner_client.dart';
import 'package:pihole_v6_api/src/model/schemas_queries_queries_inner_ede.dart';
import 'package:pihole_v6_api/src/model/schemas_queries_queries_inner_reply.dart';
import 'package:pihole_v6_api/src/model/schemas_readonly.dart';
import 'package:pihole_v6_api/src/model/schemas_suggestions.dart';
import 'package:pihole_v6_api/src/model/schemas_suggestions_clients_inner.dart';
import 'package:pihole_v6_api/src/model/schemas_type.dart';
import 'package:pihole_v6_api/src/model/search.dart';
import 'package:pihole_v6_api/src/model/search_search.dart';
import 'package:pihole_v6_api/src/model/search_search_domains_inner.dart';
import 'package:pihole_v6_api/src/model/search_search_gravity_inner.dart';
import 'package:pihole_v6_api/src/model/search_search_parameters.dart';
import 'package:pihole_v6_api/src/model/search_search_results.dart';
import 'package:pihole_v6_api/src/model/search_search_results_domains.dart';
import 'package:pihole_v6_api/src/model/search_search_results_gravity.dart';
import 'package:pihole_v6_api/src/model/sensors.dart';
import 'package:pihole_v6_api/src/model/sensors_sensors.dart';
import 'package:pihole_v6_api/src/model/sensors_sensors_list_inner.dart';
import 'package:pihole_v6_api/src/model/sensors_sensors_list_inner_temps_inner.dart';
import 'package:pihole_v6_api/src/model/session.dart';
import 'package:pihole_v6_api/src/model/session_session.dart';
import 'package:pihole_v6_api/src/model/sessions_list.dart';
import 'package:pihole_v6_api/src/model/sessions_list_sessions_inner.dart';
import 'package:pihole_v6_api/src/model/sessions_list_sessions_inner_tls.dart';
import 'package:pihole_v6_api/src/model/set_blocking400_response.dart';
import 'package:pihole_v6_api/src/model/set_blocking_request.dart';
import 'package:pihole_v6_api/src/model/string_or_list.dart';
import 'package:pihole_v6_api/src/model/success.dart';
import 'package:pihole_v6_api/src/model/suggestions.dart';
import 'package:pihole_v6_api/src/model/suggestions_suggestions.dart';
import 'package:pihole_v6_api/src/model/system.dart';
import 'package:pihole_v6_api/src/model/system_system.dart';
import 'package:pihole_v6_api/src/model/system_system_cpu.dart';
import 'package:pihole_v6_api/src/model/system_system_cpu_load.dart';
import 'package:pihole_v6_api/src/model/system_system_ftl.dart';
import 'package:pihole_v6_api/src/model/system_system_memory.dart';
import 'package:pihole_v6_api/src/model/system_system_memory_ram.dart';
import 'package:pihole_v6_api/src/model/system_system_memory_swap.dart';
import 'package:pihole_v6_api/src/model/teleporter_post.dart';
import 'package:pihole_v6_api/src/model/timer.dart';
import 'package:pihole_v6_api/src/model/too_many_requests.dart';
import 'package:pihole_v6_api/src/model/too_many_requests_error.dart';
import 'package:pihole_v6_api/src/model/took.dart';
import 'package:pihole_v6_api/src/model/top_clients.dart';
import 'package:pihole_v6_api/src/model/top_clients_clients_inner.dart';
import 'package:pihole_v6_api/src/model/top_domains.dart';
import 'package:pihole_v6_api/src/model/top_domains_domains_inner.dart';
import 'package:pihole_v6_api/src/model/total_history.dart';
import 'package:pihole_v6_api/src/model/total_history_history_inner.dart';
import 'package:pihole_v6_api/src/model/totp.dart';
import 'package:pihole_v6_api/src/model/totp_totp.dart';
import 'package:pihole_v6_api/src/model/type.dart';
import 'package:pihole_v6_api/src/model/unauthorized.dart';
import 'package:pihole_v6_api/src/model/unauthorized_error.dart';
import 'package:pihole_v6_api/src/model/unicode.dart';
import 'package:pihole_v6_api/src/model/upstreams.dart';
import 'package:pihole_v6_api/src/model/upstreams_upstreams_inner.dart';
import 'package:pihole_v6_api/src/model/upstreams_upstreams_inner_statistics.dart';
import 'package:pihole_v6_api/src/model/version.dart';
import 'package:pihole_v6_api/src/model/version_version.dart';
import 'package:pihole_v6_api/src/model/version_version_core.dart';
import 'package:pihole_v6_api/src/model/version_version_core_local.dart';
import 'package:pihole_v6_api/src/model/version_version_core_remote.dart';
import 'package:pihole_v6_api/src/model/version_version_docker.dart';
import 'package:pihole_v6_api/src/model/version_version_ftl.dart';
import 'package:pihole_v6_api/src/model/version_version_ftl_local.dart';
import 'package:pihole_v6_api/src/model/version_version_ftl_remote.dart';
import 'package:pihole_v6_api/src/model/version_version_web.dart';
import 'package:pihole_v6_api/src/model/version_version_web_local.dart';
import 'package:pihole_v6_api/src/model/version_version_web_remote.dart';

final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

  ReturnType deserialize<ReturnType, BaseType>(dynamic value, String targetType, {bool growable= true}) {
      switch (targetType) {
        case 'String':
          return '$value' as ReturnType;
        case 'int':
          return (value is int ? value : int.parse('$value')) as ReturnType;
        case 'bool':
          if (value is bool) {
            return value as ReturnType;
          }
          final valueString = '$value'.toLowerCase();
          return (valueString == 'true' || valueString == '1') as ReturnType;
        case 'double':
          return (value is double ? value : double.parse('$value')) as ReturnType;
        case 'ActionFlushnetwork403Response':
          return ActionFlushnetwork403Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ActionRestartdns200Response':
          return ActionRestartdns200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AddApp200Response':
          return AddApp200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AddAuth400Response':
          return AddAuth400Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AddAuth401Response':
          return AddAuth401Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AddAuth429Response':
          return AddAuth429Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AddClient400Response':
          return AddClient400Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AddClient401Response':
          return AddClient401Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AddClientRequest':
          return AddClientRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AddressMaybeArray':
          return AddressMaybeArray.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AddressObject':
          return AddressObject.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'App':
          return App.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AppApp':
          return AppApp.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BadRequest':
          return BadRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BadRequestError':
          return BadRequestError.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BatchDeleteClientsRequestInner':
          return BatchDeleteClientsRequestInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BatchDeleteDomainsRequestInner':
          return BatchDeleteDomainsRequestInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BatchDeleteGroupsRequestInner':
          return BatchDeleteGroupsRequestInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BatchDeleteListsRequestInner':
          return BatchDeleteListsRequestInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Blocking':
          return Blocking.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BlockingBool':
          return BlockingBool.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientHistory':
          return ClientHistory.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientHistoryClientsValue':
          return ClientHistoryClientsValue.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientHistoryHistoryInner':
          return ClientHistoryHistoryInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientMaybeArray':
          return ClientMaybeArray.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientObject':
          return ClientObject.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientsGet':
          return ClientsGet.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientsGetClientsInner':
          return ClientsGetClientsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientsPost':
          return ClientsPost.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientsPut':
          return ClientsPut.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Comment':
          return Comment.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ComponentsSchemasComment':
          return ComponentsSchemasComment.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ComponentsSchemasEnabled':
          return ComponentsSchemasEnabled.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ComponentsSchemasListsProcessed':
          return ComponentsSchemasListsProcessed.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ComponentsSchemasListsProcessedProcessed':
          return ComponentsSchemasListsProcessedProcessed.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ComponentsSchemasListsProcessedProcessedErrorsInner':
          return ComponentsSchemasListsProcessedProcessedErrorsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ComponentsSchemasListsProcessedProcessedSuccessInner':
          return ComponentsSchemasListsProcessedProcessedSuccessInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ComponentsSchemasReadonly':
          return ComponentsSchemasReadonly.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Config':
          return Config.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfig':
          return ConfigConfig.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigDatabase':
          return ConfigConfigDatabase.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigDatabaseNetwork':
          return ConfigConfigDatabaseNetwork.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigDebug':
          return ConfigConfigDebug.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigDhcp':
          return ConfigConfigDhcp.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigDns':
          return ConfigConfigDns.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigDnsBlocking':
          return ConfigConfigDnsBlocking.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigDnsCache':
          return ConfigConfigDnsCache.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigDnsDomain':
          return ConfigConfigDnsDomain.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigDnsRateLimit':
          return ConfigConfigDnsRateLimit.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigDnsReply':
          return ConfigConfigDnsReply.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigDnsReplyHost':
          return ConfigConfigDnsReplyHost.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigDnsSpecialDomains':
          return ConfigConfigDnsSpecialDomains.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigFiles':
          return ConfigConfigFiles.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigFilesLog':
          return ConfigConfigFilesLog.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigMisc':
          return ConfigConfigMisc.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigMiscCheck':
          return ConfigConfigMiscCheck.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigNtp':
          return ConfigConfigNtp.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigNtpIpv4':
          return ConfigConfigNtpIpv4.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigNtpIpv6':
          return ConfigConfigNtpIpv6.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigNtpSync':
          return ConfigConfigNtpSync.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigNtpSyncRtc':
          return ConfigConfigNtpSyncRtc.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigResolver':
          return ConfigConfigResolver.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigWebserver':
          return ConfigConfigWebserver.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigWebserverApi':
          return ConfigConfigWebserverApi.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigWebserverApiTemp':
          return ConfigConfigWebserverApiTemp.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigWebserverInterface':
          return ConfigConfigWebserverInterface.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigWebserverPaths':
          return ConfigConfigWebserverPaths.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigWebserverSession':
          return ConfigConfigWebserverSession.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ConfigConfigWebserverTls':
          return ConfigConfigWebserverTls.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Count':
          return Count.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Database':
          return Database.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DatabaseOwner':
          return DatabaseOwner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DatabaseOwnerGroup':
          return DatabaseOwnerGroup.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DatabaseOwnerUser':
          return DatabaseOwnerUser.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DatabaseSummary':
          return DatabaseSummary.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Devices':
          return Devices.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DevicesDevicesInner':
          return DevicesDevicesInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DevicesDevicesInnerIpsInner':
          return DevicesDevicesInnerIpsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DomainMaybeArray':
          return DomainMaybeArray.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DomainObject':
          return DomainObject.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Enabled':
          return Enabled.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Endpoints':
          return Endpoints.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'EndpointsEndpoints':
          return EndpointsEndpoints.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'EndpointsEndpointsGetInner':
          return EndpointsEndpointsGetInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'EndpointsEndpointsPatchInner':
          return EndpointsEndpointsPatchInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ErrorsBadRequest':
          return ErrorsBadRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ErrorsBadRequestError':
          return ErrorsBadRequestError.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Forbidden':
          return Forbidden.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ForbiddenError':
          return ForbiddenError.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Ftl':
          return Ftl.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FtlFtl':
          return FtlFtl.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FtlFtlClients':
          return FtlFtlClients.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FtlFtlDatabase':
          return FtlFtlDatabase.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FtlFtlDatabaseDomains':
          return FtlFtlDatabaseDomains.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FtlFtlDatabaseDomainsAllowed':
          return FtlFtlDatabaseDomainsAllowed.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FtlFtlDatabaseDomainsDenied':
          return FtlFtlDatabaseDomainsDenied.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FtlFtlDatabaseRegex':
          return FtlFtlDatabaseRegex.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FtlFtlDatabaseRegexAllowed':
          return FtlFtlDatabaseRegexAllowed.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FtlFtlDatabaseRegexDenied':
          return FtlFtlDatabaseRegexDenied.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FtlFtlDnsmasq':
          return FtlFtlDnsmasq.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Gateway':
          return Gateway.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GatewayGatewayInner':
          return GatewayGatewayInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetActivityMetrics200Response':
          return GetActivityMetrics200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetAuth200Response':
          return GetAuth200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetAuthSessions200Response':
          return GetAuthSessions200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetAuthTotp200Response':
          return GetAuthTotp200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetBlocking200Response':
          return GetBlocking200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetClient200Response':
          return GetClient200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetClientMetrics200Response':
          return GetClientMetrics200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetClientSuggestions200Response':
          return GetClientSuggestions200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetClients200Response':
          return GetClients200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetConfig200Response':
          return GetConfig200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetDbinfo200Response':
          return GetDbinfo200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetDhcp200Response':
          return GetDhcp200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetDnsLog200Response':
          return GetDnsLog200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetDomains200Response':
          return GetDomains200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetDomainsInner':
          return GetDomainsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetEndpoints200Response':
          return GetEndpoints200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetFtlinfo200Response':
          return GetFtlinfo200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetGateway200Response':
          return GetGateway200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetGroups200Response':
          return GetGroups200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetHostinfo200Response':
          return GetHostinfo200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetInterfaces200Response':
          return GetInterfaces200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetLists200Response':
          return GetLists200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetLogininfo200Response':
          return GetLogininfo200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetMessages200Response':
          return GetMessages200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetMessagesCount200Response':
          return GetMessagesCount200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetMetricsDatabaseSummary200Response':
          return GetMetricsDatabaseSummary200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetMetricsQueryTypes200Response':
          return GetMetricsQueryTypes200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetMetricsRecentBlocked200Response':
          return GetMetricsRecentBlocked200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetMetricsSummary200Response':
          return GetMetricsSummary200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetMetricsTopClients200Response':
          return GetMetricsTopClients200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetMetricsTopDomains200Response':
          return GetMetricsTopDomains200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetMetricsUpstreams200Response':
          return GetMetricsUpstreams200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetMetricsinfo200Response':
          return GetMetricsinfo200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetNetwork200Response':
          return GetNetwork200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetPadd200Response':
          return GetPadd200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetQueries200Response':
          return GetQueries200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetRoutes200Response':
          return GetRoutes200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetSearch200Response':
          return GetSearch200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetSensors200Response':
          return GetSensors200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetSuggestions200Response':
          return GetSuggestions200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetSysteminfo200Response':
          return GetSysteminfo200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetVersion200Response':
          return GetVersion200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Groups':
          return Groups.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GroupsGet':
          return GroupsGet.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GroupsGetGroupsInner':
          return GroupsGetGroupsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GroupsPost':
          return GroupsPost.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GroupsPut':
          return GroupsPut.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Headers':
          return Headers.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'HeadersHeadersInner':
          return HeadersHeadersInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Host':
          return Host.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'HostHost':
          return HostHost.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'HostHostDmi':
          return HostHostDmi.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'HostHostDmiBios':
          return HostHostDmiBios.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'HostHostDmiBoard':
          return HostHostDmiBoard.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'HostHostDmiProduct':
          return HostHostDmiProduct.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'HostHostDmiSys':
          return HostHostDmiSys.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'HostHostUname':
          return HostHostUname.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'HttpVersion':
          return HttpVersion.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Interfaces':
          return Interfaces.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'InterfacesInterfacesInner':
          return InterfacesInterfacesInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'InterfacesInterfacesInnerAddressesInner':
          return InterfacesInterfacesInnerAddressesInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'InterfacesInterfacesInnerStats':
          return InterfacesInterfacesInnerStats.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'InterfacesInterfacesInnerStatsRxBytes':
          return InterfacesInterfacesInnerStatsRxBytes.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'InterfacesInterfacesInnerStatsTxBytes':
          return InterfacesInterfacesInnerStatsTxBytes.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'InvalidZip':
          return InvalidZip.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'InvalidZipError':
          return InvalidZipError.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemMissing':
          return ItemMissing.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemMissingError':
          return ItemMissingError.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Kind':
          return Kind.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Leases':
          return Leases.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'LeasesLeasesInner':
          return LeasesLeasesInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListsComponentsSchemasComment':
          return ListsComponentsSchemasComment.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListsComponentsSchemasListsProcessed':
          return ListsComponentsSchemasListsProcessed.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListsComponentsSchemasListsProcessedProcessed':
          return ListsComponentsSchemasListsProcessedProcessed.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListsComponentsSchemasListsProcessedProcessedErrorsInner':
          return ListsComponentsSchemasListsProcessedProcessedErrorsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListsComponentsSchemasListsProcessedProcessedSuccessInner':
          return ListsComponentsSchemasListsProcessedProcessedSuccessInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListsComponentsSchemasReadonly':
          return ListsComponentsSchemasReadonly.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListsGet':
          return ListsGet.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListsGetListsInner':
          return ListsGetListsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListsPost':
          return ListsPost.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListsProcessed':
          return ListsProcessed.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListsProcessedProcessed':
          return ListsProcessedProcessed.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListsProcessedProcessedErrorsInner':
          return ListsProcessedProcessedErrorsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListsProcessedProcessedSuccessInner':
          return ListsProcessedProcessedSuccessInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListsPut':
          return ListsPut.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Log':
          return Log.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'LogLogInner':
          return LogLogInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Login':
          return Login.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Messages':
          return Messages.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MessagesMessagesInner':
          return MessagesMessagesInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Method':
          return Method.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Metrics':
          return Metrics.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MetricsMetrics':
          return MetricsMetrics.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MetricsMetricsDhcp':
          return MetricsMetricsDhcp.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MetricsMetricsDhcpLeases':
          return MetricsMetricsDhcpLeases.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MetricsMetricsDns':
          return MetricsMetricsDns.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MetricsMetricsDnsCache':
          return MetricsMetricsDnsCache.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MetricsMetricsDnsCacheContentInner':
          return MetricsMetricsDnsCacheContentInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MetricsMetricsDnsCacheContentInnerCount':
          return MetricsMetricsDnsCacheContentInnerCount.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MetricsMetricsDnsReplies':
          return MetricsMetricsDnsReplies.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ModelGet':
          return ModelGet.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'NameMaybeArray':
          return NameMaybeArray.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'NameObject':
          return NameObject.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'NoPayload':
          return NoPayload.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'NoPayloadError':
          return NoPayloadError.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Padd':
          return Padd.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PaddCache':
          return PaddCache.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PaddConfig':
          return PaddConfig.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PaddIface':
          return PaddIface.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PaddIfaceV4':
          return PaddIfaceV4.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PaddIfaceV4RxBytes':
          return PaddIfaceV4RxBytes.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PaddIfaceV4TxBytes':
          return PaddIfaceV4TxBytes.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PaddIfaceV6':
          return PaddIfaceV6.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PaddQueries':
          return PaddQueries.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PaddSensors':
          return PaddSensors.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Password':
          return Password.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Post':
          return Post.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PostTeleporter200Response':
          return PostTeleporter200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PostTeleporter400Response':
          return PostTeleporter400Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PostTeleporterRequestImport':
          return PostTeleporterRequestImport.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PostTeleporterRequestImportGravity':
          return PostTeleporterRequestImportGravity.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Put':
          return Put.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Queries':
          return Queries.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'QueriesClients':
          return QueriesClients.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'QueriesGravity':
          return QueriesGravity.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'QueriesQueries':
          return QueriesQueries.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'QueriesQueriesReplies':
          return QueriesQueriesReplies.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'QueriesQueriesStatus':
          return QueriesQueriesStatus.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'QueriesQueriesTypes':
          return QueriesQueriesTypes.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'QueryTypes':
          return QueryTypes.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'QueryTypesTypes':
          return QueryTypesTypes.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Readonly':
          return Readonly.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RecentBlocked':
          return RecentBlocked.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RemoteAddr':
          return RemoteAddr.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ReplaceClient200Response':
          return ReplaceClient200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ReplaceClientRequest':
          return ReplaceClientRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ReplaceDomain200Response':
          return ReplaceDomain200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ReplaceDomain400Response':
          return ReplaceDomain400Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ReplaceDomainRequest':
          return ReplaceDomainRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ReplaceGroup200Response':
          return ReplaceGroup200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ReplaceLists200Response':
          return ReplaceLists200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Routes':
          return Routes.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RoutesRoutesInner':
          return RoutesRoutesInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SchemasComment':
          return SchemasComment.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SchemasEnabled':
          return SchemasEnabled.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SchemasGroups':
          return SchemasGroups.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SchemasListsProcessed':
          return SchemasListsProcessed.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SchemasListsProcessedProcessed':
          return SchemasListsProcessedProcessed.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SchemasListsProcessedProcessedErrorsInner':
          return SchemasListsProcessedProcessedErrorsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SchemasListsProcessedProcessedSuccessInner':
          return SchemasListsProcessedProcessedSuccessInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SchemasQueries':
          return SchemasQueries.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SchemasQueriesQueriesInner':
          return SchemasQueriesQueriesInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SchemasQueriesQueriesInnerClient':
          return SchemasQueriesQueriesInnerClient.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SchemasQueriesQueriesInnerEde':
          return SchemasQueriesQueriesInnerEde.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SchemasQueriesQueriesInnerReply':
          return SchemasQueriesQueriesInnerReply.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SchemasReadonly':
          return SchemasReadonly.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SchemasSuggestions':
          return SchemasSuggestions.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SchemasSuggestionsClientsInner':
          return SchemasSuggestionsClientsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SchemasType':
          return SchemasType.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Search':
          return Search.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SearchSearch':
          return SearchSearch.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SearchSearchDomainsInner':
          return SearchSearchDomainsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SearchSearchGravityInner':
          return SearchSearchGravityInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SearchSearchParameters':
          return SearchSearchParameters.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SearchSearchResults':
          return SearchSearchResults.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SearchSearchResultsDomains':
          return SearchSearchResultsDomains.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SearchSearchResultsGravity':
          return SearchSearchResultsGravity.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Sensors':
          return Sensors.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SensorsSensors':
          return SensorsSensors.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SensorsSensorsListInner':
          return SensorsSensorsListInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SensorsSensorsListInnerTempsInner':
          return SensorsSensorsListInnerTempsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Session':
          return Session.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SessionSession':
          return SessionSession.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SessionsList':
          return SessionsList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SessionsListSessionsInner':
          return SessionsListSessionsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SessionsListSessionsInnerTls':
          return SessionsListSessionsInnerTls.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SetBlocking400Response':
          return SetBlocking400Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SetBlockingRequest':
          return SetBlockingRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'StringOrList':
          return StringOrList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Success':
          return Success.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Suggestions':
          return Suggestions.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SuggestionsSuggestions':
          return SuggestionsSuggestions.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'System':
          return System.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SystemSystem':
          return SystemSystem.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SystemSystemCpu':
          return SystemSystemCpu.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SystemSystemCpuLoad':
          return SystemSystemCpuLoad.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SystemSystemFtl':
          return SystemSystemFtl.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SystemSystemMemory':
          return SystemSystemMemory.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SystemSystemMemoryRam':
          return SystemSystemMemoryRam.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SystemSystemMemorySwap':
          return SystemSystemMemorySwap.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TeleporterPost':
          return TeleporterPost.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Timer':
          return Timer.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TooManyRequests':
          return TooManyRequests.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TooManyRequestsError':
          return TooManyRequestsError.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Took':
          return Took.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TopClients':
          return TopClients.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TopClientsClientsInner':
          return TopClientsClientsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TopDomains':
          return TopDomains.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TopDomainsDomainsInner':
          return TopDomainsDomainsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TotalHistory':
          return TotalHistory.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TotalHistoryHistoryInner':
          return TotalHistoryHistoryInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Totp':
          return Totp.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TotpTotp':
          return TotpTotp.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Type':
          return Type.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Unauthorized':
          return Unauthorized.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UnauthorizedError':
          return UnauthorizedError.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Unicode':
          return Unicode.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Upstreams':
          return Upstreams.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UpstreamsUpstreamsInner':
          return UpstreamsUpstreamsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UpstreamsUpstreamsInnerStatistics':
          return UpstreamsUpstreamsInnerStatistics.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Version':
          return Version.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VersionVersion':
          return VersionVersion.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VersionVersionCore':
          return VersionVersionCore.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VersionVersionCoreLocal':
          return VersionVersionCoreLocal.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VersionVersionCoreRemote':
          return VersionVersionCoreRemote.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VersionVersionDocker':
          return VersionVersionDocker.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VersionVersionFtl':
          return VersionVersionFtl.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VersionVersionFtlLocal':
          return VersionVersionFtlLocal.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VersionVersionFtlRemote':
          return VersionVersionFtlRemote.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VersionVersionWeb':
          return VersionVersionWeb.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VersionVersionWebLocal':
          return VersionVersionWebLocal.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VersionVersionWebRemote':
          return VersionVersionWebRemote.fromJson(value as Map<String, dynamic>) as ReturnType;
        default:
          RegExpMatch? match;

          if (value is List && (match = _regList.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return value
              .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable))
              .toList(growable: growable) as ReturnType;
          }
          if (value is Set && (match = _regSet.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return value
              .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable))
              .toSet() as ReturnType;
          }
          if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
            targetType = match![1]!.trim(); // ignore: parameter_assignments
            return Map<String, BaseType>.fromIterables(
              value.keys as Iterable<String>,
              value.values.map((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable)),
            ) as ReturnType;
          }
          break;
    }
    throw Exception('Cannot deserialize');
  }