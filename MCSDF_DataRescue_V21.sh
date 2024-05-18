#!/bin/bash
#
#########################################################################################################################
#                                                                                                                       #
# MCSDF DataRescue V.11: File Recovery Script                                                                           #
# Alexandro H. Bauer  2024                                                                                              #
#                                                                                                                       #
# This script is part of the Master in Cybersecurity and Digital Forensics (MCSDF) Applied Research Project at Auckland #
# University of Technology (AUT), under the supervision of Dr. Alastair Nisbet                                          #
#                                                                                                                       #
#########################################################################################################################



# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
RESET='\033[0m'
BOLD='\033[1m'

declare -A SumCount
declare -A signatures
declare -A JPGCount

set -e  # script exit immediately if found an error.


#########################################################################################################################

# Function to create directories based on categorization

create_directory() {
  local category=$1
  local path="$destination/$category"
  mkdir -p "$path"
  echo "$path"
}


##########################################################################################################################

# Function to check and remove empty directories, it's important when false positive happen, and the destination folder is overwhelmed with empty folders!

remove_empty_directory() {
  local dir=$1
  # Check if directory is empty
  if [ -d "$dir" ] && [ -z "$(ls -A "$dir")" ]; then
    echo "Removing empty directory: $dir"
    rmdir "$dir"
  fi
}

##########################################################################################################################

# Function to display results on screen

display() {
   printf "jpg = ${SumCount[JPG]} jpeg = ${SumCount[JPEG]} bmp = ${SumCount[BMP]} png = ${SumCount[PNG]} gif = ${SumCount[GIF]} pdf = ${SumCount[PDF]} ZIP = ${SumCount[ZIP]} DOCX = ${SumCount[DOCX]} PPTX = ${SumCount[PPTX]} MOV = ${SumCount[MOV]} custom = ${SumCount[CUSTOM]}\n\n"
}



##############################################################################################################################

# Function to check for PDF passwords and run pdfcrack if needed - *Dr Alastair to run this function be aware to install pdfcrack and pdfinfo to get information from the PDF file(s)

	check_pdf_password() {
	  local pdf_file=$1
	  local pdf_name=$(basename "$pdf_file")
	  #echo "Checking file: $pdf_file"
	  if pdfinfo "$pdf_file" 2>&1 | grep -q -e "Incorrect password"; then
	    echo "PDF file $pdf_name is encrypted, attempting to crack the password..."
	    pdfcrack -f "$pdf_file" -n 4 -m 4 -c '1234567890abcdefghijklmnopqwrstyxz' -o > "${pdf_file}_password.txt" | while IFS= read -r line; do
	      echo "$line"
	    done
	    if [ -f "${pdf_file}_password.txt" ]; then
	      password=$(grep -i 'user-password:' "${pdf_file}_password.txt" | awk -F 'user-password: ' '{print $2}')
	      echo -e "Password found for the file ${pdf_name}: ${RED}${BOLD}'shhh'${RESET}"
	    else
	      echo "Failed to crack the password for $pdf_name"
	    fi
	  else
	    echo "PDF file $pdf_name is not encrypted."
	  fi
	}

###########################################################################################################################################

# Function to identify signatures
identify_signatures() {
  local filetype=$1
  local start_sig="${start_signatures[$filetype]}"
  local end_sig="${end_signatures[$filetype]}"
  
  if [[ -n "$start_sig" && -n "$end_sig" ]]; then
    echo "Header for $filetype: $start_sig"
    echo "Footer for $filetype: $end_sig"
  else
    echo "No predefined signatures for $filetype."
  fi
}

#############################################################################################################################################

# Main script logic
# Ask user for name and path of target .dd file
clear 
echo '##################################################################################################'
echo '##################################################################################################'
echo ' '
echo -e "${YELLOW}${BOLD}MCSDF DataRescue: File Recovery Script${RESET}"
echo ' '
echo '##################################################################################################'
echo ' '
echo ' '

