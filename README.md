custom_tmsu
===========

A custom modification for tmsu file tagging command line utility, written in bash, based on fzf fuzzy finder which helps user select tags.


Whenever a tmsu command needs to select tags, which will usually be at the end of the command, this script will use fzf to help user select the tags. When there is no need to select tags then this script is same as original tmsu

Usage
--------

If original usage is
```bash
  $ tmsu tag file_name tag1 tag2 tag3
```
this script should be run as
```bash
  $ this_script tag file_name
```
And then fzf interface will ask to select the already available tags one
after other. Once all required tags are selected press `Esc` or `Ctrl-C` in fzf
interface which will close fzf and run the following
```bash
  $ tmsu tag file_name fzf_selections1 fzf_selections2 fzf_selections3
```

Note that all the initial arguments given to this script will be used in same order as arguments while running tmsu. Weather the fzf_selections are valid or new tags need to be created or more arguments are given, tmsu will do the needful as it would originally (even errors).

This script can replace your original tmsu and care is taken that it doesn't break any of your previous scripts. For example if the following command is entered, fzf interface will pop-up and ask user to select tags.
```bash
  $ this_script tag file_name
```
If a tag is already is given like
```bash
  $ this_script tag file_name tag1
```
then no changes are in effect and original tmsu is run. Originally if a tag is not given in the above command, you get an error, but now you will be asked to select one.
But if any other options are used (having '-') like
```bash
  $ tmsu tag --tags="landscape" field1.jpg field2.jpg
```
then original is run.

For files option default will be run only for the following command
```bash
  $ this_script files -fzf
```
with anything other than the '-fzf' option the default tmsu will be run.

The behavior will be different only for the following arguments where tag/tags need to be selected:
- files
- merge
- tag
- untag
- copy
- delete
- rename



Binary
------

At the end of this script, original tmsu binary is appended so that this script can work standalone. So will have to be careful with using the correct binary. To change the binary, edit this script by deleting all lines below the line saying '\_\_PAYLOAD\_BEGIN\_\_' and append the script with correct binary as below
```bash
  $ cat orignial_tmsu_binary >> this_script
```
