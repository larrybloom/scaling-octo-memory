# Quick Flutter Setup - Manual Steps

Since automated installation requires approval, here are the **quickest manual steps** to get Flutter running:

## Option 1: Using Chocolatey (Fastest - Recommended)

If you have Chocolatey installed, run in **Administrator PowerShell**:

```powershell
choco install flutter -y
```

Then restart your terminal and verify:
```powershell
flutter --version
```

## Option 2: Direct Download (5 minutes)

### Step 1: Download Flutter
1. Open this link in your browser: https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.16.9-stable.zip
2. Save to Downloads folder

### Step 2: Extract
Run in PowerShell:
```powershell
# Create directory
New-Item -ItemType Directory -Force -Path C:\src

# Extract (adjust version number if different)
Expand-Archive -Path "$env:USERPROFILE\Downloads\flutter_windows_3.16.9-stable.zip" -DestinationPath C:\src -Force
```

### Step 3: Add to PATH
Run in PowerShell:
```powershell
# Add Flutter to PATH
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
[Environment]::SetEnvironmentVariable("Path", "$currentPath;C:\src\flutter\bin", "User")

# Verify (in NEW terminal)
flutter --version
```

### Step 4: Run Flutter Doctor
Open a **NEW PowerShell window** and run:
```powershell
flutter doctor
```

## Option 3: Using Git (If you have Git installed)

```powershell
# Clone Flutter repository
cd C:\src
git clone https://github.com/flutter/flutter.git -b stable

# Add to PATH
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
[Environment]::SetEnvironmentVariable("Path", "$currentPath;C:\src\flutter\bin", "User")
```

## After Installation - Install Project Dependencies

Once Flutter is installed, navigate to your project and run:

```powershell
cd c:\Users\ADMIN\Documents\projects\eDoctor
flutter pub get
```

## Verify Everything Works

```powershell
# Check Flutter version
flutter --version

# Check doctor
flutter doctor

# Check devices
flutter devices

# Try to run the app (will show available devices)
flutter run
```

---

**Choose the option that works best for you and let me know once Flutter is installed!**
