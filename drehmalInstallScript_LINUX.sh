#  oooooooooo.                      oooo                                    oooo
#  `888'   `Y8b                     `888                                    `888
#   888      888 oooo d8b  .ooooo.   888 .oo.   ooo. .oo.  .oo.    .oooo.    888
#   888      888 `888""8P d88' `88b  888P"Y88b  `888P"Y88bP"Y88b  `P  )88b   888
#   888      888  888     888ooo888  888   888   888   888   888   .oP"888   888
#   888     d88'  888     888    .o  888   888   888   888   888  d8(  888   888
#  o888bood8P'   d888b    `Y8bod8P' o888o o888o o888o o888o o888o `Y888""8o o888o
# [\e[36mAvSYS\e[0m] for AvSYS time
# \e[1;33m\e[0m

echo -e " _____           _                     _       _____      _                               _ _       _ "
echo -e "|  __ \         | |                   | |  _  |  __ \    (_)            _______          | (_)     | |"
echo -e "| |  | |_ __ ___| |__  _ __ ___   __ _| | (_) | |__) | __ _|_ __ ___   /  ___  \  _ __ __| |_  __ _| |"
echo -e "| |  | | '__/ _ \ '_ \| '_ \ _ \ / _\ | |     |  ___/ '__| | '_ \ _ \||  /   \  || '__/ _\ | |/ _\ | |"
echo -e "| |__| | | |  __/ | | | | | | | | (_| | |  _  | |   | |  | | | | | | |_\ \   / /_| | | (_| | | (_| | |"
echo -e "|_____/|_|  \___|_| |_|_| |_| |_|\__,_|_| (_) |_|   |_|  |_| | |_| |_|____| |____|_|  \__,_|_|\__,_|_|"
echo -e "        by the [\e[35;40mPrimordial Team\e[0m]"
echo

############################################################################
# Information (procedure, misc. info, tutorial elements for the installer) #
############################################################################

echo -e "[\e[36mAvSYS\e[0m] Welcome to the \e[1;33mDrehmal:Primordial\e[0m installation script !"
echo -e "[\e[36mAvSYS\e[0m] If anything fails during this script and you do not understand why, feel free to come in our \e[1;33mdiscord server\e[0m to ask questions in the \e[1;33msupport channel\e[0m."
echo -e "[\e[36mAvSYS\e[0m] You can find it on our website, \e[1;33mhttps://drehmal.net\e[0m, or at \e[1;33mhttps://discord.gg/xZAwFjcfge\e[0m !"
echo
echo -e "[\e[36mAvSYS\e[0m] Have ever used an \e[1;33minstaller\e[0m like this before ?"
echo -e "[\e[36mAvSYS\e[0m] Press y if you have, and press anything else if you've never used one."
read -p "Press y or another key, then press Enter..." yn
case $yn in
    [yY])
        # Quick tutorial for terminal installers in case the user has never interacted with one before.
        echo -e "[\e[36mAvSYS\e[0m] It's very simple !"
        echo -e "[\e[36mAvSYS\e[0m] When prompted with a \e[1;33mquestion\e[0m, you will have to \e[1;33mpress a key\e[0m to answer."
        echo -e "[\e[36mAvSYS\e[0m] (y/n) means that you can either type \e[1;33my\e[0m (for yes) or \e[1;33mn\e[0m (for no). \e[1;31;5m/!\\ \e[0m Any other key press will exit the installer! \e[1;31;5m/!\\ \e[0m"
        echo -e "[\e[36mAvSYS\e[0m] When there are multiple keys, like (a/b/c), that means that you have multiple options to chose from!"
        echo -e "[\e[36mAvSYS\e[0m] (y/*) means that you can either type \e[1;33my\e[0m for yes, or \e[1;33many other key\e[0m for no."
        echo -e "[\e[36mAvSYS\e[0m] Finally, do remember to \e[1;33always press Enter\e[0m at the end of your input to validate it."
        echo -e "[\e[36mAvSYS\e[0m] If you have any \e[1;33mquestions\e[0m about how to use this installer, ask in \e[1;33m our discord's #support channel.\e[0m"
        read -p "Press any key to continue..."
        ;;
    *)
        echo
        ;;
esac

echo -e "[\e[36mAvSYS\e[0m] \e[1;31;5m/!\\ \e[0m \e[1;31mThis script CAN ask for your superuser permission.  \e[0m\e[1;31;5m/!\\ \e[0m"
echo -e "[\e[36mAvSYS\e[0m] \e[1;31;5m/!\\ \e[0m \e[1;31mIt can be used to install packages (wget, unzip) or to execute the fabric installer.  \e[0m\e[1;31;5m/!\\ \e[0m"
read -p "Do you wish to proceed ? Press y to continue " yn

