### Mount a disk

Mount an external disk to ensure persistent storage of data (ex. logs) across instance recreations. 

Run the following command inside a created instance:

```
curl <PUBLIC_URL/mount-ext-disk.sh> | bash
```

Take a look at the `mount-ext-disk.sh` file for more details

Source: https://docs.aws.amazon.com/en_us/lightsail/latest/userguide/create-and-attach-additional-block-storage-disks-linux-unix.html
