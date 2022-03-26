# CSE578 Data Visualization Final Project #
This repository includes the codebase for final project.

### (Option 1) Docker Container ###

The docker installation gives you a clean containerized Ubuntu 20.04 environment which you can run on Mac OS or any Unix based kernel.

1. Install Docker in your system if not already installed
2. Clone this repository and `cd CSE578Project`. 
3. Buid the docker image : `make build`.
4. Launch and enter the docker container: `make run`.
5. You are now inside a Ubuntu 20.04 Bash Shell with `$PWD: /home/CSE578`. `ls` to check files and folders.
6. To launch a Jupyter Notebook, run `jupyter notebook --ip 0.0.0.0 --no-browser --allow-root`.
7. Copy the localhost link and paste in your browser. Have Fun!!!

Note: to add any other supporting libraries, append the library name in the `requirements.txt` and repeat the above steps.

### (Option 2) Virtualenv/Anaconda ###

1. Install Anaconda.
2. Create python3.9 virtual environment
     ```bash
     conda create -n cse578 python=3.9
     ```

   - now activate env
   
     ```bash
     conda activate cse578
     ```
3. Clone this repository and `cd CSE578Project`. 

4. Install all the requirements 
   ```bash
     pip install -r requirements.txt
     ```
