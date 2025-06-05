# Bash Script Assignment 1

This repository contains two Bash scripts written as part of a scripting assignment:

1. **check_file.sh** – Checks if a file exists.
2. **count_files.sh** – Counts how many files are in a specified directory.

---

## Script 1: Check if File Exists

**Filename:** `check_file.sh`  
**Purpose:** Takes a filename as an argument and checks whether that file exists on the system.

### Usage
```bash
./check_file.sh <filename>
```

### Example
```bash
./check_file.sh myfile.txt
```

### Output
- If the file exists:
  ```
  File 'myfile.txt' exists.
  ```
- If the file does not exist:
  ```
  File 'myfile.txt' does not exist.
  ```

---

## Script 2: Count Files in Directory

**Filename:** `count_files.sh`  
**Purpose:** Takes the absolute path to a directory and counts the number of regular files (not folders) inside it.

### Usage
```bash
./count_files.sh <absolute_directory_path>
```

### Example
```bash
./count_files.sh /home/user/Documents
```

### Output
- If the directory is valid:
  ```
  There are 12 files in directory '/home/user/Documents'.
  ```
- If the directory is invalid:
  ```
  '/home/user/Documents' is not a valid directory.
  ```

---