case $yn in
    [yY]) echo -e "[\e[36mAvSYS\e[0m] Ok, proceeding with the installation." ;;
    *)
        echo -e "[\e[36mAvSYS\e[0m] Exiting the script now."
        exit
    ;;
esac

echo -e "[\e[36mAvSYS\e[0m] \e[1;31;5m/!\\ \e[0m \e[1;31mThis script WILL download files from the internet directly into your file system !  \e[0m\e[1;31;5m/!\\ \e[0m"
read -p "Are you sure you want to proceed and install Drehmal ? Press y to continue " yn

case $yn in
    [yY]) echo -e "[\e[36mAvSYS\e[0m] Ok, proceeding with the installation." ;;
    *)
        echo -e "[\e[36mAvSYS\e[0m] Exiting the script now."
        exit
    ;;
esac

############################################################################
#       Checks (directories, path name, required packages, etc...)         #
############################################################################

DIR1="./mods"
DIR2="./resourcepacks"
DIR3="./saves"
dirname="${PWD##*/}"
if [[ $dirname != ".minecraft" ]]; then
    dirpath=$(pwd)
    echo -e "[\e[36mAvSYS\e[0m] Your current directory is \e[1;33m$dirpath\e[0m"
    if [[ ! -d "$DIR1" ]]; then
        echo -e "[\e[36mAvSYS\e[0m] Your \e[1;33mmods\e[0m directory is missing..."
    fi
    if [[ ! -d "$DIR2" ]]; then
        echo -e "[\e[36mAvSYS\e[0m] Your \e[1;33mresourcepacks\e[0m directory is missing..."
    fi
    if [[ ! -d "$DIR3" ]]; then
        echo -e "[\e[36mAvSYS\e[0m] Your \e[1;33msaves\e[0m directory is missing..."
    fi
    echo -e "[\e[36mAvSYS\e[0m] ..."
    echo -e "[\e[36mAvSYS\e[0m] Are you sure this is your \e[1;33mminecraft folder\e[0m ?"
    read -p "Answer with (y/n)..." yn
    
    case $yn in
        [yY]) 
            echo -e "[\e[36mAvSYS\e[0m] Ok, proceeding with the installation."
            if [[ ! -d "$DIR1" ]]
            then
                echo -e "[\e[36mAvSYS\e[0m] Creating \e[1;33mmods folder...\e[0m"
                sleep 0.5s
                mkdir mods
            fi
            if [[ ! -d "$DIR2" ]]
            then
                echo -e "[\e[36mAvSYS\e[0m] Creating \e[1;33mresourcepacks folder...\e[0m"
                sleep 0.5s
                mkdir resourcepacks
            fi
            if [[ ! -d "$DIR3" ]]
            then
                echo -e "[\e[36mAvSYS\e[0m] Creating \e[1;33msaves folder...\e[0m"
                sleep 0.5s
                mkdir saves
            fi
            ;;
        [nN])
            echo -e "[\e[36mAvSYS\e[0m] Please execute this script in your \e[1;33mminecraft folder\e[0m for it to work properly."
            exit
        ;;
        *)
            echo -e "[\e[36mAvSYS\e[0m] Invalid response! Please answer in (y/n) format."
            exit 1
        ;;
    esac
fi

echo

sleep 1s
for REQUIRED_PKG in wget, unzip; do
    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG | grep "install ok installed")
    echo -e "[\e[36mAvSYS\e[0m] Checking for \e[1;33m$REQUIRED_PKG\e[0m: $PKG_OK"
    if [ "" = "$PKG_OK" ]; then
        echo -e "[\e[36mAvSYS\e[0m] No \e[1;33m$REQUIRED_PKG\e[0m package. Setting up \e[1;33m$REQUIRED_PKG\e[0m."
        sudo apt-get --yes install $REQUIRED_PKG
    fi
    sleep 0.5s
done

echo


######################################################################################################
# Mods (information, selection of which mods to install, moving already present mods in a subfolder) #
######################################################################################################

declare -A PERFMODS
declare -A NECESSMODS

declare -A PERFMODSURL
declare -A NECESSMODSURL

PERFMODS[LazyDFU]="Defers unnecessary loadings to load pretty much anything faster."
PERFMODSURL[LazyDFU]="https://cdn.modrinth.com/data/hvFnDODi/versions/0.1.2/lazydfu-0.1.2.jar"

