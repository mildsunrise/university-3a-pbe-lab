% Add subdirectories to path
root = fileparts(mfilename('fullpath'));
addpath([root filesep 'assets']);
addpath([root filesep 'assets' filesep 'open-iconic']);
addpath([root filesep 'src' filesep 'adc']);
addpath([root filesep 'src' filesep 'analyzer']);
addpath([root filesep 'src' filesep 'chooser']);
addpath([root filesep 'src' filesep 'equalizer']);
addpath([root filesep 'src' filesep 'simulator']);
addpath([root filesep 'src' filesep 'util']);
addpath([root filesep 'src' filesep 'util' filesep 'dsp']);
addpath([root filesep 'src' filesep 'util' filesep 'misc']);

% Run chooser app
chooser;
