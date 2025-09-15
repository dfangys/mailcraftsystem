# API Documentation

## Overview

MailCraftSystem provides a comprehensive REST API for email client functionality, authentication, and account management. This document outlines all available endpoints, request/response formats, and integration examples.

## Base URL

```
Production: https://api.mailcraftsystem.com/v1
Staging: https://staging-api.mailcraftsystem.com/v1
Development: http://localhost:8080/v1
```

## Authentication

### OAuth 2.0 + OTP Flow

The API uses OAuth 2.0 with One-Time Password (OTP) for secure authentication.

#### 1. Request OTP

```http
POST /auth/otp/request
Content-Type: application/json

{
  "email": "user@example.com",
  "client_id": "your_client_id"
}
```

**Response:**
```json
{
  "success": true,
  "message": "OTP sent to your email",
  "expires_in": 300
}
```

#### 2. Verify OTP

```http
POST /auth/otp/verify
Content-Type: application/json

{
  "email": "user@example.com",
  "otp": "123456",
  "client_id": "your_client_id",
  "client_secret": "your_client_secret"
}
```

**Response:**
```json
{
  "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "token_type": "Bearer",
  "expires_in": 3600,
  "scope": "read write"
}
```

#### 3. Refresh Token

```http
POST /auth/token/refresh
Content-Type: application/json
Authorization: Bearer {refresh_token}

{
  "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

**Response:**
```json
{
  "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "token_type": "Bearer",
  "expires_in": 3600
}
```

### API Key Authentication (Alternative)

For server-to-server communication:

```http
Authorization: Bearer {api_key}
X-API-Key: {api_key}
```

## User Management

### Get User Profile

```http
GET /users/me
Authorization: Bearer {access_token}
```

**Response:**
```json
{
  "id": "user_123",
  "email": "user@example.com",
  "name": "John Doe",
  "avatar_url": "https://example.com/avatar.jpg",
  "created_at": "2023-01-01T00:00:00Z",
  "updated_at": "2023-01-01T00:00:00Z",
  "preferences": {
    "timezone": "UTC",
    "language": "en",
    "theme": "light"
  }
}
```

### Update User Profile

```http
PUT /users/me
Authorization: Bearer {access_token}
Content-Type: application/json

{
  "name": "John Smith",
  "preferences": {
    "timezone": "America/New_York",
    "language": "en",
    "theme": "dark"
  }
}
```

## Account Management

### List Email Accounts

```http
GET /accounts
Authorization: Bearer {access_token}
```

**Response:**
```json
{
  "accounts": [
    {
      "id": "account_123",
      "email": "user@gmail.com",
      "provider": "gmail",
      "display_name": "Personal Gmail",
      "is_primary": true,
      "status": "active",
      "last_sync": "2023-01-01T12:00:00Z",
      "settings": {
        "sync_enabled": true,
        "sync_interval": 300,
        "notifications_enabled": true
      }
    }
  ]
}
```

### Add Email Account

```http
POST /accounts
Authorization: Bearer {access_token}
Content-Type: application/json

