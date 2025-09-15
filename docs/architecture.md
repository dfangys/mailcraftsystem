# Architecture Guide

## Overview

MailCraftSystem follows a **Feature-First Domain-Driven Design (DDD)** architecture that promotes maintainability, testability, and scalability. This document provides a comprehensive guide to the architectural decisions and patterns used throughout the application.

## Architectural Principles

### 1. Feature-First Organization
- Features are organized as independent modules
- Each feature contains its own domain, data, and presentation layers
- Promotes team autonomy and parallel development
- Reduces coupling between features

### 2. Domain-Driven Design
- Business logic is isolated in the domain layer
- Rich domain models with behavior
- Repository pattern for data access abstraction
- Use cases encapsulate business operations

### 3. Clean Architecture
- Dependency inversion principle
- Inner layers don't depend on outer layers
- Framework-independent business logic
- Testable and maintainable code

### 4. SOLID Principles
- Single Responsibility Principle
- Open/Closed Principle
- Liskov Substitution Principle
- Interface Segregation Principle
- Dependency Inversion Principle

## Directory Structure

```
lib/
├── app/                    # Application Layer
│   ├── bootstrap.dart      # App initialization and setup
│   ├── router/            # Navigation and routing
│   │   ├── app_router.dart
│   │   └── route_guards.dart
│   ├── theme/             # UI theming and styling
│   │   ├── app_theme.dart
│   │   ├── color_scheme.dart
│   │   └── typography.dart
│   └── di/                # Dependency injection
│       ├── injection.dart
│       └── modules/
├── core/                   # Cross-cutting Concerns
│   ├── env/               # Environment configuration
│   │   └── env_config.dart
│   ├── error/             # Error handling
│   │   ├── failures.dart
│   │   └── exceptions.dart
│   ├── logging/           # Logging utilities
│   │   └── logger.dart
│   ├── network/           # Network clients
│   │   ├── dio_client.dart
│   │   └── interceptors/
│   ├── security/          # Security services
│   │   ├── encryption_service.dart
│   │   └── security_audit_service.dart
│   ├── accessibility/     # Accessibility services
│   │   └── accessibility_service.dart
│   ├── privacy/           # Privacy compliance
│   │   └── privacy_service.dart
│   └── utils/             # Utility functions
│       └── extensions.dart
├── shared/                 # Shared Components
│   ├── widgets/           # Reusable UI components
│   │   ├── loading_widget.dart
│   │   ├── error_widget.dart
│   │   └── buttons/
│   └── forms/             # Form components
│       └── app_text_field.dart
├── features/              # Business Features
│   ├── auth/              # Authentication Feature
│   │   ├── domain/
│   │   │   ├── models/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   └── repositories/
│   │   └── presentation/
│   │       ├── pages/
│   │       ├── widgets/
│   │       └── providers/
│   ├── account/           # Account Management
│   ├── mailboxes/         # Mailbox Operations
│   ├── messages/          # Message Handling
│   ├── compose/           # Email Composition
│   ├── sync/              # Synchronization
│   └── search/            # Search Functionality
└── l10n/                  # Internationalization
    ├── app_en.arb
    ├── app_es.arb
    └── l10n.yaml
```

## Layer Architecture

### 1. Presentation Layer
**Responsibility**: User interface and user interaction handling

**Components**:
- **Pages**: Full-screen UI components
- **Widgets**: Reusable UI components
- **Providers**: State management with Riverpod
- **View Models**: Presentation logic

**Key Patterns**:
- MVVM (Model-View-ViewModel)
- State management with Riverpod
- Reactive programming with streams

```dart
// Example: Auth page structure
class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    
    return authState.when(
      data: (user) => _buildAuthenticatedView(user),
      loading: () => const LoadingWidget(),
      error: (error, stack) => ErrorWidget(error: error),
    );
  }
}
```

### 2. Domain Layer
**Responsibility**: Business logic and rules

**Components**:
- **Models**: Business entities with behavior
- **Repositories**: Abstract data access interfaces
- **Use Cases**: Business operations
- **Value Objects**: Domain-specific types

**Key Patterns**:
- Repository pattern
- Use case pattern
- Domain events
- Value objects

```dart
// Example: Domain model
@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    required String subject,
    required MessageAddress from,
    required List<MessageAddress> to,
    required DateTime date,
    required String textPlain,
    String? textHtml,
    List<MessageAttachment>? attachments,
    @Default(false) bool isRead,
    @Default(false) bool isFlagged,
    MessagePriority? priority,
  }) = _Message;
  
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}

// Example: Use case
class SendMessageUseCase {
  const SendMessageUseCase(this._repository);
  
  final ComposeRepository _repository;
  
  Future<Either<Failure, void>> call(ComposeMessage message) async {
    // Validate message
    if (!message.isReadyToSend) {
      return Left(ValidationFailure('Message is not ready to send'));
    }
    
    // Send message
    return _repository.sendMessage(message);
  }
}
```

