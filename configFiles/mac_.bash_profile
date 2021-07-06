# FSL Configuration
FSLDIR=/usr/local/fsl
PATH=${FSLDIR}/bin:${PATH}
. ${FSLDIR}/etc/fslconf/fsl.sh
export FSLDIR PATH

source .bashrc

#export CVSROOT=SKI+ales@mono/raid/MRI/CVS

export FREESURFER_HOME=/Applications/freesurfer

export FSLOUTPUTTYPE NIFTI_GZ

export SUBJECTS_DIR=/Volumes/MRI/anatomy/FREESURFER_SUBS/

export MNE_ROOT=/Applications/MNE-2.7.0-3106-MacOSX-i386
export MATLAB_ROOT=/Applications/MATLAB_R2019b.app
source $MNE_ROOT/bin/mne_setup_sh

source $FREESURFER_HOME/SetUpFreeSurfer.sh


export PATH=$PATH:/opt/local/bin
export EDITOR=nano

source /Volumes/MRI/toolbox/MNESuite/mne_osx/bin/mne_setup_sh

