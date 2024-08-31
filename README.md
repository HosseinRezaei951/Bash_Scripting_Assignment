# Bash Scripting Assignment

## Project Overview

The **Bash Scripting Assignment** demonstrates the use of Bash scripting to automate tasks related to file manipulation, text processing, and web crawling. The project includes four distinct tasks, each implemented in separate scripts, focusing on arithmetic operations, character counting in text files, string searching in files, and web crawling for news extraction.

## Directory Structure

- **q1/**: Contains the script for arithmetic operations.
  - `calculator.sh`
  
- **q2/**: Contains the script for counting characters in each line of a text file.
  - `add-character-count.sh`
  - `T202.txt`: Output file where the results are saved.
  - `test.txt`: Example input file.

- **q3/**: Contains the script for searching a string in files.
  - `beaSearch.sh`
  - `001.txt`, `002.txt`, `003.txt`, `004.txt`: Example files used for searching.
  - `out-search.txt`: Output file where the search results are saved.

- **q4/**: Contains the script for web crawling and the results of the crawl.
  - `crawler.sh`
  - **CrawlerResults/**: Directory containing the crawled news articles.
    - `2020-Dec-10/`: Directory for news articles crawled on December 10, 2020.
      - `01.txt` to `20.txt`: Files containing the titles and content of the crawled news articles.

## Tasks

### 1. Arithmetic Calculator (`q1/calculator.sh`)

This script performs basic arithmetic operations (addition, subtraction, multiplication, division, exponentiation, and modulus) on two numbers provided by the user.

- **Usage**: 
  ```bash
  bash q1/calculator.sh num1 num2 operator
  ```

- **Supported Operations**:
  - Addition: `+`
  - Subtraction: `-`
  - Multiplication: `x` (lowercase 'x')
  - Division: `/`
  - Exponentiation: `^`
  - Modulus: `%`

- **Example**:
  ```bash
  bash q1/calculator.sh 5 3 +
  # Output: Result: 8
  ```

### 2. Add Character Count to Lines (`q2/add-character-count.sh`)

This script reads a text file, calculates the number of characters in each line (excluding spaces), and prepends the character count to the beginning of each line. The output is saved to a new file `T202.txt`.

- **Usage**:
  ```bash
  bash q2/add-character-count.sh q2/test.txt
  ```

- **Example**:
  ```bash
  bash q2/add-character-count.sh q2/test.txt
  # The output will be saved in q2/T202.txt with each line prepended by its character count.
  ```

### 3. Search for a String in Files (`q3/beaSearch.sh`)

This script searches for a specific string within a set of text files located in a specified directory. It extracts the lines containing the search string along with the file name, file path, modification date, and the line of text. The results are saved to `out-search.txt` in a formatted table.

- **Usage**:
  ```bash
  bash q3/beaSearch.sh <search_string> <path>
  ```

- **Output Format**:
  ```
  Name           | Path                                    | Date                   | Text line
  -----------------------------------------------------------------------------------------
  001.txt        | /path/to/directory                      | 2020 Nov 28 22:17      | <line containing search string>
  -----------------------------------------------------------------------------------------
  002.txt        | /path/to/directory                      | 2020 May 12 11:00      | <line containing search string>
  ```

- **Example**:
  ```bash
  bash q3/beaSearch.sh "COVID-19" q3/
  # The output will be saved in q3/out-search.txt with the formatted table of search results.
  ```

### 4. Web Crawler for News Extraction (`q4/crawler.sh`)

This script crawls two websites (one Iranian and one international) to collect the latest 10 news articles from each site. The news articles are saved in separate text files within a directory named with the current date. The script is designed to run automatically at a specified time each day using cron jobs.

- **Usage**:
  ```bash
  bash q4/crawler.sh
  ```

- **Output**:
  The script creates a directory under `CrawlerResults` named with the current date (e.g., `2020-Dec-10`) and saves the news articles in files named `01.txt` to `20.txt`. Each file contains the news title on the first line, an empty line, and then the news content.

- **Example**:
  ```
  CrawlerResults/
    ├── 2020-Dec-10/
    │   ├── 01.txt
    │   ├── 02.txt
    │   ├── ...
    │   └── 20.txt
  ```

- **Automating with Cron**:
  To automate the script to run daily at a specific time (e.g., 8:00 AM), add a cron job:
  ```bash
  crontab -e
  ```
  Add the following line to the crontab file:
  ```bash
  00 08 * * * /path/to/q4/crawler.sh
  ```

## How to Run the Scripts

1. **Set the Execute Permissions**:
   Ensure that the scripts have execute permissions. Run the following command for each script:
   ```bash
   chmod +x q1/calculator.sh
   chmod +x q2/add-character-count.sh
   chmod +x q3/beaSearch.sh
   chmod +x q4/crawler.sh
   ```

2. **Run the Scripts**:
   Use the `bash` command followed by the script name and necessary arguments to run each script as described in the sections above.

3. **Automate with Cron (For Crawler Script)**:
   Follow the instructions provided in the Web Crawler section to automate the `crawler.sh` script using cron jobs.

## Conclusion

This project demonstrates the power and versatility of Bash scripting in automating common tasks such as arithmetic operations, text file processing, string searching, and web crawling. The scripts are designed to be modular and reusable, providing a solid foundation for more complex automation tasks in Unix-based systems.
