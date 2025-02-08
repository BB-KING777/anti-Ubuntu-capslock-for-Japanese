#!/bin/bash

# ファイルのパスを設定
XMODMAP_FILE="$HOME/.Xmodmap"
XPROFILE_FILE="$HOME/.xprofile"

# .Xmodmapファイルの作成
echo "Creating .Xmodmap file..."
echo "clear Lock" > "$XMODMAP_FILE"
echo "keycode 66 = Eisu_toggle" >> "$XMODMAP_FILE"

# .xprofileファイルの作成
echo "Creating .xprofile file..."
echo '[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap' > "$XPROFILE_FILE"

# .xprofileに実行権限を付与
chmod +x "$XPROFILE_FILE"

# 現在のセッションに設定を適用
echo "Applying settings to current session..."
xmodmap "$XMODMAP_FILE"

echo "Setup completed successfully!"
echo "Please log out and log back in for the changes to take full effect."