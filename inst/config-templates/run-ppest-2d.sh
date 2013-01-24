#!/bin/sh
#================================================================================
# File:        run    
# Last Change: Monday, 2012-05-21
# Description: Runs basement with postprocessing
# Author:      Michel Kuhlmann (kum), <kum@tkconsult.ch>
# Institution: TK Consult AG
# Copyright:   GNU General Public Licence 
#================================================================================

CASE=__case__
asf='%40s'
adf="%10s\n"
ads='[done]' 

printf $asf "Running basement..."
basement -b -f ../${CASE}.bmc > /dev/null
printf $adf $ads

printf $asf "Interpolating on observation points..."
getBasePlaneResids -f ../.getResids-conf.yaml
printf $adf $ads

# End of File ===================================================================
# vim: set ft=sh:
