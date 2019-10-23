% Copyright (c) 2015, BENCHOP, Slobodan Milovanović
% All rights reserved.

% Here we have modified the original code. Thus instead of
% outputing a latex file, the result will can be captured by
% a python script, which later substantiate a bar chart

% create a function to choose between different problems
% extrapolate filepath, time and relative error
function [filepaths, runtime, relerr] = TTable(problem, K, T, r, sig)


format long

% addpath(genpath('./')); %adds all the functions from subfolders to the path
% mfiles=getfilenames('./','BSeuCallU*.m')

warning off

Methods={'MC','MC-S','QMC-S','MLMC','MLMC-A',...
    'FFT','FGL','COS',...
    'FD','FD-NU','FD-AD',...
    'RBF','RBF-FD','RBF-PUM','RBF-LSML','RBF-AD','RBF-MLT'};

switch problem
%% Problem 1 a) I
    case 1
        display('Problem 1 a) I');
        rootpath=pwd;
        S=[90,100,110]; % K=100; T=1.0; r=0.03; sig=0.15;
        U=[2.758443856146076 7.485087593912603 14.702019669720769];

        filepathsBSeuCallUI=getfilenames('./','BSeuCallUI_*.m');
        par={S,K,T,r,sig};
        [timeBSeuCallUI,relerrBSeuCallUI] = executor(rootpath,filepathsBSeuCallUI,U,par)

        cd(rootpath);
        
        filepaths = filepathsBSeuCallUI';
        runtime = timeBSeuCallUI';
        relerr = relerrBSeuCallUI';

%% Problem 1 b) I
    case 2
        display('Problem 1 b) I');
        rootpath=pwd;
        S=[90,100,110]; % K=100; T=1.0; r=0.03; sig=0.15;
        U=[10.726486710094511 4.820608184813253 1.828207584020458];

        filepathsBSamPutUI=getfilenames('./','BSamPutUI_*.m');
        par={S,K,T,r,sig};
        [timeBSamPutUI,relerrBSamPutUI] = executor(rootpath,filepathsBSamPutUI,U,par);

        cd(rootpath);

        filepaths = filepathsBSamPutUI';
        runtime = timeBSamPutUI';
        relerr = relerrBSamPutUI';

%% Problem 1 c) I
    case 3
        display('Problem 1 c) I');
        rootpath=pwd;
        S=[90,100,110]; % K=100; T=1.0; r=0.03; sig=0.15; 
        B=1.25*K;
        U=[1.822512255945242 3.294086516281595 3.221591131246868];

        filepathsBSupoutCallI=getfilenames('./','BSupoutCallI_*.m');
        par={S,K,T,r,sig,B};
        [timeBSupoutCallI,relerrBSupoutCallI] = executor(rootpath,filepathsBSupoutCallI,U,par);

        cd(rootpath);

        filepaths = filepathsBSupoutCallI';
        runtime = timeBSupoutCallI';
        relerr = relerrBSupoutCallI';

%% Problem 1 a) II
    case 4
        display('Problem 1 a) II');
        rootpath=pwd;
        S=[97,98,99]; % sig=0.01; r=0.1; T=0.25; K=100;
        U=[0.033913177006141   0.512978189232598   1.469203342553328];

        filepathsBSeuCallUII=getfilenames('./','BSeuCallUII_*.m');
        par={S,K,T,r,sig};
        [timeBSeuCallUII,relerrBSeuCallUII] = executor(rootpath,filepathsBSeuCallUII,U,par);

        cd(rootpath);

        filepaths = filepathsBSeuCallUII';
        runtime = timeBSeuCallUII';
        relerr = relerrBSeuCallUII';

%% Problem 1 b) II
    case 5
        display('Problem 1 b) II');
        rootpath=pwd;
        S=[97,98,99]; % K=100; T=0.25; r=0.1; sig=0.01;
        U=[3.000000000000682 2.000000000010786   1.000000000010715];

        filepathsBSamPutUII=getfilenames('./','BSamPutUII_*.m');
        par={S,K,T,r,sig};
        [timeBSamPutUII,relerrBSamPutUII] = executor(rootpath,filepathsBSamPutUII,U,par);

        cd(rootpath);

        filepaths = filepathsBSamPutUII';
        runtime = timeBSamPutUII';
        relerr = relerrBSamPutUII';

%% Problem 1 c) II
    case 6
        display('Problem 1 c) II');
        rootpath=pwd;
        S=[97,98,99]; % sig=0.01; r=0.1; T=0.25; K=100; 
        B=1.25*K;
        U=[0.033913177006134   0.512978189232598   1.469203342553328];

        filepathsBSupoutCallII=getfilenames('./','BSupoutCallII_*.m');
        par={S,K,T,r,sig,B};
        [timeBSupoutCallII,relerrBSupoutCallII] = executor(rootpath,filepathsBSupoutCallII,U,par);

        cd(rootpath);
    
        filepaths = filepathsBSupoutCallII';
        runtime = timeBSupoutCallII';
        relerr = relerrBSupoutCallII';
end

end