PERFMODS[EntityCulling]="Prevents entities from rendering when not in view."
PERFMODSURL[EntityCulling]="https://cdn.modrinth.com/data/NNAgCjsB/versions/1.5.0-fabric-1.17/entityculling-fabric-mc1.17.1-1.5.0.jar"

PERFMODS[Sodium]="Extremely optimised render engine for minecraft."
PERFMODSURL[Sodium]="https://cdn.modrinth.com/data/AANobbMI/versions/mc1.17.1-0.3.4/sodium-fabric-mc1.17.1-0.3.4%2Bbuild.13.jar"

PERFMODS[Lithium]="Optimises game logic."
PERFMODSURL[Lithium]="https://cdn.modrinth.com/data/gvQqBUqZ/versions/mc1.17.1-0.7.5/lithium-fabric-mc1.17.1-0.7.5.jar"

NECESSMODS[FabricAPI]="Necessary for most mods on fabric to work."
NECESSMODSURL[FabricAPI]="https://cdn.modrinth.com/data/P7dR8mSH/versions/0.46.1%2B1.17/fabric-api-0.46.1%2B1.17.jar"

cd mods
goOnThen=0
perfModsPlease=0
echo
echo -e "[\e[36mAvSYS\e[0m] Do you want a \e[1;33mdetailled list of all mods\e[0m before installation ?"
read -p "Answer with (y/*)..." yn
while [[$goOnThen = 0]]
do
    case $yn in
        [yY])
            echo
            echo -e "[\e[36mAvSYS\e[0m] \e[1;33mNecessary Mods\e[0m"
            for mod in ${!NECESSMODS[@]}; do
                echo -e "    $mod : ${NECESSMODS[$mod]}"
            done
            echo
            echo -e "[\e[36mAvSYS\e[0m] \e[1;33mPerformance Mods\e[0m"
            for mod in ${!PERFMODS[@]}; do
                echo -e "    $mod : ${PERFMODS[$mod]}"
            done
            echo
            read -p "Press any key to continue. " idk
            echo
            ;;
        *)
            echo -e "[\e[36mAvSYS\e[0m] Do you want to install \e[1;33mperformance mods\e[0m ?"
            echo -e "[\e[36mAvSYS\e[0m] Drehmal is a \e[1;33mbig world\e[0m, and might \e[1;31mslow your game down a lot.\e[0m"
            echo -e "[\e[36mAvSYS\e[0m] \e[1;33mWe recommend you install these mods before playing.\e[0m"
            read -p "Do you want a detailled list of all mods before installation ? (y/*) " accept
            ;;
    esac
    case $accept in
        [yY]) 
            goOnThen=1
            perfModsPlease=1
            echo -e "[\e[36mAvSYS\e[0m] \e[1;33mPerformance mods added to the download list!\e[0m"
            ;;
        *) 
            echo -e "[\e[36mAvSYS\e[0m] Do you want a \e[1;33mdetailled list of all mods\e[0m before installation ?"
            read -p "Answer with (y/*)..."
            ;;
    esac 
done

