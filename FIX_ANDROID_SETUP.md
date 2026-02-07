# Fixing Android Toolchain Issues

## Step 1: Install `cmdline-tools` (The "X" Error)

1.  Open **Android Studio**.
2.  On the Welcome screen, click **More Actions** (three dots) > **SDK Manager**.
    *   *If you are already inside a project:* Go to **File > Settings > Languages & Frameworks > Android SDK**.
3.  In the SDK Manager window, click the **"SDK Tools"** tab (middle tab).
4.  Look for **"Android SDK Command-line Tools (latest)"** in the list.
5.  **Check the box** next to it.
6.  Click **Apply** and let it download/install.
7.  Click **OK** or Finish when done.

## Step 2: Accept Licenses (The "License" Error)

Once Step 1 is finished, go back to your terminal/VS Code and run this exact command:

```powershell
flutter doctor --android-licenses
```

*   It will ask you to review licenses.
*   Press **`y`** + **Enter** repeatedly (usually 5-7 times) to accept all of them.

## Step 3: Final Verification

Run `flutter doctor` again. You should now see all green checks for Android! ✅
