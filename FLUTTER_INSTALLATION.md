# Flutter SDK Installation Guide for Windows

## Step 1: Download Flutter SDK

1. **Download the Flutter SDK:**
   - Visit: https://docs.flutter.dev/get-started/install/windows
   - Download the latest stable release (Flutter SDK ZIP file)
   - Recommended location: `C:\src\flutter`

2. **Extract the ZIP file:**
   ```powershell
   # Create directory if it doesn't exist
   New-Item -ItemType Directory -Force -Path C:\src
   
   # Extract Flutter (adjust path to your downloaded file)
   Expand-Archive -Path "$env:USERPROFILE\Downloads\flutter_windows_*.zip" -DestinationPath C:\src
   ```

## Step 2: Add Flutter to PATH

**Option A: Using PowerShell (Recommended)**
```powershell
# Add Flutter to User PATH
[Environment]::SetEnvironmentVariable(
    "Path",
    [Environment]::GetEnvironmentVariable("Path", "User") + ";C:\src\flutter\bin",
    "User"
)

# Restart your terminal after this
```

**Option B: Using System Settings**
1. Search for "Environment Variables" in Windows
2. Click "Environment Variables"
3. Under "User variables", select "Path" and click "Edit"
4. Click "New" and add: `C:\src\flutter\bin`
5. Click "OK" on all dialogs
6. **Restart your terminal/PowerShell**

## Step 3: Verify Installation

Open a **NEW** PowerShell window and run:

```powershell
# Check Flutter version
flutter --version

# Run Flutter doctor to check setup
flutter doctor
```

## Step 4: Install Required Dependencies

Flutter doctor will show what's missing. Common requirements:

### Android Development (Optional)
- Android Studio
- Android SDK
- Android SDK Command-line Tools

### Windows Desktop Development (Optional)
**Important for VS Code Users:** Even if you use VS Code, you **MUST** install the "Visual Studio Build Tools" to get the C++ compiler.

1. Download **Visual Studio 2022 Community** or **Build Tools for Visual Studio 2022**.
2. Run the installer.
3. Select the **"Desktop development with C++"** workload.
4. Ensure "MSVC v143 - VS 2022 C++ x64/x86 build tools" and "Windows 10/11 SDK" are checked.
5. Install and **Restart**.

This installs the *compilers* (CMake, CL.exe) that Flutter needs to build the app, while you continue using VS Code for writing code.

## Step 5: Accept Android Licenses (if using Android)

```powershell
flutter doctor --android-licenses
```

Press 'y' to accept all licenses.

## Quick Installation Script

Save this as `install_flutter.ps1` and run as Administrator:

```powershell
# Download and install Flutter
$flutterPath = "C:\src\flutter"

# Create directory
New-Item -ItemType Directory -Force -Path C:\src

# Download Flutter (update URL with latest version)
$flutterZip = "$env:TEMP\flutter.zip"
Write-Host "Downloading Flutter SDK..."
Invoke-WebRequest -Uri "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.16.0-stable.zip" -OutFile $flutterZip

# Extract
Write-Host "Extracting Flutter SDK..."
Expand-Archive -Path $flutterZip -DestinationPath C:\src -Force

# Add to PATH
Write-Host "Adding Flutter to PATH..."
$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($userPath -notlike "*flutter\bin*") {
    [Environment]::SetEnvironmentVariable(
        "Path",
        "$userPath;$flutterPath\bin",
        "User"
    )
}

Write-Host "Flutter installed! Please restart your terminal and run 'flutter doctor'"
```

## Troubleshooting

### "flutter is not recognized"
- Make sure you've added Flutter to PATH correctly
- **Restart your terminal** after adding to PATH
- Verify PATH: `echo $env:Path` (should include flutter\bin)

### PowerShell Execution Policy Error
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Long PATH Error
If PATH is too long, use a shorter installation path like `C:\flutter`

---

**After installation, proceed to install project dependencies!**
