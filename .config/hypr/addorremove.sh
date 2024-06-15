#!/bin/bash

# script to zoom in and zoom out using hyprland misc
file_path="/home/duyhung/.config/hypr/hyprland.conf"
string_to_add_remove="misc {
  cursor_zoom_factor = 1.5
  cursor_zoom_rigid = true
}"

# Add the string to the file
add_string() {
  echo "$string_to_add_remove" >> "$file_path"
  echo "String added to $file_path"
}

# Remove the string from the file
remove_string() {
  if grep -qF "$string_to_add_remove" "$file_path"; then
    sed -i "/^misc {/,/^}/d" "$file_path"
    echo "String removed from $file_path"
  else
    echo "String not found in $file_path"
  fi
}

# Check if the file exists
if [ -f "$file_path" ]; then
  # Decide whether to add or remove the string based on arguments
  case "$1" in
    "add")
      add_string
      ;;
    "remove")
      remove_string
      ;;
    *)
      echo "Usage: $0 [add|remove]"
      ;;
  esac
else
  echo "File $file_path not found"
fi

