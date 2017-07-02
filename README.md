# os-helpers
Helper scripts and instructions for grading OSU's CS 344

This documentation outlines my setup and protocols for grading assignments 1-5.
The assignments are graded on `os-class.engr.oregonstate.edu` or `eos-class.engr.oregonstate.edu`, the latter being for the eCampus version of the class.

## Directory Structure
The directory structure I would recommend using (and will use for all of the examples in this documentation) is as follows:

```
    user@os-class:~$ tree grading/
    grading/
    ├── assn1
    ├── assn2
    ├── assn3
    ├── assn4
    └── assn5

    5 directories
    user@os-class:~$ 
```

You can automatically generate this structure using the command

```sh
    for i in $(seq 1 5); do
        mkdir -p ~/grading/assn${i}
    done
```

## Downloading Submissions
You must now transfer the assignment submissions from Canvas to the grading computer; I recommend using SSHFS.
From your local machine:

```sh
    mkdir ~/engr-mount
    sshfs os-class.engr.oregonstate.edu:grading ~/engr-mount
```

You can then download the submissions from Canvas and save the zip as `~/engr-mount/assn${i}_submissions.zip`.
The temporary mount can now be unmounted:

```sh
    sudo umount ~/engr-mount
    rmdir ~/engr-mount
```

## Extracting Submissions
The submissions must then be extracted; this is performed on `os-class` as

```sh
    cd ~/grading/assn${i}/
    unzip ../../assn${i}_submissions.zip
```

Then, to organize submissions into folders:

```sh
    cd ~/grading/assn${i}
    for name in $(command ls | cut -d_ -f1); do
        mkdir "$name"
        mv "$name"_* "$name"/
    done
```

It is at this point I would recommend removing submissions that you do not need to grade.
This can be easily accomplished with `vidir` using a block delete (`Shift-V`, select, `d`).

If the submissions themselves have been zipped, you must unzip them.
You must use exactly this syntax for directory enumeration, as anything else is very error-prone and can ruin your directory structure.

```sh
    for dir in ~/grading/assn${i}/*; do
        cd $dir
        unzip *.zip
    done
```
