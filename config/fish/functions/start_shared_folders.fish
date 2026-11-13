function start_shared_folders
    printf 'Starting shared folders...\n\n'
    sudo vmhgfs-fuse .host:/ /host_shared_folders/ -o allow_other,uid=1000,gid=1000
end
