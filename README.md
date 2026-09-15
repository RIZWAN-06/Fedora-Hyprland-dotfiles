

# My Fedora Hyprland Dotfiles

My personal Linux desktop setup. Tested on *Fedora 44* with Hyprland, Ambxst (Quickshell), Neovim, and Kitty.

## Screenshots

(To be added here)

## 📦 What's Included 

| Folder | Contents |
|--------|----------|
| `config/hypr/` | Hyprland config (keybinds, NVIDIA setup, window rules) |
| `config/kitty/` | Kitty terminal (fonts, colors, blur) |
| `config/nvim/` | Neovim / LazyVim (Python LSP, Catppuccin, transparency) |
| `ambxst/` | Ambxst config + Catppuccin Mocha palette |
| `ambxst-overrides/` | Custom QML files for the Dynamic Island look |
| `.zshrc + .p10k.zsh` | Zsh shell + Powerlevel10k prompt |

# 🚀 Fresh Install (Fedora 44)

## 1. Install core packages

Run this to install the core software needed for these configs:

```bash
sudo dnf install hyprland kitty neovim git curl zsh hypridle hyprlock brightnessctl playerctl pavucontrol network-manager-applet blueman swaync nwg-look fontawesome-fonts kf6-syntax-highlighting hyprshot grim slurp wl-clipboard
```

## 2.Install Ambxst (Quickshell-based Dynamic Island)

```bash
curl -L get.axeni.de/ambxst | bash
```

## 3. clone this Repo. 

```bash
git clone git@github.com:RIZWAN-06/Fedora-Hyprland-dotfiles.git ~/.dotfiles
```

## 4. Restore the configs

### Core configs

```bash
cp -r ~/.dotfiles/config/hypr ~/.config/
cp -r ~/.dotfiles/config/kitty ~/.config/
cp -r ~/.dotfiles/config/nvim ~/.config/
```

### Ambxst config + palette

```bash
mkdir -p ~/.config/ambxst
cp -r ~/.dotfiles/ambxst/config ~/.config/ambxst/
cp -r ~/.dotfiles/ambxst/palette ~/.config/ambxst/
```

### Shell files

```bash
cp ~/.dotfiles/.zshrc ~/
cp ~/.dotfiles/.p10k.zsh ~/
```

### 5. Apply custom Ambxst QML overrides

Ambxst's bar layout lives in its source folder. To restore the custom look (battery-only right side, no calendar/weather/pomodoro popup):

```bash
cp ~/.dotfiles/ambxst-overrides/BarContent.qml ~/.local/src/ambxst/modules/bar/
cp ~/.dotfiles/ambxst-overrides/Clock.qml ~/.local/src/ambxst/modules/bar/clock/
cp ~/.dotfiles/ambxst-overrides/WidgetsTab.qml ~/.local/src/ambxst/modules/widgets/dashboard/widgets/
```

## 6. Reboot

Select *Hyprland (uwsm-managed)* on the login screen.


## 🔑 Key Bindings

| Key | Action |
|--------|----------|
| `Super + Q` | Terminal (Kitty) |
| `Super + E` | File manager (Nautilus) |
| `Super + R` | App launcher (Ambxst) |
| `Super + Esc` | Power menu (Ambxst) |
| `Super + X` | Lock-Screen |
| `Super + M` | Log-Out |
| `Super + C` | Close window |
| `Super + V` | Toggle flothing |
| `Super + K/L` | Move focus (Vim Keys) |
| `Super + 1-10` | Switch workspaces |
| `Super + Shift + 1-10` | Move window to workspaces |
| `Super + S` | Toggle spacial window |
| `Super + Shift + S` | Move window to spacial window |
| `Super + Alt + S` | Screenshots region |
| `Super + Alt + A` | Screenshots full screen |
| `Super + Alt + W` | Screenshots active window |


## ⚠️ Known Quirks

### Ambxst overrides Hyprland decorations on login

Ambxst's `axctl` daemon forcibly applies its own `rounding`, `gaps_in`, and `gaps_out` every login, overriding `hyprland.lua` Either:

◉ *Accept Ambxst's values* (rounding=16, gaps_in=2, gaps_out=4) and update `hyprland.lua` to match

◉ *Or use a watchdog script* that re-applies your values every 10 seconds


## NVIDIA hybrid graphics

### This config assumes Intel + NVIDIA hybrid GPU:

◉ `AQ_DRM_DEVICES=/dev/dri/card1` - forces Intel for the desktop

◉ `__NV_PRIME_RENDER_OFFLOAD=0` — keeps NVIDIA asleep for battery life

◉ `nvidia-drm.modeset=1` kernel parameter - required for Wayland

To use NVIDIA for gaming or CUDA, set
`__NV_PRIME_RENDER_OFFLOAD=1` in `hyprland.lua`


## 🎨 Theming

◉ *Palette:* Catppuccin Mocha (mauve accent)

◉ *Terminal:* Kitty (transparent, blurred)

◉ *Editor:* Neovim (transparent, Catppuccin)

◉ *GTK apps:* Catppuccin Mocha Mauve

◉ *Shell:* Ambxst with Catppuccin theme


## 📜 Notes 

◉ *Wallpapers go in* `~/Wallpapers/`

◉ *Screenshots save to* `~/Pictures/Screenshots/`

◉ *All keybindings are in* `config/hypr/hyprland.lua`
