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
Please execute the following commands in your termnial

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

####Windows instuctions
Please execute the following commands in your command prompt

    c:\
    git clone https://github.com/gmarik/Vundle.vim.git c:\vimfiles\bundle\Vundle.vim



The above will complete all steps that is required to complete the vim setup
______
## 
To keep thing simple I have configured files to working a git hub clone of this repository located at c:/vim and I have chose to use c:\vimfiles\bundle to put all the vim plugins.
### Downloading 


### Initializaing and Update plugin

launch vim and exeucte the following command
     :PluginInstall
