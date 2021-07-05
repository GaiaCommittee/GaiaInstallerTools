#!/bin/bash

echo "Initializing priviledges for folders:"
echo "  /usr/local              +r +w"
echo "  /usr/local/bin          +r +w"
echo "  /usr/local/lib          +r +w"
echo "  /usr/local/include      +r +w"

sudo chmod o+rw /usr/local
sudo chmod o+rw /usr/local/bin
sudo chmod o+rw /usr/local/lib
sudo chmod o+rw /usr/local/include