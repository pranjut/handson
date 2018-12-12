# handson

GPU setup
1. Zone: southeast-asia
2. VM config:</br>
  4 cpus, 15 gb RAM</br>
  1 GPU</br>
  OS: Ubuntu 16.04 , disk size: 50 GB</br>
3. Checked</br>
  Allow HTTP traffic</br>
  Allow HTTPS traffic</br>
4. Allow Premptive: On

6. Copy the sh script from ```startup_script.sh``` put in the startup script

7. Once the instance is up</br>
  i. ssh into it</br>
  ii. write ```ps aux | grep apt```</br>
  iii. If process found wait for some time</br> 
  iv. If all apt process are done clone this project</br>
  v. Run the ```gpu_setup.sh``` script
  
 8. Go to the handson folder run the following</br>
   $ ```sudo jupyter notebook --ip 0.0.0.0 --port 8888 --allow-root```
 
 9. Now access Jupyter through the external ip
 
Make sure firewall setup is as below to run it</br>
1. Source ip: 0.0.0.0/0</br>
2. tcp:888;udp:888
