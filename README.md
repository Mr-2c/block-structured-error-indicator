# block-structured-error-indicator
MATLAB codes for computing LES error indicators on Cartesian block structured grids (mostly from OpenFOAM)

The main file is OF_BFS_v920b4.m which reads the snapshots, computes some mean fields, and error indicators
The case related variables are found in case_* files, includeing directories, file names, etc.

Unfortunately, the process is not streamlined. After running the openFOAM simulation you will need to:
1. reconstruct the parallel fields using openfoam to have a single file
2. read them in paraview and save as CSV at the CELL CENTERS. makes sure to use cell center values since vortex values interpolate from cell centers.
3. read the CSV files and save them in a custom binary format
4. set up the case in the case_* files using the available templates.
5. Only then you can use OF_BFS_v920b4.m to compute the quantities. the code is commented to describe what every variable means. The error indicators are named An_* (for the A(n) from Computers & Fluid 2017), AnSF_* (for the A'(n) from Computers & Fluid 2017), and Gn* (for different versions of G(x,n) from Computers & Fluid 2020 including Smagorinsky, Vreman, and without SGS models).
6. Once the error indicators are camputed you can find the refinement fields by solving the problem indicator*volume=const. where the const. value is found to give a certain number of cells.
7. There are additional MATLAB scripts to do that, such as twoGridAdaptationProblem_v270b1.m (not here yet).
