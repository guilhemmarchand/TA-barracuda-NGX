#!/bin/bash

splunk-appinspect inspect `ls TA-barracuda-NGX_*.tgz | head -1` --mode precert --included-tags splunk_appinspect
