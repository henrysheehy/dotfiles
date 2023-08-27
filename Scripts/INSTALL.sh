#!/bin/sh

yay -S $(cat $HOME/.packages)

pip install $(cat $HOME/.pip)
