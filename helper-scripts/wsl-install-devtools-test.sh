vm_name=dev-"$(echo $RANDOM | tr '[0-9]' '[a-z]')"

multipass launch --name "$vm_name" --cpus $(nproc) -d 80g

multipass transfer ./wsl-install-devtools.sh "$vm_name":/home/ubuntu/wsl-install-devtools.sh
multipass exec "$vm_name" -- bash /home/ubuntu/wsl-install-devtools.sh