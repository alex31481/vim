# vim Configuration 
This is a repository to for saving and preserving my .vimrc file for both my Windows and Mac Machines. Anyone is wellcome to take this and extend this further. I am very new to vim and you will see silly things I am putting into my vim file. 

##Pre-Requisits
Inorder to have evertying setup nicely there are a fews we need to install if you have not installed them on your machine.
###Install Git
Please follow the instrucitons on [git installation page](http://git-scm.com/book/en/v2/Getting-Started-Installing-Git) 

###Install vim
Please skip this step if you are using mac, Unix or Linux based machiens. The vim editor comes with those OS by default. However you may consider upgrading the vim on those machine but I am not going to go over that here. So if you are using windows go to [the vim download page](http://www.vim.org/download.php) to download and install vim.


### Install Vundle 
Vundle is a plugin manager a lot like the Sublime Package Conrol. To make things as easy as possible I have chosen to use Vundle so there is not need to clone from repositories other than this one and the Vundle repository. Please complete the previous 2 pre-requisits before continuing on to the next steps.
####Mac instructions
Please execute the following commands in your termnial. 

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
The above command will copy all contents of the vundle plugin into the ~/.vim/bundle/Vundle.vim directory effectively installing all scripts that are necessary for the Vundle plugin.

####Windows instuctions
Please execute the following commands in your command prompt

    git clone https://github.com/gmarik/Vundle.vim.git c:\vimfiles\bundle\Vundle.vim
The above command will copy all contents of the vundle plugin into the c:\vimfiles\bundle\Vundle.vim directory effectively installing all scripts that are necessary for the Vundle plugin.

####Install Node.js

####Install jshint via npm


The above completes all steps that is required to conitue the setup
______
##.vimrc file configurations 



### Initializing and Updating Plugins

launch vim and exeucte the following command

     :PluginInstall

The above command will install/update all plugins that are registerd in main.vimrc file. All plugins are installed when you see the word "Done!" your status bar. Restart vim. At this point you are done configuring vim and you are ready to code with it. 


______
##What happens from here and on?
There are tone of materials online for you to research on vim. Moving to vim is more like a never ending process. However the results is very rewarding from my point of view. So, please do not get discouraged when you are stuck on something. In most casses, you will be able to find your answer via google. If you cannnot find the answer
then post it on a vim forum.


