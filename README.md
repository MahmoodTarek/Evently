# Evently

Not Implemented yet! (under constructor)



# Splash Screen

- Added a Splash Screen for all platforms using flutter_native_splash
- Supported both Light Mode and Dark Mode

# Preview

| Platform | Light Mode | Dark Mode |
|--------|--------|--------|
| Android (Below 12) | <img src="https://github.com/user-attachments/assets/6f38b473-87a2-4e5d-bef1-af7ecbe86fc7" width="250"/> | <img src="https://github.com/user-attachments/assets/91ab81c1-01e8-4849-b486-3525e6e41cde" width="250"/> |
| Android (12+) | <img src="https://github.com/user-attachments/assets/d74fe9a9-c0d6-460a-b1ff-1cf2c5340bbb" width="250"/> | <img src="https://github.com/user-attachments/assets/90e107b3-5f9c-4ff5-8b37-acf57ae8be72" width="250"/> |

---
# Onboarding Flow
### Features
* Added onboarding screens using `PageView`.
* Created reusable onboarding data model.
* Added custom onboarding bottom section for navigation.
* Implemented smooth page navigation between onboarding screens.
* Added responsive UI for different screen sizes.
* Added onboarding assets with support for multiple resolutions.

### Shared Preferences Integration

Implemented first-launch detection using `SharedPreferences`.

### Behavior

* Show onboarding screens only on the first app launch.
* Skip onboarding for returning users.
* Navigate to the Login screen after completing onboarding.
* Persist onboarding completion state locally.

### Navigation Flow

```text
Splash Screen
      ↓
First Launch?
      ↓
     Yes ──► Onboarding ──► Login
      ↓
      No
      ↓
    Login
```

---

## Screenshots

### Dark Mode

<p align="center">
  <img src="https://github.com/user-attachments/assets/cba91432-a230-4e20-9d59-b0e3dcb0cd3f" width="180"/>
  <img src="https://github.com/user-attachments/assets/14ef0f56-76d3-4b62-9536-23465a09fcf0" width="180"/>
  <img src="https://github.com/user-attachments/assets/4a55053a-2f6b-4832-b4d2-b465405ff7e8" width="180"/>
  <img src="https://github.com/user-attachments/assets/16ec1009-cc3f-4df0-932c-d16e556d1695" width="180"/>

</p>

### Light Mode

<p align="center">
  <img src="https://github.com/user-attachments/assets/5d030eeb-93b3-4c4f-b671-03a58ea344db" width="180"/>
  <img src="https://github.com/user-attachments/assets/becbee7c-cc87-4d0c-be5b-75a3a7a23e92" width="180"/>
  <img src="https://github.com/user-attachments/assets/d8f8857e-b783-4f8c-b8db-70d766c34a93" width="180"/>
  <img src="https://github.com/user-attachments/assets/bec72b2f-00f9-47d7-8549-73af59157257" width="180"/>
</p>

---

## Video Preview

https://github.com/user-attachments/assets/0c605602-490a-49c4-b3ba-52360273cf0e

---

## Packages Used

* introduction_screen
* shared_preferences

---

## Notes

* The onboarding screen is displayed only once after the app is installed.
* The onboarding completion state is stored locally using SharedPreferences.
* Returning users are redirected directly to the Login screen.
