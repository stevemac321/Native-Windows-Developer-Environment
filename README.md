# Native-Windows-Developer-Environment
This guide walks you through setting up a modern C/C++ and Rust developer environment on native Windows (no WSL or MSYS2 required).

Included Tools:
- Clang/LLVM (prebuilt for Windows)
- Rust via rustup
- Git
- Visual Studio Code (with C++ and Rust extensions)
- WinDbg (via Windows SDK)
- Vim
- Universal Ctags and Cscope
- Clang-Format
- Sysinternals Suite

## 1. Install Clang/LLVM

Download the latest prebuilt LLVM/Clang Windows archive from:

    https://github.com/llvm/llvm-project/releases

Find and download the file named:

    clang+llvm-20.1.3-x86_64-pc-windows-msvc.tar.xz

Right click “extract all” or using a tool like 7-Zip. Example destination:

    C:\Tools\clang

Specify location and “add to path or add the bin folder to your PATH:

    setx PATH "%PATH%;C:\Tools\llvm-20.1.3\bin"

Verify installation in a new PowerShell window:

    clang --version

Test LLDB debugger, if you get a popup about missing dependence python310.dll, install python310:  
Install Python 3.10  
Download from: https://www.python.org/downloads/release/python-31010/

Choose win64 Windows installer.  During install, choose custom install:  
Check “Add Python 3.10 to PATH”  
Choose “Install for all users” (if available and you’re OK with admin access)
( I install everything)
Test it:
  python --version  (should say Python 3.10 or something like that with minor version).
  lldb --version (should no longer have the missing python310.dll popup).

## 2. Install Rust via rustup

Open PowerShell and run:

    irm https://sh.rustup.rs | iex

Follow the prompts to install Rust and Cargo.

Verify installation:

    rustc --version  
    cargo --version

## 3. Install Git

Download the Git for Windows installer from:

    https://git-scm.com/download/win

Use the default options, and make sure "Git from the command line and also from 3rd-party software" is selected.

Verify:

    git --version

Optionally configure your user identity:

    git config --global user.name "Your Name"  
    git config --global user.email "your@email.com"

## 4. Install Visual Studio Code

Download and install VSCode from:

    https://code.visualstudio.com/

Install the following extensions:
- "C/C++"
- "Rust Analyzer"
- "CodeLLDB"

To add it permanently to your PATH:

    setx PATH "%PATH%;C:\Users\<YourUser>\AppData\Local\Programs\Microsoft VS Code\bin"

Replace `<YourUser>` with your actual Windows username.

## 5. Install Visual Studio Community Edition

Download the free installer for Visual Studio Community Edition from:

https://visualstudio.microsoft.com/vs/community/

Run the installer and select the following workloads:

- Desktop development with C++
- (Optional) Python and C# development, whatever else, Azure, IoT, etc.

These workloads will include the necessary compilers and libraries for native Windows development, and allow you to build and debug C++ and Python projects inside Visual Studio.

You do not need to install all of Visual Studio if you plan to use other tools like Vim or VSCode, but it's helpful to have the compilers and SDKs available.

```powershell
where cl
where msbuild
```

These commands can help verify that the Visual Studio build tools are on your PATH.


## 6. Install Windows SDK and WinDbg

Download the Windows SDK installer from:

    https://developer.microsoft.com/en-us/windows/downloads/sdk-archive/

During installation, select only:

    [x] Debugging Tools for Windows

This installs WinDbg (classic) to a stable path:

    C:\Program Files (x86)\Windows Kits\10\Debuggers\x64\windbg.exe

(Optional) Add the debugger path to your system PATH:

    setx PATH "%PATH%;C:\Program Files (x86)\Windows Kits\10\Debuggers\x64"

Then open a new PowerShell window and verify:

    windbg

## 7. Install Vim

Download the latest Windows version of Vim from:

    https://www.vim.org/download.php

Or install via Chocolatey (if you have it):

    choco install vim

Verify installation:

    vim --version

## 8. Install Universal Ctags

