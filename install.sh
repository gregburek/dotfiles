#!/bin/sh

cutstring="DO NOT EDIT BELOW THIS LINE"

#
# Processes a single file or directory.
#
# This function checks if a corresponding dotfile exists in the home directory.
# - If it's a regular file with a cutstring, it updates it.
# - If it's a symlink, it does nothing.
# - If it doesn't exist, it creates a new symlink or copies the file.
#
# @param {string} name The name of the file or directory to process.
#
process_item() {
  local name="$1"
  local target="$HOME/.$name"

  if [ -e "$target" ]; then
    # Target exists, check if it's a symlink
    if [ ! -L "$target" ]; then
      # It's not a symlink, check for the cutstring to see if we can update it
      local cutline
      cutline=$(grep -n -m1 "$cutstring" "$target" | sed "s/:.*//")

      if [ -n "$cutline" ]; then
        cutline=$((cutline - 1))
        echo "Updating $target"
        # Preserve the content above the cutstring in the target file
        head -n "$cutline" "$target" >update_tmp

        # Find the start of the new content from the source file
        local startline
        startline=$(sed '1!G;h;$!d' "$name" | grep -n -m1 "$cutstring" | sed "s/:.*//")

        if [ -n "$startline" ]; then
          tail -n +"$startline" "$name" >>update_tmp
        else
          cat "$name" >>update_tmp
        fi
        mv update_tmp "$target"
      else
        echo "WARNING: $target exists but is not a symlink and cannot be updated. Skipping."
      fi
    fi
  else
    # Target does not exist, so create it
    echo "Creating $target"
    if [ -n "$(grep "$cutstring" "$name")" ]; then
      # If the source file has the cutstring, copy it instead of symlinking
      cp "$PWD/$name" "$target"
    else
      # Otherwise, create a symlink
      ln -s "$PWD/$name" "$target"
    fi
  fi
}

echo "Starting to process files..."

for name in config/*; do
  # Skip the install script itself and the config directory
  if [ "$name" = 'install.sh' ] || [ "$name" = 'config' ]; then
    continue
  fi

  # Call the function to process the current item
  process_item "$name"
done

for name in *; do
  # Skip the install script itself and the config directory
  if [ "$name" = 'install.sh' ] || [ "$name" = 'config' ]; then
    continue
  fi

  # Call the function to process the current item
  process_item "$name"
done

echo "Processing complete."
