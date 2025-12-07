// ==================================================================
// biometric_service.dart — Service biométrique PRO
// Projet : empreinte_verif
// Auteur : Agent Militaire v3.0
// ==================================================================

import 'package:local_auth/local_auth.dart';

class BiometricService {
  final LocalAuthentication _auth = LocalAuthentication();

  // ---------------------------------------------------------------
  // Vérifier si le device supporte la biométrie
  // ---------------------------------------------------------------
  Future<bool> isBiometricAvailable() async {
    try {
      return await _auth.canCheckBiometrics;
    } catch (e) {
      return false;
    }
  }

  // ---------------------------------------------------------------
  // Vérifier les types de biométrie disponibles (empreinte, visage…)
  // ---------------------------------------------------------------
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } catch (e) {
      return [];
    }
  }

  // ---------------------------------------------------------------
  // Lancer la vérification biométrique
  // ---------------------------------------------------------------
  Future<bool> authenticate() async {
    try {
      return await _auth.authenticate(
        localizedReason: "Veuillez confirmer votre identité",
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: false,
          useErrorDialogs: true,
        ),
      );
    } catch (e) {
      return false;
    }
  }
}
