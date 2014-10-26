# Arch on MacBook Air 2014
How to install Arch Linux side-by-side with OS X on a MacBook Air 2014.

I used a **MacBook Air** [13" A1466 (6,2)](https://en.wikipedia.org/wiki/MacBook_Air#Specifications) **Early 2014**, a **USB stick** (64 GB), and the **Internet**.

##Links
- https://bbs.archlinux.org/viewtopic.php?pid=1295212

##FAQ
- **Is it difficult?**
  - If you follow instructions, no.
- **How is battery life?**
  - Good.
- **Why install Arch on a MacBook?**
  - `dwm`, `pacman`, [16:10](https://en.wikipedia.org/wiki/16:10), and all-day battery life come to mind.
- **I read somewhere that Apple highly recommends not installing Linux.**
  - [FUD](https://en.wikipedia.org/wiki/Fear,_uncertainty_and_doubt).

## Overview
Before you begin, **Update** OS X, **reboot**, and make sure there are no more updates. Then, open `Disk Utility` and **resize** your OS X partition to make room for Arch.

1. [Create custom .iso](#1-create-custom-iso) _(only if you don't want to tether your phone or buy an Ethernet adapter)_
2. [Boot custom .iso](#2-boot-custom-iso)
3. [Install Arch](#3-install-arch)
4. [Post-installation](#4-post-installation)

1. Create custom .iso
---------------------
>If you are lazy, you can [download]() mine and skip to [section 2](#2-boot-custom-iso).

The standard Arch .iso does not contain the the [broadcom-wl](https://aur.archlinux.org/packages/broadcom-wl) AUR package needed for MacBook Air's Broadcom NNNN Network card to work. Normally you would download it, but without a working network card, you can't. Alternatively, you can connect to the Internet by tethering your phone, or with a USB-Ethernet adapter.

### Boot into Arch
To create a custom Arch .iso with the Broadcom WiFi driver on it, you need an Arch machine. You can use either: **another Arch machine**, a **Live USB/Live CD**, or **VirtualBox** like I did.

    mkdir ~/archlive

Download `broadcom-wl-dkms` from AUR. You will install them manually later.
> `broadcom-wl` will work too, but kernel updates will break it.

    wget https://aur.archlinux.org/packages/br/broadcom-wl-dkms/broadcom-wl-dkms.tar.gz

Generate the custom .iso.
    
    mkdir ~/archlive
    cp -r /usr/share/archiso/configs/releng/ ~/archlive
    echo -e "vim-minimal\nranger\nlinux-headers" >> ~/archlive/packages.both
    ./build.sh -v

Send the .iso to you OS X machine. You can use:

- Another USB stick
- Internet (SSH/Upload/Email)
- Shared folders in VirtualBox _(like I did)_

### Back in OS X
Find out your FILE.iso and rdisk[NUMBER], Convert .iso to .img.dmg, and Rename .img.dmg to .iso

    diskutil list
    hdiutil convert -format UDRW -o FILE.img FILE.iso
    mv FILE.img.dmg FILE.img
    
Then, unmount (don't eject) its partitions, and "burn" the .img to USB:

    sudo dd if=./Desktop/archlive_shared/FILE.img of=/dev/DISK bs=1m
    
After ~30 seconds, OS X should tell you that the USB stick is not readable. That's OK.


2. Boot custom .iso
-------------------
Plug the USB stick you just formatted into your MacBook, and boot it while holding the left **alt**/**option** key. Select it and press **enter**.

###Connect to the Internet
Install `broadcom-wl-dkms` from AUR. `broadcom-wl` will work too, but kernel updates will break it.

Make sure that `b43` and `ssb` modules are not present in the output of `lsmod`

    pacman -U Broad<TAB>
    sudo pacman -S dkms
    sudo systemctl enable dkms.service


3. Install Arch
---------------

4. Post-installation
--------------------

---

#### Images

An inline image ![Smaller icon](http://smallerapp.com/favicon.ico "Title here"), title is optional.

A ![Resize icon][2] reference style image.

[2]: http://resizesafari.com/favicon.ico "Title"

#### Inline code and Block code

Inline code are surround by `backtick` key. To create a block code:

    Indent each line by at least 1 tab, or 4 spaces.
    var Mou = exactlyTheAppIwant; 


#### Horizontal Rules

Three or more asterisks or dashes:

***

---

- - - -

#### Headers

Setext-style:

This is H1
==========

This is H2
----------


### Extra Syntax

#### Footnotes

Footnotes work mostly like reference-style links. A footnote is made of two things: a marker in the text that will become a superscript number; a footnote definition that will be placed in a list of footnotes at the end of the document. A footnote looks like this:

That's some text with a footnote.[^1]

[^1]: And that's the footnote.


#### Strikethrough

Wrap with 2 tilde characters:

~~Strikethrough~~


#### Fenced Code Blocks

Start with a line containing 3 or more backticks, and ends with the first line with the same number of backticks:

```
Fenced code blocks are like Stardard Markdown’s regular code
blocks, except that they’re not indented and instead rely on
a start and end fence lines to delimit the code block.
```

#### Tables

A simple table looks like this:

First Header | Second Header | Third Header
------------ | ------------- | ------------
Content Cell | Content Cell  | Content Cell
Content Cell | Content Cell  | Content Cell

If you wish, you can add a leading and tailing pipe to each line of the table:

| First Header | Second Header | Third Header |
| ------------ | ------------- | ------------ |
| Content Cell | Content Cell  | Content Cell |
| Content Cell | Content Cell  | Content Cell |

Specify alignement for each column by adding colons to separator lines:

First Header | Second Header | Third Header
:----------- | :-----------: | -----------:
Left         | Center        | Right
Left         | Center        | Right
