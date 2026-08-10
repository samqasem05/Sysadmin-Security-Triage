#this script will will Scans a workstation’s uptime, available disk space, network connectivity, 
# pending OS updates, and running antivirus services. 
# Generates a quick HTML or JSON status report for IT tickets before deploying to an employee.

import datetime
import psutil
import shutil
import socket

boot = psutil.boot_time()

time = datetime.datetime.fromtimestamp(boot)

uptime = datetime.datetime.now() - time
print(f'current time {time} uptime {uptime}')


path = "C:/"
available_disk = shutil.disk_usage(path)
print("Storage Info...")
print(f"Free: {available_disk.free // (2**30)} GiB")
print(f"Total: {available_disk.total // (2**30)} GiB")
print(f"Used: {available_disk.used // (2**30)} GiB")

def check_network_connectivity():
    try:
        socket.create_connection(("8.8.8.8", 53), timeout=3)
        return "connected (Internet On)"
    except OSError:
        return "Disconnected"

network_status = check_network_connectivity()
print(f"Networkinfo: {network_status}")


def top_process():
    try:
        print("this is kinda hard bro, not kinda hella")
        process_list = []

        for proc in psutil.process_iter(['pid', 'name']):
            process_list.append(proc.info)

        return process_list
    except OSError:
        print("oops")
        return[]

top = top_process()
print(f"Heres the top current processes... {top[:5]}")