# Prompt user for the file path repeatedly until a valid file is entered
while true; do
    echo -e "${CYAN}${BOLD}Please enter the image.dd path and the file name: ${RESET}"
    read filename

    # Check if the file exists
    if [ -f "$filename" ]; then
        printf "The file name exists \n"
        echo ' '
        echo ' '
        break  # Exit the loop if the file exists
    else
        echo -e "${RED}That file does not exist. Please try again.${RESET}"
        echo ' '
        echo ' '
    fi
done

###############################################################################################################################################

# Prompt user for destination folder

while true; do
    echo -e "${CYAN}${BOLD}Please enter the destination path for recovered files: ${RESET}"
    read destination

    # Check if the input is empty
    if [[ -z "$destination" ]]; then
        echo "The destination path cannot be empty. Please enter a valid path."
    # Check if the directory exists
    elif [[ ! -d "$destination" ]]; then
        echo "The directory does not exist. Creating it now..."
        mkdir -p "$destination"
        echo "Directory created successfully."
        break  # Exit the loop since the directory has been created
    else
        echo "Directory exists."
        # Optionally check if the directory is empty or not
        if [ "$(ls -A "$destination")" ]; then
            echo "Warning: The directory is not empty!"
            # Prompt to continue or not
            echo "Do you want to continue using this directory? (y/n)"
            read response
            if [[ "$response" != "y" ]]; then
                echo "Operation canceled. Please provide a different directory."
                continue  # Ask for the directory again
            fi
        fi
        break  # Exit the loop since the directory is valid and the user chose to continue
    fi
done


###########################################################################################################################################


# Prompt user for categorisation (Still under construction................)

while true; do
    echo -e "${RED}${BOLD}UNDERCONSTRUCTION!  ${CYAN}${BOLD}Do you want to categorize files by type or date, or not categorize at all? (Enter 'type', 'date', or 'no'): ${RESET}"
    read categorization

    # Convert input to lowercase to simplify comparison
    categorization=${categorization,,}  # This syntax converts the string to lowercase in Bash

    # Check if categorization is 'type', 'date', or 'no'
    if [[ "$categorization" == "type" || "$categorization" == "date" ]]; then
        echo -e "${GREEN}Files will be categorized by $categorization.${RESET}"
        break  # Valid input, exit loop
    elif [[ "$categorization" == "no" || "$categorization" == "no" ]]; then
        echo -e "${GREEN}Files will not be categorized.${RESET}"
        break  # Exit loop as user chose not to categorize
    else
        echo -e "${RED}Invalid option. Please enter 'type', 'date', or 'no'.${RESET}"
    fi
done

################################################################################################################################################

# Function to create directories based on categorization
create_directory() {
  local category=$1
  local path="$destination/$category"
  mkdir -p "$path"
  echo "$path"
}

###############################################################################################################################################

# Define file signatures for recovery (headers and footers)
declare -A start_signatures=(
    
    [JPG]="\xFF\xD8\xFF\xE0"
    [JPEG]="\xFF\xD8\xFF\xE1"
    [BMP]="\x42\x4D"
    [PNG]="\x89\x50\x4E\x47"
    [GIF]="\x47\x49\x46\x38" 
    [PDF]="\x25\x50\x44\x46"
    [ZIP]="\x50\x4B\x03\x04"
    [DOCX]="\x50\x4B\x03\x04"
    [PPTX]="\x50\x4B\x03\x04"
    [MOV]="\x00\x00\x00\x14\x66\x74\x79\x70"
  
)
declare -A end_signatures=(
    [JPG]="\xFF\xD9"
    [JPEG]="\xFF\xD9"
    [BMP]=" "
    [PNG]="\x49\x45\x4E\x44"
    [GIF]="\x00\x3B"
    [PDF]="\x25\x45\x4F\x46"
    [ZIP]="\x50\x4B\x05\x06"
    [DOCX]="\x50\x4B\x05\x06"
    [PPTX]="\x50\x4B\x05\x06"
    [MOV]="\x6D\x6F\x6F\x76"
 )

