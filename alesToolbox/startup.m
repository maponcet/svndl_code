
%------------ FreeSurfer -----------------------------%
fshome = getenv('FREESURFER_HOME');
fsmatlab = sprintf('%s/matlab',fshome);
if (exist(fsmatlab) == 7)
    addpath(genpath(fsmatlab));
end
clear fshome fsmatlab;
%-----------------------------------------------------%

%------------ FreeSurfer FAST ------------------------%
fsfasthome = getenv('FSFAST_HOME');
fsfasttoolbox = sprintf('%s/toolbox',fsfasthome);
if (exist(fsfasttoolbox) == 7)
    path(path,fsfasttoolbox);
end
clear fsfasthome fsfasttoolbox;
%-----------------------------------------------------%


% FSL Setup
setenv( 'FSLDIR', '/usr/local/fsl' );
fsldir = getenv('FSLDIR');
fsldirmpath = sprintf('%s/etc/matlab',fsldir);
path(path, fsldirmpath);
clear fsldir fsldirmpath;

%---------------------- MNE --------------------------%
mnehome = getenv('MNE_ROOT');
mnematlab = sprintf('%s/share/matlab',mnehome);
if (exist(mnematlab) == 7)
    path(path,mnematlab);
end
clear mnehome mnematlab;
%-----------------------------------------------------%