Download a Windows release of Universal Ctags from:

    https://github.com/universal-ctags/ctags-win32/releases
    choose the one with "clang" in the name.

Extract the files to a folder (e.g., C:\Tools\ctags) and add that folder to your system PATH.

Verify:

    ctags --version

## 9. Install Cscope

Download a Windows build of cscope (e.g., scopedb) from:

    https://github.com/andmarti1424/scopedb/releases

Extract and place the binary in a directory in your PATH.

Verify:

    cscope -V

## 10. Configure clang-format

If you installed Clang from step #1, clang-format should already be on the path.

Verify:

    clang-format --version

You can use it from the command line or configure it in VSCode via .clang-format files.  
You can use it in vim adding shortcut keys that load `<clang install dir>\share\clang\clang-format.py`.  
By default, you get LLVM coding style, but you can override with a `.clang-format` file placed at the root of your code directory.

## 11. Download Sysinternals Suite

Download the full suite from Microsoft:

    https://learn.microsoft.com/en-us/sysinternals/downloads/sysinternals-suite

Extract to any folder and optionally add that folder to your PATH.

Commonly used tools include:
- **procexp.exe** – An advanced version of Task Manager showing process trees and DLLs
- **procmon.exe** – Logs real-time file system, registry, and process/thread activity
- **tcpview.exe** – Lists all active TCP/UDP endpoints and their associated processes
- **autoruns.exe** – Displays all programs configured to run at startup (more comprehensive than Task Manager)
- **psexec.exe** – Run processes on remote systems or elevate locally without launching a new session

These tools are portable and extremely useful for debugging, monitoring, and diagnostics on Windows systems.

## 12. Optional: PowerShell Profile Customization

You can customize your PowerShell environment by editing your profile:

    notepad $PROFILE

Add useful paths, aliases, or other tweaks. Example:

    $env:Path += ";C:\Tools\llvm-20.1.3\bin;C:\Tools\ctags;C:\Tools\cscope"  
    Set-Alias vim "C:\Program Files (x86)\Vim\vim90\vim.exe"

If you have Git installed, you can also enable posh-git:

    Install-Module posh-git -Scope CurrentUser  
    Import-Module posh-git

## 13. Install SQL Server Express (Free Edition)

Download the installer for Microsoft SQL Server Express from:

    https://www.microsoft.com/en-us/sql-server/sql-server-downloads

Under "SQL Server 2022 Express", click **Download now**.

Run the installer and choose the **Basic** installation type for the simplest setup.

After installation:

- Launch **SQL Server Management Studio (SSMS)** to interact with the database.
- If SSMS is not included, download it separately from:

    https://aka.ms/ssmsfullsetup

## 14. Install Wireshark

Wireshark is a powerful tool for capturing and analyzing network traffic.

Download the latest version from:

    https://www.wireshark.org/download.html

During installation:
- Choose whether to install WinPcap or Npcap (Npcap is recommended and included)
- You can skip installing USBPcap unless you plan to debug USB traffic

Verify installation:

    wireshark --version

To capture packets, run Wireshark as Administrator or enable permissions for your user to capture traffic.


## 15. Microcontroller Tools: STM32CubeIDE and STM32CubeMX

STMicroelectronics provides integrated tools for STM32 development. See my YouTube Channel for examples.

### STM32CubeIDE:
All-in-one development environment with editor, debugger, and project management.

Download from:

    https://www.st.com/en/development-tools/stm32cubeide.html

CubeIDE includes most of what you need: code editor, debugger, STM32CubeMX (graphical config), and support for firmware packages.

🛈 As you begin working with STM32 projects, the IDE will prompt you to install additional components such as:
- STM32CubeMX (if not already included)
- ST-Link USB drivers
- Target-specific firmware packs

So you don’t need to install everything up front — the IDE will guide you through what’s needed as you go.

### STM32CubeMX (Optional standalone installer):
If you want to use CubeMX separately for peripheral/clock configuration:

    https://www.st.com/en/development-tools/stm32cubemx.html

