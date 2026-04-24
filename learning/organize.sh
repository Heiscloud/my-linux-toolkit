#!/bin/bash

# source directory
SOURCE_DIR="$HOME/Downloads"

# change to the source directory
cd "$SOURCE_DIR" || exit

#create function to move files 
move_files() {
	local ext=$1
	local folder_name=$2

# destination path
	local destination="$HOME/$folder_name"

# check if any folder_names with the extension exists
	if ls *.$ext >/dev/null 2>&1; then
		mkdir -p "$destination"
# Move files from current location (Downloads) to the Home sub-folder
		mv *.$ext "$destination/" 2>/dev/null
		echo "Moved *.$ext files to $destination/"
	fi
}

# Mapping extensions to folder_names
# Format: move_files "extension" "Destination_folder_name"

# Documents
move_files "pdf" "Documents"
move_files "docx" "Documents"
move_files "txt" "Documents"
move_files "epub" "Documents"

# Media
move_files "jpg" "Pictures"
move_files "jpeg" "Pictures"
move_files "png" "Pictures"
move_files "mp4" "Videos"
move_files "mkv" "Videos"
move_files "mp3" "Music"

# Archives & Installers
move_files "zip" "Archives"
move_files "tar.gz" "Archives"
move_files "rpm" "Packages"
move_files "iso" "ISO_Images"

#scripts
move_files "sh" "scripts"

echo "Cleanup complete."
