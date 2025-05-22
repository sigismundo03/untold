import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';
import 'package:untold/data/repositories/auth/auth_repository.dart';
import 'package:untold/data/repositories/auth/auth_repository_imp.dart';
import 'package:untold/data/services/api_client/api_client.dart' show ApiClient;
import 'package:untold/data/services/shared_prefs_helper/shared_preference_helper.dart';

// Mock classes
class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockApiClient extends Mock implements ApiClient {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

class MockResponse extends Mock implements Response {}

class MockAuthCredential extends Mock implements AuthCredential {}

class FakeUserCredential extends Fake implements UserCredential {}

class FakeAuthCredential extends Fake implements AuthCredential {}

class MockSharedPreferenceHelper extends Mock
    implements SharedPreferenceHelper {}

void main() {
  AuthRepositoryImpTest.runTests();
}

class AuthRepositoryImpTest {
  // Declare variables
  late AuthRepository authRepository;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockApiClient mockApiClient;
  late MockGoogleSignIn mockGoogleSignIn;
  late MockUserCredential mockUserCredential;
  late MockUser mockUser;
  late MockGoogleSignInAccount mockGoogleSignInAccount;
  late MockGoogleSignInAuthentication mockGoogleSignInAuthentication;
  late MockSharedPreferenceHelper mockSharedPreferences;

  // Constants for test data
  static const String email = 'test@example.com';
  static const String password = 'password123';
  static const String username = 'testUser';
  static const String uid = 'test-uid';
  static const String displayName = 'Test User';

  AuthRepositoryImpTest() {
    // Initialize mocks
    mockFirebaseAuth = MockFirebaseAuth();
    mockApiClient = MockApiClient();
    mockGoogleSignIn = MockGoogleSignIn();
    mockUserCredential = MockUserCredential();
    mockUser = MockUser();
    mockGoogleSignInAccount = MockGoogleSignInAccount();
    mockGoogleSignInAuthentication = MockGoogleSignInAuthentication();
    mockSharedPreferences = MockSharedPreferenceHelper();

    // Initialize repository
    authRepository = AuthRepositoryImp(
      auth: mockFirebaseAuth,
      apiClient: mockApiClient,
      googleSignIn: mockGoogleSignIn,
      sharedPreferenceHelper: mockSharedPreferences,
    );

    // Register fallback values for non-primitive types
    registerFallbackValue(
      <String, dynamic>{},
    );
    registerFallbackValue(
      FakeUserCredential(),
    );
    registerFallbackValue(
      FakeAuthCredential(),
    );
  }

  void setUpTests() {
    setUp(() {
      // Reset mocks before each test
      reset(mockFirebaseAuth);
      reset(mockApiClient);
      reset(mockGoogleSignIn);
      reset(mockUserCredential);
      reset(mockUser);
      reset(mockGoogleSignInAccount);
      reset(mockGoogleSignInAuthentication);
    });

    group('AuthRepositoryImp', () {
      test('signInWithEmail succeeds with valid credentials', () async {
        // Arrange
        when(() => mockFirebaseAuth.signInWithEmailAndPassword(
              email: email,
              password: password,
            )).thenAnswer((_) async => mockUserCredential);
        when(() => mockUserCredential.user).thenReturn(mockUser);
        when(() => mockUser.uid).thenReturn(uid);

        // Act
        final result = await authRepository.signInWithEmail(email, password);

        // Assert
        expect(result, equals(mockUser));
        verify(() => mockFirebaseAuth.signInWithEmailAndPassword(
              email: email,
              password: password,
            )).called(1);
      });

      test('signInWithEmail throws exception on failure', () async {
        // Arrange
        when(() => mockFirebaseAuth.signInWithEmailAndPassword(
              email: email,
              password: password,
            )).thenThrow(Exception('Invalid credentials'));

        // Act & Assert
        expect(
          () => authRepository.signInWithEmail(email, password),
          throwsA(isA<Exception>()),
        );
      });

      test('registerWithEmail succeeds with valid data', () async {
        // Arrange
        when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
              email: email,
              password: password,
            )).thenAnswer((_) async => mockUserCredential);
        when(() => mockUserCredential.user).thenReturn(mockUser);
        when(() => mockUser.uid).thenReturn(uid);
        when(() => mockApiClient.post(
              '/auth/local/register',
              body: any(named: 'body'),
              hasNoToken: true,
            )).thenAnswer((_) async => MockResponse());
        when(() => mockApiClient.patch(
              '/users/updateMe',
              body: any(named: 'body'),
            )).thenAnswer((_) async => MockResponse());

        // Act
        final result = await authRepository.registerWithEmail(
          email: email,
          password: password,
          username: username,
        );

        // Assert
        expect(result, equals(mockUser));
        verify(() => mockFirebaseAuth.createUserWithEmailAndPassword(
              email: email,
              password: password,
            )).called(1);
        verify(() => mockApiClient.post(
              '/auth/local/register',
              body: {
                'username': username,
                'email': email,
                'password': password,
                'firebase_UID': uid,
              },
              hasNoToken: true,
            )).called(1);
        verify(() => mockApiClient.patch(
              '/users/updateMe',
              body: {
                'data': {'finished_onboarding': true},
              },
            )).called(1);
      });

      test('registerWithEmail throws exception on failure', () async {
        // Arrange
        when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
              email: email,
              password: password,
            )).thenThrow(Exception('Registration failed'));

        // Act & Assert
        expect(
          () => authRepository.registerWithEmail(
            email: email,
            password: password,
            username: username,
          ),
          throwsA(isA<Exception>()),
        );
      });

