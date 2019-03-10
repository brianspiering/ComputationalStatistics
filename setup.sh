#!/bin/bash

# Before running this script, install miniconda or anaconda with Python 3.7
# https://conda.io/docs/user-guide/install/macos.html

# After installing either miniconda or anaconda, open a new terminal code so conda is on the path
# Must cd into this directory to run this script successfully

# Setup the environment for the classroom. TeachOps FTW!
set -e # Exit immediately if a command exits with a non-zero status
set -x # Exit immediately if a pipeline exits with a non-zero status

# Name of environment is from environment.yml
envname=$(sed '1!d' environment.yml | sed 's/^.* //')

# Create environment based on environment.yml in the same directory
conda update -n base conda -y 
conda env create -n $envname --force 

# Start environment
source activate $envname

# Update during development; Pin right before teaching
conda update --all --yes 

# Enable extensions
jupyter contrib nbextension install --user
jupyter nbextension enable spellchecker/main
jupyter nbextension enable codefolding/main
jupyter nbextension install rise --py --sys-prefix
jupyter nbextension enable rise --py --sys-prefix
