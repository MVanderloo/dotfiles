#!/usr/bin/env bash

echo "Warning: This will remove all applications currently on your dock."
read -p "Do you want to proceed? (y/n): " choice

case "$choice" in
    y|Y )
        echo "Proceeding..."
        ;;
    n|N )
        echo "Exiting."
        exit 0
        ;;
    * )
        echo "Invalid input. Please enter 'y' or 'n'."
        exit 1
        ;;
esac

defaults delete com.apple.dock persistent-apps
killall Dock
