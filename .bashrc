clear

cls(){
  clear
}
linux(){
  proot-distro login ubuntu
}
eruda(){
  cd
  cd Termux-Tools/eruda/ && python2 -m SimpleHTTPServer 8010
}
htdocs(){
cd /sdcard/htdocs
cls
ls
}
acode(){
    #cd /data/data/com.termux/files/home/Termux-Tools
    python termServer.py
}

python-server(){
python2 -m SimpleHTTPServer 8000
}


### For Running C And C++
run_code() {
    # Check if the filename is provided
    if [ -z "$1" ]; then
        echo ""
        echo "[-] Usage --> run_code filename.c or filename.cpp"
        echo ""
        return 1
    fi

    # Extract the filename without extension
    filename=$(basename "$1")
    extension="${filename##*.}"
    filename_no_ext="${filename%.*}"

    # Check if the file exists
    if [ ! -f "$1" ]; then
        echo ""
        echo "________________________________________"
        echo ""
        echo "[!] File Not Found --> $1"
        echo "________________________________________"
        echo ""
        return 1
    fi

    # Compile the C or C++ file
    if [ "$extension" == "c" ]; then
        clang "$1" -o "$filename_no_ext"
    elif [ "$extension" == "cpp" ]; then
        clang++ "$1" -o "$filename_no_ext"
    else
        echo ""
        echo "[-] Unsupported file type. Please provide a .c or .cpp file."
        return 1
    fi

    # Check if compilation was successful
    if [ $? -eq 0 ]; then
        echo ""
        echo "________________________________________"
        echo ""
        echo "[+] Compilation Successfully!"
        sleep 1
        echo ""
        echo "[+] Running Program..."
        # Run the compiled program
        echo ""
        ./"$filename_no_ext"
        echo "________________________________________"
        echo "----------------------------------------"
        echo ""
    else
        echo ""
        echo "________________________________________"
        echo ""
        echo "[!] Compilation Failed!"
        echo ""
        echo "________________________________________"
        echo ""
    fi
}









# =========================================================
# KALI-STYLE HACKER PROMPT (User, Dir, Git Branch)
# =========================================================

# Function to extract the current Git branch
parse_git_branch() {
    # If in a git directory, format it as ─[git:branch_name]
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/─[\1]/'
}

# Define bold colors
RED='\[\033[01;31m\]'
GREEN='\[\033[01;32m\]'
BLUE='\[\033[01;34m\]'
CYAN='\[\033[01;36m\]'
PURPLE='\[\033[01;35m\]'
RESET='\[\033[00m\]'

# Build the prompt
# Top line: ┌──(user)─[directory]─[git:branch]
# Bottom line: └─$


PS1="${BLUE}┌──(${RED}ghs${BLUE})─[${CYAN}\w${BLUE}]${GREEN}\$(parse_git_branch)\n${BLUE}|\n${BLUE}└──${RED}\$${RESET} "