############################################################################################################################################

clear 

UserRequest=()
PS3="Please select which file types to search for (or select QUIT to exit): "
select opt in JPG JPEG BMP PNG GIF PDF ZIP DOCX PPTX MOV ALL CUSTOM QUIT; do
  case $opt in
    JPG|JPEG|BMP|PNG|GIF|PDF|ZIP|DOCX|PPTX|MOV)
      echo "Searching for $opt files"
      UserRequest+=("$opt")
      identify_signatures "$opt"
      break
      ;;
    ALL)
      echo "Searching for all supported file types..."
      UserRequest=("JPG" "JPEG" "BMP" "PNG" "GIF" "PDF" "ZIP" "DOCX" "PPTX" "MOV" )
      for type in "${UserRequest[@]}"; do
        identify_signatures "$type"
      done
      break
      ;;
    CUSTOM)
      echo "Please enter the custom start signature of 4 hexadecimal pairs (e.g., 25504446 for PDF): "
      read startsigcust
      echo "Please enter the custom end signature of 4 hexadecimal pairs (e.g., 0A454F46 for PDF): "
      read endsigcust
      UserRequest+=("CUSTOM")
      signatures[CUSTOM]="$startsigcust:$endsigcust"
      echo "Custom signatures set: Start - $startsigcust, End - $endsigcust"
      break
      ;;
    QUIT)
      echo "Exiting..."
      exit 0
      ;;
    *)
      echo "Invalid option $opt"
      ;;
  esac
done

