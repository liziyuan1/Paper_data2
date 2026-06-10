Paper Data and Plotting Scripts for "Ship Hull Positioning and Inclination Attitude Recognition Based on Shaft-rate Frequency Electric Fields"

This repository provides the validation datasets and plotting scripts used in the manuscript.

Repository Structure
Paper_data2/
├── data_figure/
│   ├── fig_4/
│   │   ├── data_em1d.mat
│   │   └── data_empymod.mat
│   │   └── plot_fig4.m
│   ├── fig5_7/
│   │   ├── data.mat
│   │   └── plot_fig5.m
│   │   └── plot_fig6.m
│   │   └── plot_fig7.m
│   ├── fig8_12/
│   │   ├── Obs.mat
│   │   └── results.mat
│   │   └── plot_fig8.m
│   │   └── plot_fig9_12.m
│   │   └── run_this_1.m
│   │   └── forwardmodel.m, em1d3.dll, em1d3.h
│   │   └── DREAM_Dir
│   ├── fig13_15/
│   │   ├── Obs.mat
│   │   └── results.mat
│   │   └── plot_fig13.m
│   │   └── plot_fig14_15.m
│   │   └── run_this_1.m
│   │   └── forwardmodel.m, em1d3.dll, em1d3.h
│   │   └── DREAM_Dir
├── README.md

The scripts were tested using: 
(1) MATLAB R2024 or later
(2) Visual Studio 2012
(3) Intel Visual Fortran Composer XE 2013

To reproduce the figures shown in the manuscript, run the MATLAB scripts from the root directory of the repository.

For fig8_12, 
(1) run plot_fig8.m to obtain fig8.png, 
(2) run run_this_1.m to obtain results.mat, 
(3) run plot_fig9_12.m to obtain fig9.png, fig10.png, fig11.png, fig12.png

For fig13_15, 
(1) run plot_fig13.m to obtain fig13.png, 
(2) run run_this_1.m to obtain results.mat, 
(3) run plot_fig14_15.m to obtain fig14.png, fig15.png

For questions about the data or scripts, please contact:  zhoujm@chd.edu.cn