{
  "email": "user@company.com",
  "provider": "custom",
  "display_name": "Work Email",
  "imap_settings": {
    "host": "imap.company.com",
    "port": 993,
    "security": "ssl",
    "username": "user@company.com",
    "password": "encrypted_password"
  },
  "smtp_settings": {
    "host": "smtp.company.com",
    "port": 587,
    "security": "starttls",
    "username": "user@company.com",
    "password": "encrypted_password"
  }
}
```

**Response:**
```json
{
  "id": "account_456",
  "email": "user@company.com",
  "provider": "custom",
  "display_name": "Work Email",
  "status": "pending_verification",
  "created_at": "2023-01-01T12:00:00Z"
}
```

### Test Account Connection

```http
POST /accounts/{account_id}/test
Authorization: Bearer {access_token}
```

**Response:**
```json
{
  "success": true,
  "imap_status": "connected",
  "smtp_status": "connected",
  "capabilities": [
    "IMAP4rev1",
    "STARTTLS",
    "AUTH=PLAIN",
    "AUTH=LOGIN"
  ]
}
```

## Mailbox Operations

### List Mailboxes

```http
GET /accounts/{account_id}/mailboxes
Authorization: Bearer {access_token}
```

**Response:**
```json
{
  "mailboxes": [
    {
      "id": "mailbox_123",
      "name": "INBOX",
      "path": "INBOX",
      "parent_id": null,
      "message_count": 150,
      "unread_count": 5,
      "flags": ["\\HasChildren", "\\Subscribed"],
      "special_use": "inbox"
    },
    {
      "id": "mailbox_124",
      "name": "Sent",
      "path": "INBOX/Sent",
      "parent_id": "mailbox_123",
      "message_count": 75,
      "unread_count": 0,
      "flags": ["\\Subscribed"],
      "special_use": "sent"
    }
  ]
}
```

### Get Mailbox Details

```http
GET /accounts/{account_id}/mailboxes/{mailbox_id}
Authorization: Bearer {access_token}
```

**Response:**
```json
{
  "id": "mailbox_123",
  "name": "INBOX",
  "path": "INBOX",
  "message_count": 150,
  "unread_count": 5,
  "recent_count": 2,
  "uid_validity": 1234567890,
  "uid_next": 151,
  "flags": ["\\HasChildren", "\\Subscribed"],
  "permanent_flags": ["\\Answered", "\\Flagged", "\\Deleted", "\\Seen", "\\Draft"],
  "special_use": "inbox"
}
```

## Message Operations

### List Messages

```http
GET /accounts/{account_id}/mailboxes/{mailbox_id}/messages
Authorization: Bearer {access_token}
```

**Query Parameters:**
- `limit` (integer): Number of messages to return (default: 50, max: 100)
- `offset` (integer): Number of messages to skip (default: 0)
- `sort` (string): Sort order (`date_desc`, `date_asc`, `subject`, `from`)
- `filter` (string): Filter messages (`unread`, `flagged`, `has_attachments`)
- `search` (string): Search query

**Response:**
```json
{
  "messages": [
    {
      "id": "message_123",
      "uid": 150,
      "subject": "Important Meeting Tomorrow",
      "from": {
        "name": "Jane Smith",
        "email": "jane@company.com"
      },
      "to": [
        {
          "name": "John Doe",
          "email": "john@company.com"
        }
      ],
      "cc": [],
      "bcc": [],
      "date": "2023-01-01T12:00:00Z",
      "size": 2048,
      "flags": ["\\Seen"],
      "has_attachments": false,
      "is_read": true,
      "is_flagged": false,
      "priority": "normal",
      "preview": "Hi John, I wanted to remind you about our meeting..."
    }
  ],
  "total_count": 150,
  "unread_count": 5,
  "has_more": true
}
```

### Get Message Details

```http
GET /accounts/{account_id}/mailboxes/{mailbox_id}/messages/{message_id}
Authorization: Bearer {access_token}
```

**Response:**
```json
{
  "id": "message_123",
  "uid": 150,
  "subject": "Important Meeting Tomorrow",
  "from": {
    "name": "Jane Smith",
    "email": "jane@company.com"
  },
  "to": [
    {
      "name": "John Doe",
      "email": "john@company.com"
    }
  ],
  "cc": [],
  "bcc": [],
  "reply_to": {
    "name": "Jane Smith",
    "email": "jane@company.com"
  },
  "date": "2023-01-01T12:00:00Z",
  "size": 2048,
  "flags": ["\\Seen"],
  "headers": {
    "message-id": "<123456@company.com>",
    "in-reply-to": "<654321@company.com>",
    "references": "<654321@company.com>"
  },
  "body": {
    "text": "Hi John,\n\nI wanted to remind you about our meeting tomorrow at 2 PM.\n\nBest regards,\nJane",
    "html": "<p>Hi John,</p><p>I wanted to remind you about our meeting tomorrow at 2 PM.</p><p>Best regards,<br>Jane</p>"
  },
  "attachments": [
    {
      "id": "attachment_123",
      "filename": "agenda.pdf",
      "content_type": "application/pdf",
      "size": 1024,
      "content_id": null,
      "is_inline": false
    }
  ],
  "thread_id": "thread_456",
  "is_read": true,
  "is_flagged": false,
  "priority": "normal"
}
```

### Mark Message as Read/Unread

```http
PATCH /accounts/{account_id}/mailboxes/{mailbox_id}/messages/{message_id}
Authorization: Bearer {access_token}
Content-Type: application/json

