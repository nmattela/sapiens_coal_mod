init:
	x86_64-w64-mingw32-cmake -DMOD_ID=SapiensCoalMod -DMOD_NAME="Sapiens Coal Mod" -DDESCRIPTION="Adds coal and charcoal to the game: More efficient, long-lasting fuel types" -DDEVELOPER="nmattela" -DDEVELOPER_URL="https://mattelaer.dev" -DPREVIEW_FILE="preview.png" -DMOD_MAJOR_VERSION=1 -DMOD_MINOR_VERSION=2 -DMOD_PATCH_VERSION=3 . -B build
	cmake --build build/
	ln -s ${PWD}/build/SapiensCoalMod/ /mnt/LinuxHDD/SteamLibrary/steamapps/compatdata/1060230/pfx/drive_c/users/steamuser/AppData/Roaming/majicjungle/sapiens/mods/SapiensCoalMod
	ln -s ${PWD}/models/ ${PWD}/build/SapiensCoalMod/models
	ln -s ${PWD}/scripts ${PWD}/build/SapiensCoalMod/scripts

build:
	cmake --build build/