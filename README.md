# C2Blocker
Block malwares C2 in network

# About :
In the discussion of network security, one of the parameters that is important and prevents users from getting infected is to be able to recognize the addresses of malware servers and limit the connection of each of our internal network nodes with those infected servers. In this case, if the user system in the network gets infected with this type of malware, because the malware cannot communicate with its own command center, it can be a solution to prevent the execution of malware in the network, and doing other prevention jobs and in the next step other security teams can detect the infected file. and take the next and required actions. Due to the fact that the servers of the malware control center are constantly increasing, so the implemented solution must be constantly updated. We can implement existing solutions on the network firewall (for example, pfSense). Since I like coding tools, I decided to code a tool for this purpose. This tool can be run as a service in Linux systems and also constantly updates itself so that it can add servers related to the malware command center to its list.

# Tested on :
Linux based operation systems

# ScreenShot :
![ScreenShot](https://raw.githubusercontent.com/ksrvco/C2Blocker/main/C2Blocker-ScreenShot.jpg)

Enjoy :)
