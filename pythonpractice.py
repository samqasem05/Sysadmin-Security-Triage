import requests 
from requests import Response
import psutil
import subprocess
import time

info: Response = requests.get("https://api.github.com")
print(info)

cpu = psutil.cpu_percent(interval=1)
if cpu > 15:
    print(f"CPU is high {cpu}%")
else:
    print(f"CPU is chill {cpu}%")


memory = psutil.virtual_memory()
print(f"free memory is {memory.free}")
print(f"used memory is {memory.used}")
print(f"memory percent is {memory.percent}")

process_list = list()

for process in psutil.process_iter():
        process_list.append(process.name())
        print(process_list)
        time.sleep(2)
        if(process_list == 'Setup-stable-e4c7e7b1d6d060162f4aa7f8225271b67ce1df75.tmp'):
             print("samanlo")
             result = subprocess.run(f"taskkill /f /im {'Setup-stable-e4c7e7b1d6d060162f4aa7f8225271b67ce1df75.tmp'}")
qs