{
  "is_read": true
}
```

### Flag/Unflag Message

```http
PATCH /accounts/{account_id}/mailboxes/{mailbox_id}/messages/{message_id}
Authorization: Bearer {access_token}
Content-Type: application/json

{
  "is_flagged": true
}
```

### Move Message

```http
POST /accounts/{account_id}/mailboxes/{mailbox_id}/messages/{message_id}/move
Authorization: Bearer {access_token}
Content-Type: application/json

{
  "destination_mailbox_id": "mailbox_456"
}
```

### Delete Message

```http
DELETE /accounts/{account_id}/mailboxes/{mailbox_id}/messages/{message_id}
Authorization: Bearer {access_token}
```

## Message Composition

### Send Message

```http
POST /accounts/{account_id}/messages/send
Authorization: Bearer {access_token}
Content-Type: application/json

{
  "to": [
    {
      "name": "Jane Smith",
      "email": "jane@company.com"
    }
  ],
  "cc": [],
  "bcc": [],
  "subject": "Meeting Follow-up",
  "body": {
    "text": "Hi Jane,\n\nThank you for the productive meeting today.\n\nBest regards,\nJohn",
    "html": "<p>Hi Jane,</p><p>Thank you for the productive meeting today.</p><p>Best regards,<br>John</p>"
  },
  "attachments": [
    {
      "filename": "notes.pdf",
      "content_type": "application/pdf",
      "content": "base64_encoded_content"
    }
  ],
  "priority": "normal",
  "delivery_receipt": false,
  "read_receipt": false
}
```

**Response:**
```json
{
  "id": "message_789",
  "status": "sent",
  "sent_at": "2023-01-01T12:30:00Z",
  "message_id": "<789012@company.com>"
}
```

### Save Draft

```http
POST /accounts/{account_id}/drafts
Authorization: Bearer {access_token}
Content-Type: application/json

{
  "to": [
    {
      "name": "Jane Smith",
      "email": "jane@company.com"
    }
  ],
  "subject": "Draft Message",
  "body": {
    "text": "This is a draft message..."
  }
}
```

### Reply to Message

```http
POST /accounts/{account_id}/mailboxes/{mailbox_id}/messages/{message_id}/reply
Authorization: Bearer {access_token}
Content-Type: application/json

{
  "body": {
    "text": "Thank you for your message. I'll get back to you soon.",
    "html": "<p>Thank you for your message. I'll get back to you soon.</p>"
  },
  "reply_all": false
}
```

## Search

### Search Messages

```http
GET /accounts/{account_id}/search
Authorization: Bearer {access_token}
```

**Query Parameters:**
- `q` (string): Search query
- `mailbox_id` (string): Limit search to specific mailbox
- `from` (string): Filter by sender
- `to` (string): Filter by recipient
- `subject` (string): Filter by subject
- `date_from` (string): Start date (ISO 8601)
- `date_to` (string): End date (ISO 8601)
- `has_attachments` (boolean): Filter messages with attachments
- `is_read` (boolean): Filter by read status
- `is_flagged` (boolean): Filter by flagged status
- `limit` (integer): Number of results (default: 50, max: 100)
- `offset` (integer): Number of results to skip

**Response:**
```json
{
  "results": [
    {
      "id": "message_123",
      "mailbox_id": "mailbox_123",
      "subject": "Important Meeting Tomorrow",
      "from": {
        "name": "Jane Smith",
        "email": "jane@company.com"
      },
      "date": "2023-01-01T12:00:00Z",
      "preview": "Hi John, I wanted to remind you about our meeting...",
      "relevance_score": 0.95
    }
  ],
  "total_count": 25,
  "search_time_ms": 150
}
```

### Save Search

```http
POST /accounts/{account_id}/saved-searches
Authorization: Bearer {access_token}
Content-Type: application/json

