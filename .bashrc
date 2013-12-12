# .bashrc

# source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# universal open scripts
export PATH=~/dotfiles/scripts/:$PATH

# critcel User specific aliases and functions
if [[ `hostname` = critcel* ]] || 
   [[ `hostname` = iw* ]] ||
   [[ `hostname` = force* ]]; then 

  SHAREDDIR=/nv/ps1/critcel-project

  source ${SHAREDDIR}/grouprc

  function qpeekgt() { 
    ${SHAREDDIR}/qpeek ${@}.repace.pace.gatech.edu 
  }
  function qdelgt()  {  
    ${SHAREDDIR}/qdel ${@}.repace.pace.gatech.edu 
  }
  function qpeekj()  { 
  qpeekgt -f $myjobid 
  }
  function png2eps() { 
    CMD=`echo sam2p ${@}.png EPS: ${@}.eps` $CMD 
  }
  function git_diff() {
    git diff --no-ext-diff -w "$@" | vim -R -
  }
  
  alias penmshfp='penmshxp -msf 4; mkdir -p plots; mv *png plots'
  alias wstat='watch -n 1 qstat'
  alias qdel='canceljob'
  
  export PATH=/nv/ps1/critcel-project:$PATH
  export PATH=/nv/hp16/kmanalo3/phd-bin:$PATH
  export GIT_TEMPLATE_DIR=/usr/local/packages/git-1.7.0.5/share/git-core/templates/
  export PKG=/nv/hp16/kmanalo3/data/packages   
  
  # for serpent
  export acelib=/nv/hp16/kmanalo3/data/packages/serpent-757/c757mnyws00/c757mnyws00/xsdata/sss_endfb7u.xsdata
  export declib=/nv/hp16/kmanalo3/data/packages/serpent-757/c757mnyws00/c757mnyws00/xsdata/sss_endfb7.dec
  export nfylib=/nv/hp16/kmanalo3/data/packages/serpent-757/c757mnyws00/c757mnyws00/xsdata/sss_endfb7.nfy
  

# go ahead and source ubuntu default bashrc
elif [[ `hostname` == kevin-vbox ]] ; then
  source ~/.bashrc.ubuntu  
  source /opt/intel/composer_xe_2013.3.163/bin/compilervars.sh intel64

# reagan User specific aliases and functions
elif [[ `hostname` = reagan* ]] ; then 
    # directory support
    alias ls='ls --color=auto'
    #NOTWORKING eval $(dircolors -b ~/dotfiles/.dircolors)

    # DATAPATH for MCNP cross-section data
    export DATAPATH
    DATAPATH="/home/MCNP_DATA"

    PATH=$PATH:/opt/local/bin

    # support for nagfor5.3
    export NAG_KUSARI_FILE=/usr/local/lib/NAG_Fortran/nag.licence

# supress on host force
elif [[ `hostname` != force* ]]; then 
    alias ls='ls --group-directories-first --color=auto'
    eval $(dircolors -b ~/dotfiles/.dircolors)

fi

# Host-independent aliases
alias vip='vim -p'
alias rm='rm -i'
alias df='df -h'
alias quota='quota -s -u'
alias du='du -h'
alias lls='ls --color=auto -lah'
alias pwd='pwd -P' # I cannot believe I didn't know this

# Host-independent functions
function cd()
{
     builtin cd "$*" && ls
}

# ignore duplicates in history
export HISTCONTROL=ignoredups

# tries to keep histories from other sessions -- helpful when using screen
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Increase the stacksize 
ulimit -s unlimited

# PATH for MCNP executables
export PATH
PATH=$PATH:/nv/hp17/kmanalo3/data/mcnp6/MCNP_CODE/bin
 
# Increase the stacksize 
ulimit -s unlimited
 
# DATAPATH for MCNP cross-section data
export DATAPATH
DATAPATH="/nv/hp17/kmanalo3/data/mcnp6/MCNP_DATA"
 