      test('signInWithGoogle succeeds with valid Google account', () async {
        // Arrange

        when(() => mockGoogleSignIn.signIn())
            .thenAnswer((_) async => mockGoogleSignInAccount);
        when(() => mockGoogleSignInAccount.authentication)
            .thenAnswer((_) async => mockGoogleSignInAuthentication);
        when(() => mockGoogleSignInAuthentication.accessToken)
            .thenReturn('access-token');
        when(() => mockGoogleSignInAuthentication.idToken)
            .thenReturn('id-token');
        when(() => mockFirebaseAuth.signInWithCredential(
              any(),
            )).thenAnswer((_) async => mockUserCredential);
        when(() => mockUserCredential.user).thenReturn(mockUser);
        when(() => mockUser.uid).thenReturn(uid);
        when(() => mockUser.displayName).thenReturn(displayName);
        when(() => mockUser.email).thenReturn(email);
        when(() => mockApiClient.post(
              '/auth/local/register',
              body: any(named: 'body'),
              hasNoToken: true,
            )).thenAnswer((_) async => MockResponse());
        when(() => mockApiClient.patch(
              '/users/updateMe',
              body: any(named: 'body'),
            )).thenAnswer((_) async => MockResponse());

        // Act
        final result = await authRepository.signInWithGoogle();

        // Assert
        expect(result, equals(mockUser));
        verify(() => mockGoogleSignIn.signIn()).called(1);
        verify(() => mockApiClient.post(
              '/auth/local/register',
              body: {
                'username': displayName,
                'email': email,
                'password': 'google_$uid',
                'firebase_UID': uid,
              },
              hasNoToken: true,
            )).called(1);
        verify(() => mockApiClient.patch(
              '/users/updateMe',
              body: {
                'data': {'finished_onboarding': true},
              },
            )).called(1);
      });

      test('signInWithGoogle returns null when Google sign-in is cancelled',
          () async {
        // Arrange
        when(() => mockGoogleSignIn.signIn()).thenAnswer((_) async => null);

        // Act
        final result = await authRepository.signInWithGoogle();

        // Assert
        expect(result, isNull);
        verify(() => mockGoogleSignIn.signIn()).called(1);
      });

      test('finishOnboarding updates user data successfully', () async {
        // Arrange
        when(() => mockApiClient.patch(
              '/users/updateMe',
              body: any(named: 'body'),
            )).thenAnswer((_) async => MockResponse());

        // Act
        await authRepository.finishOnboarding();

        // Assert
        verify(() => mockApiClient.patch(
              '/users/updateMe',
              body: {
                'data': {'finished_onboarding': true},
              },
            )).called(1);
      });

      test('logout signs out from Firebase and Google successfully', () async {
        // Arrange
        when(() => mockFirebaseAuth.signOut()).thenAnswer((_) async => {});
        when(() => mockGoogleSignIn.signOut()).thenAnswer((_) async => null);

        // Act
        final result = await authRepository.logout();

        // Assert
        expect(result, isTrue);
        verify(() => mockFirebaseAuth.signOut()).called(1);
        verify(() => mockGoogleSignIn.signOut()).called(1);
      });

      test('logout returns false  if an error occurs', () async {
        // Arrange
        when(() => mockFirebaseAuth.signOut())
            .thenThrow(Exception('Logout failed'));
        when(() => mockGoogleSignIn.signOut())
            .thenThrow(Exception('Logout failed'));

        // Act
        final result = await authRepository.logout();

        // Assert
        expect(result, isFalse);
      });

      test('sendPasswordResetEmail sends email successfully', () async {
        // Arrange
        when(() => mockFirebaseAuth.sendPasswordResetEmail(email: email))
            .thenAnswer((_) async => {});

        // Act
        await authRepository.sendPasswordResetEmail(email);

        // Assert
        verify(() => mockFirebaseAuth.sendPasswordResetEmail(email: email))
            .called(1);
      });

      test('sendPasswordResetEmail throws exception on failure', () async {
        // Arrange
        when(() => mockFirebaseAuth.sendPasswordResetEmail(email: email))
            .thenThrow(Exception('Password reset failed'));

        // Act & Assert
        expect(
          () => authRepository.sendPasswordResetEmail(email),
          throwsA(isA<Exception>()),
        );
      });
    });
  }

  // Entry point to run tests
  static void runTests() {
    final testClass = AuthRepositoryImpTest();
    testClass.setUpTests();
  }
}
