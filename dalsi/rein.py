import argparse
import time

from ArubaCloud.PyArubaAPI import CloudInterface
from ArubaCloud.objects.VmTypes import *
from ArubaCloud.base.vm import *

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-p', '--pattern', help='Specify pattern to search.', action='store', dest='pattern')
    p = parser.parse_args()

    i = CloudInterface(dc=3)
    i.login(username="FCZ-67278", password="zVmbe448#z", load=True)
    for vm in i.get_vm(pattern=p.pattern):
        print('Reinitialize: %s' % vm.vm_name)
        if vm.status == 3:
            vm.poweroff()
        while len(i.get_jobs()['Value']) > 0:
            time.sleep(1)
        vm.reinitialize(admin_password="Forps-123;", OSTemplateID="406")

