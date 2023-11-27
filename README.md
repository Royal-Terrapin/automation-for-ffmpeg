# automation-for-ffmpeg
The goal of this project is to provide a script that makes ffmpeg easier to use for CD ripping.
This tool is designed for Linux and requires ffmpeg.

Ripping CDs manually is an unnecessarily repetitive task. Copying the files, converting from wav to mp3, and typing in metadata takes far too long.
Automated CD ripping is easy enough with proprietary tools, but I wanted to do it with ffmpeg.

rip-CD.sh is a bash script containing variables and commands that, when properly configured, will perform this process for you seamlessly.
By modifying the variables, you can customize your input device, output location, and output format, as well as adding all of the media metadata to each file individually.

The script is commented with instructions. To use it, open with a text editor, set the variables, save it, and run it as a program. Make sure it's marked executable. It shouldn't need sudo.

Questions, bug reports, feature requests, and contributions from Linux users of all skill levels are welcome.
I am developing on Ubuntu 22.04 (Jammy)
This project is not supported on Windows, Mac OS, or any other OS besides Linux.

Dependencies:
ffmpeg
