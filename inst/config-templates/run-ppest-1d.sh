#!/bin/sh
#================================================================================
# File:        run    
# Created:     2012-02-20
# Last Change: Monday, 2012-05-21
# Description: Runs basement with pre- and postprocessing
# Author:      Michel Kuhlmann (kum), <kum@tkconsult.ch>
# Institution: TK Consult AG
# Copyright:   GNU General Public Licence 
#================================================================================

CASE=__case__
asf='%40s'
adf="%10s\n"
ads='[done]' 

printf $asf "Setting friction values..."
setFriction -f friction-conf.yaml ../../../css/sihl.yaml > ${CASE}.bmg
printf $adf $ads

printf $asf "Running basement..."
basement -b -f ../${CASE}.bmc > /dev/null
printf $adf $ads

printf $asf "Interpolating on observation points..."
interpolateObs -f ../.intObs-conf.yaml
printf $adf $ads

# End of File ===================================================================
# vim: set ft=sh:
