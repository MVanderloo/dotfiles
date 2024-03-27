import readline
import sys

# tab completion
readline.parse_and_bind('tab: complete')

# prompt
sys.ps1 = "> "
sys.ps2 = "| "

