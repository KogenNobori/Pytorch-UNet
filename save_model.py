import wandb

#Specify the project name and run ID found in Run path. (username/project_name/run_id)
run = wandb.init(project='U-Net', id='89hv2h3e', resume='allow')
artifact = wandb.Artifact('oct5k', type='model', description="U-Net trained on OCT5k dataset for 10 epochs. Used images..1260, 348x348 ")

#Specify the path to the model checkpoint file that you want to upload
artifact.add_file('checkpoints/checkpoint_epoch10.pth') 

run.log_artifact(artifact)
run.finish()
