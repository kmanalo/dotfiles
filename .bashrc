# .bashrc

# source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# critcel User specific aliases and functions
if [[ `hostname` = critcel* ]] || 
   [[ `hostname` = iw* ]] ||
   [[ `hostname` = force* ]]; then 

  SHAREDDIR=/nv/ps1/critcel-project

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
  
  # for MCNP
  export DATAPATH=/nv/ps1/critcel-project/MCNP_DATA
  export PATH=$PATH:"/nv/hp17/kmanalo3/critcel/rsicc-isos/mcnp6-beta3-dvd-pt1/LANL/MCNP_CODE/bin"

# supress on host force
elif [[ `hostname` != force* ]]; then 
    alias ls='ls --group-directories-first --color=auto'
    eval $(dircolors -b ~/dotfiles/.dircolors)

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
fi

# Host-independent aliases

alias vip='vim -p'
alias rm='rm -i'
alias df='df -h'
alias quota='quota -s -u'
alias du='du -h'

# ignore duplicates in history
export HISTCONTROL=ignoredups

# tries to keep histories from other sessions -- helpful when using screen
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Increase the stacksize 
ulimit -s unlimited