{
  "name": "Unread from Boss",
  "query": "from:boss@company.com is:unread",
  "parameters": {
    "from": "boss@company.com",
    "is_read": false
  }
}
```

## Synchronization

### Sync Account

```http
POST /accounts/{account_id}/sync
Authorization: Bearer {access_token}
Content-Type: application/json

{
  "full_sync": false,
  "mailboxes": ["mailbox_123", "mailbox_124"]
}
```

**Response:**
```json
{
  "sync_id": "sync_789",
  "status": "in_progress",
  "started_at": "2023-01-01T12:00:00Z",
  "estimated_completion": "2023-01-01T12:05:00Z"
}
```

### Get Sync Status

```http
GET /accounts/{account_id}/sync/{sync_id}
Authorization: Bearer {access_token}
```

**Response:**
```json
{
  "sync_id": "sync_789",
  "status": "completed",
  "started_at": "2023-01-01T12:00:00Z",
  "completed_at": "2023-01-01T12:03:00Z",
  "progress": {
    "total_mailboxes": 5,
    "completed_mailboxes": 5,
    "total_messages": 150,
    "synced_messages": 150,
    "new_messages": 3,
    "updated_messages": 2,
    "deleted_messages": 1
  },
  "errors": []
}
```

## Attachments

### Download Attachment

```http
GET /accounts/{account_id}/mailboxes/{mailbox_id}/messages/{message_id}/attachments/{attachment_id}
Authorization: Bearer {access_token}
```

**Response:**
Binary content with appropriate headers:
```
Content-Type: application/pdf
Content-Disposition: attachment; filename="document.pdf"
Content-Length: 1024
```

### Upload Attachment

```http
POST /attachments/upload
Authorization: Bearer {access_token}
Content-Type: multipart/form-data

{
  "file": (binary data),
  "filename": "document.pdf"
}
```

**Response:**
```json
{
  "id": "attachment_456",
  "filename": "document.pdf",
  "content_type": "application/pdf",
  "size": 1024,
  "upload_url": "https://storage.example.com/attachments/456",
  "expires_at": "2023-01-01T13:00:00Z"
}
```

## Webhooks

### Register Webhook

```http
POST /webhooks
Authorization: Bearer {access_token}
Content-Type: application/json

