#!/bin/bash

# TODO: make lists of inputs/outputs and run it with single python predict.py. This might be a lot faster.
# TODO: perhaps I can add mkdir in this script as well.

classes=(AMD CNV CSR DME DRUSEN ERM RAO VID)

input_root_folder=/home/kn445/rds/hpc-work/ml-oct/datasets/clas_dataset/kaggle_output/combined3_split_rgb_jpeg_predicted_NORMAL/ #input the folder name for input images
output_root_folder=eval_outputs/false_NORMAL/ # input the output folder path

c=0

for class in ${classes[@]}
do
  input_folder=${input_root_folder}${class}/
  output_folder=${output_root_folder}${class}/
  for file_path in ${input_folder}*
  do
    filename=${file_path##*/}
    filename_without_extension=${filename%.*}
    extension=${filename##*.}
    # echo $filename
    # echo $filename_without_extension
    # echo $extension
    # echo "${FILE%.*}_out.png"

    # for check
    # echo "input: ${file_path}"
    # echo "output: ${output_folder}${filename_without_extension}_out.${extension}"

    python predict.py --classes 6 -i ${file_path}  -o ${output_folder}${filename_without_extension}_out.${extension}   -m checkpoints/checkpoint_epoch10.pth
    c=$((c+1))
  done
done

echo "processed ${c} images!"