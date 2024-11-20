## 📔 Game Description
![Image of Run2Me main menu](https://github.com/bibyru/bibyru/blob/main/Gifs/Run2Me.JPG)

**Run2Me** is a game where the player tries getting over their personal best time and score by surviving the longest! The visual might be cute and wholesome, but the platforming... See it for yourself!

Download game [here](https://github.com/bibyru/Run2Me_gd/releases/).

<br/>

## 🎮 Game Controls
This game uses Mouse and Keyboard inputs.

| **Action** | **Keyboard** |
| :- | :- |
| Move | A, D |
| Jump | W, Space |
| Shoot | J, LMB, Ctrl, Shift |
| Pause | Escape |

<br/>

## 📝 Project Info
This project was developed using Godot v4.2.2.
| **Role** | **Credit** | **Development Time** |
| :- | :- | :- |
| Game programmer | bibyru (Ruby) | 1 days |
| Project lead | bibyru (Ruby) | 1 days |
| Visual designer | bibyru (Ruby) | 1 day |
| Game designer | bibyru (Ruby) | 1 day |

<br/>

## ⭐ Scripts and Features
| **Script** | **Description** |
| :- | :- |
| `Bullet.gd` | Script for bullet objects and its speed. |
| `DeathArea.gd` | Script for Area to free objects inside. |
| `Enemy.gd` | Script for enemy characters and its functions. |
| `Game.gd` | Script for the Game Manager object to manage the game. |
| `Lives.gd` | Script for in-game UI to manage player lives. |
| `MainMenu.gd` | Script for main menu to manage its buttons. |
| `Manager.gd` | Singleton script to help manage the gameplay. |
| `MyButton.gd` | Script for Button objects to play sound when pressed. |
| `Platform.gd` | Script for Platform objects to manage its speed. |
| `PlatformEater.gd` | Script for Area to eat (free) platforms. |
| `PlatformParent.gd` | Script for parent of platform objects to manage its children's speed. |
| `Player.gd` | Script for the player character and its functions. |
| `Record.gd` | Script for the Record prefab to manage its texts. |

<br/>

## 📁 File Description
```
├── Run2Me
    ├── Objects   # for storing prefabs
    ├── Sauce     # for all game assets
        ├── Characters     # for game assets
        ├── Environment    # for terrain assets
        ├── Sounds         # for mp3 assets
        ├── Theme          # for UI type objects
    ├── Scenes    # for game levels
    ├── Scripts   # for game scripts
```

<br/>

## 💿 How to Open in Game Engine
1. Download all files.
2. Extract to **Folder A** (an empty folder).
3. Launch Godot v4.2.2.
4. Press **Import** and select `project.godot` in **Folder A**.
