# SprayItForward
A shell script to generate a list of passwords to use in password sprays based on common season and year combinations.

## Setup
Clone the repo and cd into directory.
```shell
git clone https://github.com/flakpaket/SprayItForward.git
cd SprayItForward
```
Alternatively, you could use `curl` to get the latest version.
```shell
curl -O https://raw.githubusercontent.com/flakpaket/SprayItForward/refs/heads/main/sprayitfwd.sh
```

Give it execute permissions:
```shell
$ chmod +x sprayitfwd.sh
```

## Usage
```shell
$ ./sprayitfwd.sh 
Summer24
Summer2024
Summer24!
Summer2024!
Autumn24
Autumn2024
Autumn24!
Autumn2024!
Fall24
Fall2024
Fall24!
Fall2024!
```
# Potential improvements
- [X] Output list in order of likelihood
- [ ] Add parameters to customize the output