# Handle the case where no valid option was chosen
if [ ${#UserRequest[@]} -eq 0 ]; then
  echo "No file types selected. Exiting..."
  exit 1
fi

# Display the selected options
echo "You have selected the following file types to search for:"
for req in "${UserRequest[@]}"; do
  echo "- $req"
done

sleep 5

# Display custom signatures if any
if [ -n "${signatures[CUSTOM]}" ]; then
  echo "Custom signatures:"
  echo "Start: ${signatures[CUSTOM]%:*}"
  echo "End: ${signatures[CUSTOM]#*:}"
fi

###########################################################################################################################################

clear
echo "Recovery process started, please wait..."

# Determine the current date to label files
recovery_date=$(date +%Y-%m-%d)

for req in "${UserRequest[@]}"; do
    start_sig="${start_signatures[$req]}"
    end_sig="${end_signatures[$req]}"

    # Define path for recovered files based on user choice
    if [ "$categorization" == "type" ]; then
        directory_path=$(create_directory "$req")
    elif [ "$categorization" == "date" ]; then
        directory_path=$(create_directory "$recovery_date")
    else
        directory_path=$(create_directory) #"Uncategorized"
    fi
done  

##########################################################################################################################################

mkdir -p "$destination"

echo "Files recovered from ${filename%.*} on $(date)" > "$destination/Audit_Report.txt"

declare -A SumCount=([JPG]=0 [JPEG]=0 [BMP]=0 [PNG]=0 [GIF]=0 [PDF]=0 [ZIP]=0 [DOCX]=0 [PPTX]=0 [MOV]=0 [CUSTOM]=0)
SumLog=()


#########################################################################################################################################

for req in "${UserRequest[@]}"; do
  category_path=$(create_directory "$req")
  start_sig="${start_signatures[$req]}"
  end_sig="${end_signatures[$req]}"

  # Ensure that the signatures are not empty
  if [[ -z "$start_sig" || -z "$end_sig" ]]; then
    echo "Error: Signature for $req is missing. Skipping..."
    continue
  fi

  readarray -t arrayStartLocation < <(LC_ALL=C grep -obUaPe "$start_sig" "$filename" | awk -F: '{print $1}')
  readarray -t arrayEndLocation < <(LC_ALL=C grep -obUaPe "$end_sig" "$filename" | awk -F: '{print $1}')

  lenStartSignKeyword=$(( $(echo -n "$start_sig" | tr -d '\\x' | wc -c) / 2 ))
  lenEndSignKeyword=$(( $(echo -n "$end_sig" | tr -d '\\x' | wc -c) / 2 ))

  lenarray=${#arrayStartLocation[@]}
  echo "Processing $req files: Found $lenarray start signatures"

  for ((i = 0; i < lenarray; i++)); do
    FileStartLocation=${arrayStartLocation[$i]}
    j=$i
    while [ $j -lt ${#arrayEndLocation[@]} ] && [ ${arrayEndLocation[$j]} -le $FileStartLocation ]; do
      j=$((j + 1))
    done

    if [ $j -lt ${#arrayEndLocation[@]} ]; then
      FileEndLocation=$((${arrayEndLocation[$j]} + lenEndSignKeyword))
      count=$((FileEndLocation - FileStartLocation))
      if [ $count -gt 0 ]; then
        FileSectorLocation=$((FileStartLocation / 512))
        RecoveredFilePath="${category_path}/${req}_${recovery_date}_${FileSectorLocation}.${req}"
        dd if="$filename" of="$RecoveredFilePath" bs=1 skip=$FileStartLocation count=$count conv=notrunc >&/dev/null
        if [ $? -eq 0 ]; then
          SumLog+=("$(printf "%3s\t%3s\t%3s\t" "$RecoveredFilePath" "$FileStartLocation" "$count")")
          SumCount[$req]=$((SumCount[$req] + 1))
        fi
      fi
    fi
  done
  remove_empty_directory "$category_path"
done


###############################################################################################################################################

# Print the results to the audit file  ZIP]=0 [DOCX]=0 [PPTX]=0 [MOV]=0 ETC
{
    printf "jpg = ${SumCount[JPG]} bmp = ${SumCount[BMP]} png = ${SumCount[PNG]} gif = ${SumCount[GIF]} pdf = ${SumCount[PDF]} ZIP = ${SumCount[ZIP]} DOCX = ${SumCount[DOCX]} PPTX = ${SumCount[PPTX]} MOV = ${SumCount[MOV]}custom = ${SumCount[CUSTOM]}\n\n"
    
    printf "jpg = ${SumCount[JPG]} bmp = ${SumCount[BMP]} png = ${SumCount[PNG]} gif = ${SumCount[GIF]} pdf = ${SumCount[PDF]} ZIP = ${SumCount[ZIP]} DOCX = ${SumCount[DOCX]} PPTX = ${SumCount[PPTX]} MOV = ${SumCount[MOV]} custom = ${SumCount[CUSTOM]}\n\n"

    printf "File name (start sector):\t\t\tFile offset:\t\t\tFile size in bytes:\n" >> $destination/Audit.txt
    
    echo "----------------------------------------------------------------------------------------------" >> $destination/Audit.txt
    
    for log in "${SumLog[@]}"; do
        printf "%3s\t\t\t\t\t%3s\t\t\t\t\t%3s\n" $log >> $destination/Audit.txt
    done
    
} >> "$destination/Audit.txt"


###########################################################################################################################################


# Define the directory to search for PDF files
directory="$destination/PDF"

# Check if the directory is empty

if [ -z "$(ls -A "$directory" 2>/dev/null)" ]; then
    display
    exit 0
fi

# Initialize an array to hold the names of the PDF files
pdf_files=()


# Loop through the directory, adding PDF file names to the array
while IFS= read -r -d $'\0' file; do
    pdf_files+=("$file")
done < <(find "$directory" -type f -iname "*.pdf" -print0)


# Display all PDF file names stored in the array
echo "PDF files found:"
for pdf in "${pdf_files[@]}"; do
    echo "$pdf"
done


# Check for PDF passwords after the files are recovered
echo "Starting to check PDF files for passwords..."
for pdf_file in "${pdf_files[@]}"; do
  echo "Processing file: $pdf_file"
  if [ -f "$pdf_file" ]; then
    check_pdf_password "$pdf_file"
  else
    echo "$pdf_file does not exist."
  fi
done

display

#MCSDF1_Flashdrive_deleted_files.dd
