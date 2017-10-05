#!/bin/bash

cd 01_ubuntu_base/image
docker build -t local/ubuntu_16_04_base .
cd ../../02_virtualgl
#cd 02_virtualgl
docker build -t local/turbo_base .
#cd ../03_1_paraview
#docker build -t local/paraview .
#cd ../03_2_visit
#docker build -t local/visit .
#cd ../03_3_mayavi2
#docker build -t local/mayavi2 .
#cd ../03_4_spss
#docker build -t local/spss24 .
#cd 03_visualization
cd ../03_visualization
docker build -t local/visualization .
cd ../03_statistics_and_calculation
docker build -t local/statistics_calculation .
cd ..

