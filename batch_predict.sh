#!/bin/bash

# TODO: make lists of inputs/outputs and run it with single python predict.py. This might be a lot faster.

input_folder=test_images/ # input the folder name for input images
output_folder=eval_outputs/test_outputs/ # input the output folder path

for file_path in ${input_folder}*
do
  filename=${file_path##*/}
  filename_without_extension=${filename%.*}
  extension=${filename##*.}
  # echo $filename
  # echo $filename_without_extension
  # echo $extension
  # echo "${FILE%.*}_out.png"
  python predict.py --classes 6 -i ${file_path}  -o ${output_folder}${filename_without_extension}_out.${extension}   -m checkpoints/checkpoint_epoch10.pth
  
done