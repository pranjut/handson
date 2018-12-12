# handson

GPU setup
1. Zone: southeast-asia
2. VM config:
  4 cpus, 15 gb RAM
  1 GPU
  OS: Ubuntu 16.04 , disk size: 50 GB
3. Checked
  Allow HTTP traffic
  Allow HTTPS traffic
4. Allow Premptive: On

6. Copy the sh script from ```startup_script.sh``` put in the startup script

7. Once the instance is up
  i. ssh into it
  ii. write ```ps aux | grep apt```
  iii. If process found wait for some time 
  iv. If all apt process are done clone this project
  v. Run the ```gpu_setup.sh``` script
  
 8. Go to the handson folder run the following
   ```sudo jupyter notebook --ip 0.0.0.0 --port 8888 --allow-root```
 
 9. Now access Jupyter through the external ip
 
Make sure firewall setup is as below to run it
1. Source ip: 0.0.0.0/0
2. tcp:888;udp:888
