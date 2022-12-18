init:
	x86_64-w64-mingw32-cmake -DMOD_ID=sapiens_coal_mod -DMOD_NAME="CoalMod" -DDESCRIPTION="Adds coal and charcoal to the game: More efficient, long-lasting fuel types" -DDEVELOPER="nmattela" -DDEVELOPER_URL="https://github.com/nmattela/sapiens_coal_mod" -DPREVIEW_FILE="preview.png" -DMOD_MAJOR_VERSION=0 -DMOD_MINOR_VERSION=1 -DMOD_PATCH_VERSION=2 . -B build
	cmake --build build/
	ln -s ${PWD}/build/sapiens_coal_mod/ /mnt/LinuxHDD/SteamLibrary/steamapps/compatdata/1060230/pfx/drive_c/users/steamuser/AppData/Roaming/majicjungle/sapiens/mods/sapiens_coal_mod
	ln -s ${PWD}/models/ ${PWD}/build/sapiens_coal_mod/models
	ln -s ${PWD}/scripts ${PWD}/build/sapiens_coal_mod/scripts

build:
	cmake --build build/

publish:
	- rm -rf ${PWD}/build/sapiens_coal_mod/models
	- rm -rf ${PWD}/build/sapiens_coal_mod/scripts
	- rm -rf /mnt/LinuxHDD/SteamLibrary/steamapps/compatdata/1060230/pfx/drive_c/users/steamuser/AppData/Roaming/majicjungle/sapiens/mods/sapiens_coal_mod
	- cp -r ${PWD}/models/ ${PWD}/build/sapiens_coal_mod/models
	- cp -r ${PWD}/scripts ${PWD}/build/sapiens_coal_mod/scripts
	- cp -r ${PWD}/build/sapiens_coal_mod /mnt/LinuxHDD/SteamLibrary/steamapps/compatdata/1060230/pfx/drive_c/users/steamuser/AppData/Roaming/majicjungle/sapiens/mods/sapiens_coal_mod
	cp ${PWD}/workshop.mjl ${PWD}/build/sapiens_coal_mod/workshop.mjl