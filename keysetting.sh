#!/bin/bash

# ファイルのパスを設定
XMODMAP_FILE="$HOME/.Xmodmap"
AUTOSTART_DIR="$HOME/.config/autostart"
AUTOSTART_FILE="$AUTOSTART_DIR/xmodmap.desktop"

# .Xmodmapファイルの作成
echo "Creating .Xmodmap file..."
echo "clear Lock" > "$XMODMAP_FILE"
echo "keycode 66 = Eisu_toggle" >> "$XMODMAP_FILE"

# 自動起動ディレクトリがない場合は作成
mkdir -p "$AUTOSTART_DIR"

# .desktopファイルの作成
echo "Creating autostart entry..."
cat > "$AUTOSTART_FILE" << EOF
[Desktop Entry]
Type=Application
Name=Xmodmap
Exec=xmodmap $XMODMAP_FILE
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
EOF

# 現在のセッションに設定を適用
echo "Applying settings to current session..."
xmodmap "$XMODMAP_FILE"

echo "Setup completed successfully!"
echo "Please restart your computer for the changes to take full effect."
