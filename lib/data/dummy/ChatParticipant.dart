final List<Map<String, dynamic>> dummyChatParticipants = [
  // Private room r1 (u1 <-> u2)
  {
    "room_id": "r1",
    "user_id": "u1",
    "is_admin": false,
    "joined_at": "2025-09-04T09:00:00Z",
  },
  {
    "room_id": "r1",
    "user_id": "u2",
    "is_admin": false,
    "joined_at": "2025-09-04T09:00:00Z",
  },

  // Private room r2 (u2 <-> u3)
  {
    "room_id": "r2",
    "user_id": "u2",
    "is_admin": false,
    "joined_at": "2025-09-04T09:10:00Z",
  },
  {
    "room_id": "r2",
    "user_id": "u3",
    "is_admin": false,
    "joined_at": "2025-09-04T09:10:00Z",
  },

  // Group room r3 (u1, u2, u3)
  {
    "room_id": "r3",
    "user_id": "u1",
    "is_admin": true,
    "joined_at": "2025-09-04T09:20:00Z",
  },
  {
    "room_id": "r3",
    "user_id": "u2",
    "is_admin": false,
    "joined_at": "2025-09-04T09:21:00Z",
  },
  {
    "room_id": "r3",
    "user_id": "u3",
    "is_admin": false,
    "joined_at": "2025-09-04T09:22:00Z",
  },
];
