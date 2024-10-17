import 'package:http/http.dart' as http;
import 'dart:convert';
import 'auth_gateway_interface.dart';
import "../models/api/auth.dart";

class AuthGatewayImpl implements AuthGateway {
  final String baseUrl;
  final http.Client client;

  AuthGatewayImpl({required this.baseUrl, required this.client});

  @override
  Future<AuthStatusResponse> checkAuthenticationRequired() async {
    final response = await client.get(Uri.parse('$baseUrl/auth'));
    if (response.statusCode == 200) {
      return AuthStatusResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to check authentication requirement');
    }
  }

  @override
  Future<void> submitPassword(String password) async {
    final response = await client.post(
      Uri.parse('$baseUrl/auth'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'password': password}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to submit password for login');
    }
  }

  @override
  Future<void> deleteSession() async {
    final response = await client.delete(Uri.parse('$baseUrl/auth'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete session');
    }
  }

  @override
  Future<AppPasswordResponse> createApplicationPassword() async {
    final response = await client.get(Uri.parse('$baseUrl/auth/app'));
    if (response.statusCode == 200) {
      return AppPasswordResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create application password');
    }
  }

  @override
  Future<void> deleteSessionById(String id) async {
    final response =
        await client.delete(Uri.parse('$baseUrl/auth/session/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete session by ID');
    }
  }

  @override
  Future<SessionListResponse> getAllSessions() async {
    final response = await client.get(Uri.parse('$baseUrl/auth/sessions'));
    if (response.statusCode == 200) {
      return SessionListResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to retrieve sessions');
    }
  }

  @override
  Future<void> suggestTotpCredentials() async {
    final response = await client.get(Uri.parse('$baseUrl/auth/totp'));
    if (response.statusCode != 200) {
      throw Exception('Failed to suggest TOTP credentials');
    }
  }
}