### 3. Data Layer
**Responsibility**: Data access and external service integration

**Components**:
- **Repository Implementations**: Concrete data access
- **Data Sources**: External service clients
- **DTOs**: Data transfer objects
- **Mappers**: Data transformation

**Key Patterns**:
- Repository implementation
- Data source abstraction
- DTO pattern
- Mapper pattern

```dart
// Example: Repository implementation
class MessageRepositoryImpl implements MessageRepository {
  const MessageRepositoryImpl(this._apiClient, this._localStorage);
  
  final MessageApiClient _apiClient;
  final MessageLocalStorage _localStorage;
  
  @override
  Future<Either<Failure, List<Message>>> getMessages(
    String accountId,
    String mailboxPath, {
    int? limit,
    int? offset,
  }) async {
    try {
      // Try local storage first
      final localMessages = await _localStorage.getMessages(
        accountId,
        mailboxPath,
        limit: limit,
        offset: offset,
      );
      
      if (localMessages.isNotEmpty) {
        return Right(localMessages);
      }
      
      // Fetch from API
      final apiMessages = await _apiClient.getMessages(
        accountId,
        mailboxPath,
        limit: limit,
        offset: offset,
      );
      
      // Cache locally
      await _localStorage.saveMessages(apiMessages);
      
      return Right(apiMessages);
    } catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }
}
```

## State Management

### Riverpod Architecture
We use Riverpod for state management with the following patterns:

#### 1. Provider Types
- **Provider**: Immutable data
- **StateProvider**: Simple mutable state
- **StateNotifierProvider**: Complex state with business logic
- **FutureProvider**: Asynchronous data
- **StreamProvider**: Reactive data streams

#### 2. Provider Organization
```dart
// Feature-specific providers
final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue<User?>>((ref) {
  return AuthNotifier(ref.read(authRepositoryProvider));
});

final messagesProvider = FutureProvider.family<List<Message>, String>((ref, mailboxPath) {
  final repository = ref.read(messageRepositoryProvider);
  return repository.getMessages(mailboxPath);
});

// Global providers
final themeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);
final localeProvider = StateProvider<Locale>((ref) => const Locale('en'));
```

#### 3. State Notifiers
```dart
class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  AuthNotifier(this._repository) : super(const AsyncValue.loading());
  
  final AuthRepository _repository;
  
  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    
    final result = await _repository.login(email, password);
    
    result.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (user) => state = AsyncValue.data(user),
    );
  }
}
```

## Dependency Injection

### Service Locator Pattern
We use a combination of Riverpod and manual dependency injection:

```dart
// Core services
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.interceptors.addAll([
    LoggingInterceptor(),
    AuthInterceptor(ref.read(authRepositoryProvider)),
    ErrorInterceptor(),
  ]);
  return dio;
});

final encryptionServiceProvider = Provider<EncryptionService>((ref) {
  return EncryptionService.instance;
});

// Repository providers
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    ref.read(authApiClientProvider),
    ref.read(secureStorageProvider),
  );
});
```

## Error Handling

### Failure Types
```dart
abstract class Failure {
  const Failure(this.message);
  final String message;
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

class AuthenticationFailure extends Failure {
  const AuthenticationFailure(super.message);
}
```

### Error Handling Pattern
```dart
// Repository method
Future<Either<Failure, User>> login(String email, String password) async {
  try {
    final user = await _apiClient.login(email, password);
    return Right(user);
  } on DioException catch (e) {
    return Left(NetworkFailure(e.message ?? 'Network error'));
  } catch (e) {
    return Left(UnknownFailure(e.toString()));
  }
}

// UI handling
final result = await ref.read(authProvider.notifier).login(email, password);
result.fold(
  (failure) => _showError(failure.message),
  (user) => _navigateToHome(),
);
```

## Testing Strategy

### Test Pyramid
1. **Unit Tests**: Domain logic and use cases
2. **Widget Tests**: UI components
3. **Integration Tests**: Feature workflows

### Test Organization
```
test/
├── unit/
│   ├── domain/
│   │   ├── models/
│   │   └── usecases/
│   └── data/
│       └── repositories/
├── widget/
│   ├── pages/
│   └── widgets/
└── integration/
    └── features/
```

### Testing Patterns
```dart
// Unit test example
group('SendMessageUseCase', () {
  late SendMessageUseCase useCase;
  late MockComposeRepository mockRepository;
  
  setUp(() {
    mockRepository = MockComposeRepository();
    useCase = SendMessageUseCase(mockRepository);
  });
  
  test('should send message when valid', () async {
    // Arrange
    final message = ComposeMessage.newMessage(accountId: 'test');
    when(() => mockRepository.sendMessage(message))
        .thenAnswer((_) async => const Right(null));
    
    // Act
    final result = await useCase(message);
    
    // Assert
    expect(result, const Right(null));
    verify(() => mockRepository.sendMessage(message)).called(1);
  });
});
```

