#!/bin/bash

# Array of offsets (start and end) pairs
offsets=(
    "528384 1476923392"
    "92231680 4370422015"
    "99733504 1559548030"
    "53452800 53452800"
    "2742272 1449056302"
    "75454464 4353644799"
    "27383808 1389485265"
    "8876032 4287066367"
    "33675264 1481366636"
    "106915840 106916095"
    "39966720 1521802267"
    "26695680 4304886015"
    "61462528 1525145712"
    "87914496 4366104831"
    "68278272 1501880358"
    "129761280 4407951615"
    "129474560 129474606"
    "74045440 1526194355"
    "55543808 4333734143"
    "79812608 1566564565"
    "41680896 4319871231"
    "41394176 41394284"
)

# Input file name (replace with the actual file name)
INPUT_FILE="/root/Desktop/MCSDF1_Flashdrive_Original.dd"

# Create the output directory if it doesn't exist
OUTPUT_DIR="/root/Desktop/Teste"
mkdir -p "$OUTPUT_DIR"

# Loop through each offset pair and process the file
for i in "${!offsets[@]}"; do
    # Split the offset pair into start and end
    IFS=' ' read -r START_DEC END_DEC <<< "${offsets[$i]}"
    
    # Calculate the length of the data to be extracted
    LENGTH_DEC=$((END_DEC - START_DEC))
    
    # Define the output file name
    OUTPUT_FILE="$OUTPUT_DIR/extracted_file_$i.bin"
    
    # Extract the portion of the file from start offset to end offset
    dd if="$INPUT_FILE" of="$OUTPUT_FILE" bs=1 skip=$START_DEC count=$LENGTH_DEC status=none
    
    # Check if the extraction was successful
    if [ -f "$OUTPUT_FILE" ]; then
        echo "File extracted successfully to $OUTPUT_FILE"

        # Extract and display metadata using exiftool
        exiftool "$OUTPUT_FILE" > "$OUTPUT_FILE.metadata.txt"
        
        echo "Metadata extraction complete for $OUTPUT_FILE"
    else
        echo "File extraction failed for offsets $START_DEC - $END_DEC."
    fi
done