{
  "url": "https://your-app.com/webhooks/mailcraft",
  "events": ["message.received", "message.sent", "sync.completed"],
  "secret": "your_webhook_secret"
}
```

**Response:**
```json
{
  "id": "webhook_123",
  "url": "https://your-app.com/webhooks/mailcraft",
  "events": ["message.received", "message.sent", "sync.completed"],
  "created_at": "2023-01-01T12:00:00Z",
  "status": "active"
}
```

### Webhook Events

#### Message Received
```json
{
  "event": "message.received",
  "timestamp": "2023-01-01T12:00:00Z",
  "data": {
    "account_id": "account_123",
    "mailbox_id": "mailbox_123",
    "message_id": "message_456",
    "subject": "New Message",
    "from": {
      "name": "Jane Smith",
      "email": "jane@company.com"
    }
  }
}
```

## Error Handling

### Error Response Format

```json
{
  "error": {
    "code": "INVALID_REQUEST",
    "message": "The request is invalid",
    "details": "The 'email' field is required",
    "request_id": "req_123456789"
  }
}
```

### Error Codes

| Code | HTTP Status | Description |
|------|-------------|-------------|
| `INVALID_REQUEST` | 400 | Request validation failed |
| `UNAUTHORIZED` | 401 | Authentication required |
| `FORBIDDEN` | 403 | Insufficient permissions |
| `NOT_FOUND` | 404 | Resource not found |
| `RATE_LIMITED` | 429 | Too many requests |
| `SERVER_ERROR` | 500 | Internal server error |
| `SERVICE_UNAVAILABLE` | 503 | Service temporarily unavailable |

## Rate Limiting

The API implements rate limiting to ensure fair usage:

- **Authentication endpoints**: 10 requests per minute
- **Read operations**: 1000 requests per hour
- **Write operations**: 100 requests per hour
- **Search operations**: 50 requests per hour

Rate limit headers are included in responses:
```
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 999
X-RateLimit-Reset: 1640995200
```

## SDK Examples

### Dart/Flutter

```dart
import 'package:mailcraft_api/mailcraft_api.dart';

final client = MailCraftApiClient(
  baseUrl: 'https://api.mailcraftsystem.com/v1',
  accessToken: 'your_access_token',
);

// Get user profile
final user = await client.users.getProfile();
print('User: ${user.name} (${user.email})');

// List accounts
final accounts = await client.accounts.list();
for (final account in accounts) {
  print('Account: ${account.email}');
}

// Get messages
final messages = await client.messages.list(
  accountId: 'account_123',
  mailboxId: 'mailbox_123',
  limit: 20,
);

// Send message
await client.messages.send(
  accountId: 'account_123',
  message: ComposeMessage(
    to: [EmailAddress(email: 'jane@company.com', name: 'Jane Smith')],
    subject: 'Hello from API',
    body: MessageBody(text: 'This message was sent via API'),
  ),
);
```

### JavaScript/Node.js

```javascript
const MailCraftAPI = require('@mailcraft/api-client');

const client = new MailCraftAPI({
  baseURL: 'https://api.mailcraftsystem.com/v1',
  accessToken: 'your_access_token'
});

// Get user profile
const user = await client.users.getProfile();
console.log(`User: ${user.name} (${user.email})`);

// List messages
const messages = await client.messages.list({
  accountId: 'account_123',
  mailboxId: 'mailbox_123',
  limit: 20
});

// Send message
await client.messages.send({
  accountId: 'account_123',
  to: [{ email: 'jane@company.com', name: 'Jane Smith' }],
  subject: 'Hello from API',
  body: { text: 'This message was sent via API' }
});
```

### Python

```python
from mailcraft_api import MailCraftClient

client = MailCraftClient(
    base_url='https://api.mailcraftsystem.com/v1',
    access_token='your_access_token'
)

# Get user profile
user = client.users.get_profile()
print(f"User: {user.name} ({user.email})")

# List messages
messages = client.messages.list(
    account_id='account_123',
    mailbox_id='mailbox_123',
    limit=20
)

# Send message
client.messages.send(
    account_id='account_123',
    to=[{'email': 'jane@company.com', 'name': 'Jane Smith'}],
    subject='Hello from API',
    body={'text': 'This message was sent via API'}
)
```

## Testing

### Sandbox Environment

Use the sandbox environment for testing:
```
Base URL: https://sandbox-api.mailcraftsystem.com/v1
```

### Test Credentials

```json
{
  "email": "test@mailcraftsystem.com",
  "otp": "123456",
  "client_id": "test_client_id",
  "client_secret": "test_client_secret"
}
```

### Postman Collection

Download the Postman collection for easy API testing:
[MailCraft API Collection](https://api.mailcraftsystem.com/postman/collection.json)

This comprehensive API documentation provides all the information needed to integrate with MailCraftSystem's backend services.
