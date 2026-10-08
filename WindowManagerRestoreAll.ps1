# WindowManagerRestoreAll.ps1
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class WindowManager {
    [DllImport("user32.dll")]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool EnumWindows(EnumWindowsProc lpEnumFunc, IntPtr lParam);

    [DllImport("user32.dll")]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool IsWindowVisible(IntPtr hWnd);

    [DllImport("user32.dll")]
    public static extern IntPtr GetWindowText(IntPtr hWnd, System.Text.StringBuilder lpString, int nMaxCount);

    [DllImport("user32.dll")]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);

    public delegate bool EnumWindowsProc(IntPtr hWnd, IntPtr lParam);

    public static void RestoreAll() {
        EnumWindows((hWnd, lParam) => {
            if (IsWindowVisible(hWnd)) {
                // SW_RESTORE = 9 (stellt minimierte Fenster wieder her)
                ShowWindow(hWnd, 9);
            }
            return true;
        }, IntPtr.Zero);
    }
}
"@

[WindowManager]::RestoreAll()
