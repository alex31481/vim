# vim Configuration 
This is a repository to for saving and preserving my .vimrc file for both my Windows and Mac Machines. Anyone is welcome to take this and extend this further. I am very new to vim and you will see silly things I am putting into my vim file. 

##Pre-Requisites
In order to have everything setup nicely there are a fews we need to install if you have not installed them on your machine.
###Install Git
Please follow the instructions on [git installation page](http://git-scm.com/book/en/v2/Getting-Started-Installing-Git) 

###Install vim
Please skip this step if you are using mac, Unix or Linux based machines. The vim editor comes with those OS by default. However you may consider upgrading the vim on those machine but I am not going to go over that here. So if you are using windows go to [the vim download page](http://www.vim.org/download.php) to download and install vim.


### Install Vundle 
Vundle is a plug-in manager a lot like the Sublime Package Control. To make things as easy as possible I have chosen to use Vundle so there is no need to clone from repositories other than this one and the Vundle repository. Please complete the previous 2 pre-requisites before continuing on to the next steps.
####Mac instructions
Please execute the following commands in your terminal. 

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
The above command will copy all contents of the Vundle plug-in into the ~/.vim/bundle/Vundle.vim directory effectively installing all scripts that are necessary for the Vundle plug-in.

####Windows instructions
Please execute the following commands in your command prompt

    git clone https://github.com/gmarik/Vundle.vim.git c:\vimfiles\bundle\Vundle.vim

The above command will copy all contents of the Vundle plug-in into the C:\vimfiles\bundle\Vundle.vim directory effectively installing all scripts that are necessary for the Vundle plug-in.


I have included javascript linting in the main.vimrc file. This feature requires the installation of jshint npm module. The following steps needs to be completed in order to properly utilize the linting feature.

####Install Node.js
Visit the [node.js website](http://nodejs.org) to install Node.js.
####Install jshint via npm
Execute the following command in your command prompt to install jshint.
    npm install -g jshint

####Caps lock Key remap
It is much recommended to remap caps lock key to control key for vim users due to the differnce between upper and lower key commands. Please use the following instructions to configure the remapping. I have enabled this for map.
#####Windows: 
* Download and Install [autohotkey](http://www.autohotkey.com/)
* Configure the capslogck.ahk to run on startup
* Your caps lock is not mapped to control and the .vimrc file contains a plugin that enables a soft capslock via Control-L and Leader-l 
#####Mac:
I'll figure it out soon


The above completes all steps that is required to continue the setup
______
##.vimrc file configurations 
###Clone this repository to your machine
Windows: I am choosing the c:\vim for its simplicity. You may choose other locations but the vimrc file has to be changed accordingly 
    
    git clone https://github.com/alex31481/vim c:\vim
    
Mac: I am choosing the ~/Development/vim-config based on my setup. You may choose other locations but the vimrc file has to be changed accordingly 
    
    git clone https://github.com/alex31481/vim ~/Development/vim-config 

###Setup the vimrc file


### Initializing and Updating Plugins

launch vim and execute the following command

     :PluginInstall

The above command will install/update all plugins that are registerd in main.vimrc file. All plugins are installed when you see the word "Done!" your status bar. Restart vim. At this point you are done configuring vim and you are ready to code with it. 


______
##What happens next?
There are tons of materials online for you to research on vim. Moving to vim is more like a never ending process. However the results is very rewarding from my point of view. So, please do not get discouraged when you are stuck on something. In most casses, you will be able to find your answer via google. If you cannnot find the answer
then post it on a vim forum.


