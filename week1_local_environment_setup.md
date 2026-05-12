# Local Environment Setup Guide

For this course, we are keeping the local setup as simple as possible. You only need **Python** gently installed alongside **Jupyter**. 

To make things easy, we have provided automated setup scripts that will install Python for you (if it's missing), create an isolated virtual environment, and install all the data tools you need.

---

## Prerequisites & Important Notes

Before running the setup on your personal computer, please note:
1. **Permissions:** You may be prompted for Administrator rights (User Account Control on Windows, or your password on Mac/Linux) if the script needs to install Python system-wide.
2. **Antivirus / SmartScreen:** Windows Defender or Mac Gatekeeper might warn you about running scripts downloaded from the internet. You will need to allow the script to run (e.g., clicking "More info" -> "Run anyway" on Windows).
3. **Network Restrictions:** Ensure you have a stable internet connection. If you are on a restrictive school or company VPN, it might block the package downloads (`pip`, `winget`, `brew`).
4. **Folder Location:** Save this course folder in a simple location (like `C:\Course` or `~/Documents/Course`) to prevent "file path too long" errors during installation.

---

## 1-Click Automated Setup

### For Windows Users
The easiest way is to simply locate the course folder in File Explorer and **double-click the `setup_windows.cmd` file**. 

*(This `.cmd` file automatically bypasses any strict Windows PowerShell execution policies so you don't get blocked!)*

Alternatively, from the standard Command Prompt or PowerShell:
```cmd
cd path\to\course\folder
.\setup_windows.cmd
```
*(Note: If Python is missing, the script will use Windows Package Manager (`winget`) to install it automatically. You may need to run the script one more time if a new installation occurs).*

### For Mac / Linux Users
1. Open your **Terminal** and navigate to the course folder:
   ```bash
   cd path/to/course/folder
   ```
2. Make the script executable and run it:
   ```bash
   chmod +x setup_mac_linux.sh
   ./setup_mac_linux.sh
   ```
   *(Note: On Mac, it will attempt to use Homebrew to install Python. On Linux, it will try to use `apt-get`.)*

---

## Launching Jupyter

Once the setup script finishes successfully, starting your environment is easy. Simply use the launcher script in the course folder!

* **Windows:** Double-click `launch_jupyter.cmd`.
* **Mac/Linux:** Open terminal and run:
  ```bash
  ./launch_jupyter.sh
  ```

*(Alternatively, from the terminal, just make sure you are in the main course folder and activate the environment manually: `.\venv\Scripts\Activate.ps1` followed by `jupyter lab`)*

Your browser will open automatically to `http://localhost:8888`. You are now ready to start coding!
