# Ensure cute is installed (exeCUTEs commands from Markdown files.)
CUTE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/cute"
if [ ! -d "$CUTE_DIR" ]; then
  git clone https://github.com/ras0q/cute "$CUTE_DIR"
fi
source "$CUTE_DIR/cute"
