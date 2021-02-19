#! /bin/bash

installed() {
    return $(dpkg-query -W -f '${Status}\n' "${1}" 2>&1|awk '/ok installed/{print 0;exit}{print 1}')
}

pkgs=(libgl1-mesa-dev xorg-dev vulkan-tools libvulkan-dev vulkan-validationlayers-dev spirv-tools libglfw3-dev libglm-dev)
missing_pkgs=""
for pkg in ${pkgs[@]}; do
    if ! $(installed $pkg) ; then
        missing_pkgs+=" $pkg"
    fi
done
echo $missing_pkgs
if [ ! -z "$missing_pkgs" ]; then
    cmd="sudo apt install -y $missing_pkgs"
    echo $cmd
fi