if ! [[ -z $(find . -maxdepth 1 -type f -printf '.') ]]; then
    echo -e "[\e[36mAvSYS\e[0m] Your mods folder already contains mods ! Moving them in a subfolder..."
    mkdir BeforeDrehmal
    yourfilenames=$(ls ./*.jar)
    for file in $yourfilenames; do
        mv "$file" "./BeforeDrehmal/$file"
    done
    echo
fi

cd ..

############################################################################
#                       Resource pack selection                           #
############################################################################

echo -e "[\e[36mAvSYS\e[0m] The resource pack is integrated in the map package, but you can choose to \e[1;33minstall it globally.\e[0m"
echo -e "[\e[36mAvSYS\e[0m] Pros :"
echo -e "            - You can play with the resource pack activated outside of Drehmal."
echo -e "            - You will have direct access to the datapack, if you're interested in that..."
echo -e "            - You will have a Drehmal Main Menu, as well as a new main menu theme !."
echo -e "[\e[36mAvSYS\e[0m] Cons :"
echo -e "            - Local Resourcepack removed : the pack won't automatically be activated when playing Drehmal."
echo -e "            OR "
echo -e "            - Local Resourcepack kept : will take up extra space in your file system."
echo
echo -e "[\e[36mAvSYS\e[0m] Do you wish to install the Drehmal resourcepack \e[1;33mglobally\e[0m ?"
read -p "Answer with (y/*)..." RessPlease

case $ in 
    [yY])
        echo
        echo -e "[\e[36mAvSYS\e[0m] You have selected to \e[1;33minstall the resourcepack globally.\e[0m"
        echo -e "[\e[36mAvSYS\e[0m] Do you want to \e[1;33mkeep the resourcepack installed locally (k)\e[0m or \e[1;33mremove local resource pack installed (r)\e[0m ?"
        read -p "Answer with (k/r)..." removeRess
        case $removeRess in
            [kK])
                echo -e "[\e[36mAvSYS\e[0m] Got it. \e[1;33mThe local resourcepack will be kept.\e[0m"
                ;;
            [rR])
                echo -e "[\e[36mAvSYS\e[0m] Got it. \e[1;33mThe local resourcepack will be removed.\e[0m"
                ;;
            *)  
                echo -e "[\e[36mAvSYS\e[0m] No setting was chosen. \e[1;33mBy default, the local resourcepack will be kept.\e[0m"
                ;;
        esac
        ;;
    

    *) 
        echo
        echo -e "[\e[36mAvSYS\e[0m] You have selected to \e[1;33mkeep the resource pack local.\e[0m"
        ;;
esac

echo

############################################################################
#      Downloads (Mods, resourcepack if selected, then map package)       #
############################################################################


echo -e "[\e[36mAvSYS\e[0m] The installation script will now proceed to \e[1;33mdownload required packages\e[0m."
echo -e "[\e[36mAvSYS\e[0m] Depending on what you decided to install and on your \e[1;33minternet connection\e[0m, \e[1;31mthis might take a while\e[0m."
echo
echo
echo -e "[\e[36mAvSYS\e[0m] \e[1;33mInstalling necessary mods...\e[0m"
echo
for url in ${NECESSMODSURL[@]}; do
    wget -q --show-progress -P ./mods "$url"
done
echo
echo -e "[\e[36mAvSYS\e[0m] \e[1;32mNecessary mods successfully installed !\e[0m"
echo

if [[$perfModsPlease = 1]]
then
    echo -e "[\e[36mAvSYS\e[0m] \e[1;33mInstalling performance mods...\e[0m"
    echo
    for url in ${PERFMODSURL[@]}
    do
        wget -q --show-progress -P ./mods "$url"
    done
    echo
    echo -e "[\e[36mAvSYS\e[0m] \e[1;32mPerformance mods successfully installed !\e[0m"
    echo
fi
echo -e "[\e[36mAvSYS\e[0m] \e[1;33mNow, time for the big downloads.\e[0m"
echo

# Map package
echo -e "[\e[36mAvSYS\e[0m] \e[1;33mDownloading the map package...\e[0m"
wget -q --show-progress -O ./saves/Drehmal_2.2.zip "" #drehmal url to be inserted once it's officially hosted somewhere
echo
# Unzipping the map package and moving it to the right place
cd ./saves
echo -e "[\e[36mAvSYS\e[0m] \e[1;33mUnzipping the map...\e[0m"
unzip --verbose -d Drehmal_2.2_Apotheosis Drehmal_2.2.zip
echo
# Resourcepack if selected
cd ..
if [[$RessPlease="k"]]
then
    echo -e "[\e[36mAvSYS\e[0m] \e[1;33mInstalling the resource pack globally...\e[0m"
    cp --verbose ./saves/Drehmal_2.2_Apotheosis/resource.zip ./resourcepacks/Drehmal_2.2_ResourcePack.zip
    echo
elif [[$RessPlease="r"]]
then
    echo -e "[\e[36mAvSYS\e[0m] \e[1;33mInstalling the resource pack globally...\e[0m"
    mv --verbose ./saves/Drehmal_2.2_Apotheosis/resource.zip ./resourcepacks/Drehmal_2.2_ResourcePack.zip
    echo -e "[\e[36mAvSYS\e[0m] \e[1;33mRemoving the local resource pack...\e[0m"
    echo
fi
echo
echo -e "[\e[36mAvSYS\e[0m] The map has been \e[1;32msuccessfully installed\e[0m. It should be in your \e[1;33msaves\e[0m as you open minecraft."
echo -e "[\e[36mAvSYS\e[0m] \e[1;31mPlease note that you NEED fabric 1.17.1 to play the map.\e[0m"
echo -e "[\e[36mAvSYS\e[0m] If you do not have fabric installed, \e[1;33myour game will not launch\e[0m, or it could break the map."
echo -e "[\e[35;40mPrimordial Team\e[0m] \e[1;33mWe hope you'll enjoy playing our map\e[0m ! If you have any questions, \e[1;33mask them in the discord\e[0m !"