## Security Architecture

### Data Protection
- **Encryption at Rest**: AES-256 encryption for sensitive data
- **Encryption in Transit**: TLS 1.3 for network communications
- **Key Management**: Secure key derivation and storage
- **Certificate Pinning**: Prevent MITM attacks

### Authentication Flow
```dart
// OAuth 2.0 + OTP flow
class AuthenticationFlow {
  Future<Either<Failure, User>> authenticate(String email) async {
    // 1. Request OTP
    final otpResult = await _requestOTP(email);
    if (otpResult.isLeft()) return otpResult.cast();
    
    // 2. Verify OTP
    final verifyResult = await _verifyOTP(email, otp);
    if (verifyResult.isLeft()) return verifyResult.cast();
    
    // 3. Exchange for tokens
    final tokenResult = await _exchangeTokens(verifyResult.right);
    if (tokenResult.isLeft()) return tokenResult.cast();
    
    // 4. Get user profile
    return _getUserProfile(tokenResult.right);
  }
}
```

## Performance Considerations

### Optimization Strategies
1. **Lazy Loading**: Load data on demand
2. **Caching**: Multi-level caching strategy
3. **Pagination**: Efficient data loading
4. **Background Processing**: Non-blocking operations
5. **Memory Management**: Proper resource cleanup

### Caching Strategy
```dart
class CacheManager {
  static const Duration _defaultTtl = Duration(hours: 1);
  
  final Map<String, CacheEntry> _cache = {};
  
  T? get<T>(String key) {
    final entry = _cache[key];
    if (entry == null || entry.isExpired) {
      _cache.remove(key);
      return null;
    }
    return entry.value as T;
  }
  
  void set<T>(String key, T value, {Duration? ttl}) {
    _cache[key] = CacheEntry(
      value: value,
      expiresAt: DateTime.now().add(ttl ?? _defaultTtl),
    );
  }
}
```

## Accessibility Architecture

### WCAG 2.1 Compliance
- **Semantic Markup**: Proper widget semantics
- **Focus Management**: Logical focus order
- **Color Contrast**: 4.5:1 minimum ratio
- **Text Scaling**: Support for 200% scaling
- **Screen Reader**: Full compatibility

### Accessibility Service
```dart
class AccessibilityService {
  Widget createAccessibleButton({
    required String label,
    required VoidCallback onPressed,
    String? hint,
  }) {
    return Semantics(
      label: label,
      hint: hint,
      button: true,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
```

## Internationalization

### Localization Strategy
- **ARB Files**: Application Resource Bundle format
- **Code Generation**: Automatic locale generation
- **Context-Aware**: Locale-specific formatting
- **RTL Support**: Right-to-left language support

```dart
// Generated localization
class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of(context, AppLocalizations)!;
  }
  
  String get loginTitle => Intl.message(
    'Login',
    name: 'loginTitle',
    desc: 'Title for login page',
  );
}
```

## Monitoring and Analytics

### Observability
- **Logging**: Structured logging with levels
- **Metrics**: Performance and usage metrics
- **Tracing**: Request/response tracing
- **Error Tracking**: Crash reporting and error logs

### Analytics Architecture
```dart
class AnalyticsService {
  void trackEvent(String event, Map<String, dynamic> parameters) {
    if (_hasConsent()) {
      _analyticsProviders.forEach((provider) {
        provider.trackEvent(event, parameters);
      });
    }
  }
  
  bool _hasConsent() {
    return PrivacyService.instance.getConsentStatus(ConsentType.analytics) 
        == ConsentStatus.granted;
  }
}
```

## Deployment Architecture

### Build Configuration
- **Environment-specific**: Different configs per environment
- **Code Obfuscation**: Production code protection
- **Asset Optimization**: Compressed assets
- **Security Hardening**: Runtime protection

### CI/CD Pipeline
```yaml
# GitHub Actions workflow
name: Build and Deploy
on:
  push:
    branches: [main]
    
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter test
      - run: flutter test integration_test/
      
  build:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter build apk --release
      - run: flutter build appbundle --release
```

## Future Considerations

### Scalability
- **Microservices**: Service decomposition
- **Event Sourcing**: Event-driven architecture
- **CQRS**: Command Query Responsibility Segregation
- **Horizontal Scaling**: Multi-instance deployment

### Technology Evolution
- **Flutter Updates**: Framework evolution
- **Dart Language**: Language improvements
- **Platform APIs**: New platform capabilities
- **Security Standards**: Evolving security requirements

This architecture provides a solid foundation for building a maintainable, scalable, and secure email client while following industry best practices and design patterns.
