# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Critcel User specific aliases and functions
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
  export PATH=$PATH:/usr/local/packages/git-1.7.0.5/bin
  export PATH=$PATH:/usr/local/packages/clisp/bin/
  export PATH=/nv/hp16/kmanalo3/phd-bin:$PATH
  export GIT_TEMPLATE_DIR=/usr/local/packages/git-1.7.0.5/share/git-core/templates/
  export PKG=/nv/hp16/kmanalo3/data/packages   
  
  # for serpent
  export acelib=/nv/hp16/kmanalo3/data/packages/serpent-757/c757mnyws00/c757mnyws00/xsdata/sss_endfb7u.xsdata
  export declib=/nv/hp16/kmanalo3/data/packages/serpent-757/c757mnyws00/c757mnyws00/xsdata/sss_endfb7.dec
  export nfylib=/nv/hp16/kmanalo3/data/packages/serpent-757/c757mnyws00/c757mnyws00/xsdata/sss_endfb7.nfy
  
  # for MCNP
  export DATAPATH=/nv/ps1/critcel-project/MCNP_DATA

  # supress on host force
  if [[ `hostname` != force* ]]; then 
    alias ls='ls --group-directories-first --color=auto'
    eval $(dircolors -b ~/dotfiles/.dircolors)
  fi 

fi 

# Reagan User specific aliases and functions
if [[ `hostname` = reagan* ]] ; then 
    # directory support
    alias ls='ls --group-directories-first --color=auto'
    eval $(dircolors -b ~/dotfiles/.dircolors)

    # DATAPATH for MCNP cross-section data
    export DATAPATH
    DATAPATH="/home/MCNP_DATA"
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

# PATH for MCNP executables
export PATH
PATH="/nv/hp17/kmanalo3/critcel/rsicc-isos/mcnp6-beta3-dvd-pt1/LANL/MCNP_CODE/bin:/usr/local/packages//mvapich2/1.9/intel-12.1.4/bin:/usr/local/packages/intel/compiler/12.1.4/bin/intel64:/nv/hp16/kmanalo3/phd-bin:/nv/ps1/critcel-project:/opt/torque/2.4.3/bin:/usr/lib64/qt-3.3/bin:/usr/local/packages/python/3.2.2//bin:/usr/local/packages/matlab/r2011a/bin:/usr/local/packages//mvapich2/1.8.patched/pgi-11.10/bin:/usr/bin/:/opt/pace/bin/:/opt/moab/5.3.7/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/packages/matlab/r2011a-dcs/bin:/usr/local/packages/matlab/r2011a-dcs/toolbox/distcomp/bin:/usr/local/packages/mathematica/8.0/bin:/usr/local/packages/git-1.7.0.5/bin:/usr/local/packages/clisp/bin/:/nv/hp17/kmanalo3/bin:/usr/local/mpich2-intel/bin/:/usr/local/packages/torque-2.1.6/bin/:/usr/local/packages/moab-5.3.0/bin/:/opt/cuda/bin:/nv/ps1/critcel-project:/usr/local/packages/hwloc/1.5/bin"
 
# Increase the stacksize 
ulimit -s unlimited
