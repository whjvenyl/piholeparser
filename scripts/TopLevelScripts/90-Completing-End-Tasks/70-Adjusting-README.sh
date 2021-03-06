#!/bin/bash
# shellcheck disable=SC1090,SC2034,SC2154,SC2153

## Adjusting Readme.md

## Variables
SCRIPTDIRA=$(dirname $0)
source "$SCRIPTDIRA"/foldervars.sh

## Remove old
if [[ -f $MAINREPOREADMEMD ]]
then
  rm $MAINREPOREADMEMD
fi

## Replace with new
if [[ ! -f $MAINREPOREADMEMD ]]
then
  cp $MAINREPOREADMEMDDEFAULT $MAINREPOREADMEMD
fi

## Repository Name
if [[ -f $MAINREPOREADMEMD ]]
then
  sed -i "s/NAMEOFTHEREPOSITORY/$git_repo_name/g" $MAINREPOREADMEMD
fi

## Start Time
if [[ -n $STARTTIME ]]
then
  STARTTIMEMD="Script Started $STARTTIME"
else
  STARTTIMEMD="Error Setting Start Time."
fi
if [[ -f $MAINREPOREADMEMD ]]
then
  sed -i "s/LASTRUNSTART/$STARTTIMEMD/g" $MAINREPOREADMEMD
fi

## End Time
if [[ -n $ENDTIME ]]
then
  ENDTIMEMD="Script Ended $ENDTIME"
else
  STARTTIMEMD="Error Setting End Time."
fi
if [[ -f $MAINREPOREADMEMD ]]
then
  sed -i "s/LASTRUNSTOP/$ENDTIMEMD/g" $MAINREPOREADMEMD
fi

## Log Description
if [[ -n $TOTALRUNTIME && -n $HOWMANYSOURCELISTS && -n $MAINRECENTRUNLOGMDGIT ]]
then
  RECENTRUNMAINLINKA="Script Took $TOTALRUNTIME Minutes To Filter $HOWMANYSOURCELISTS Lists. See Log Here."
else
  RECENTRUNMAINLINKA="Error Calculating Script Run Time."
fi
if [[ -f $MAINREPOREADMEMD ]]
then
  sed -i "s/RECENTRUNMAINLINKA/$RECENTRUNMAINLINKA/g" $MAINREPOREADMEMD
  sed -i "s,RECENTRUNMAINLINKB,$MAINRECENTRUNLOGMDGIT,g" $MAINREPOREADMEMD
fi

## edited results
if [[ -n $EDITEDALLPARSEDSIZEMB && -n $EDITEDALLPARSEDHOWMANYLINES ]]
then
  EDITEDALLPARSEDMD="The Edited AllParsed File is $EDITEDALLPARSEDSIZEMB MB And Contains $EDITEDALLPARSEDHOWMANYLINES Domains."
else
  EDITEDALLPARSEDMD="Error Calculating Size of AllParsed File."
fi
if [[ -f $MAINREPOREADMEMD ]]
then
  sed -i "s/EDITEDALLPARSEDINFO/$EDITEDALLPARSEDMD/g" $MAINREPOREADMEMD
fi

## average parsing time
if [[ -n $AVERAGEPARSETIME && -n $AVERAGEPARSENUM && -n $AVERAGEPARSELINES ]]
then
  AVERAGELISTPARSINGTIMEMD="Average Parsing Of $AVERAGEPARSELINES lines in $AVERAGEPARSENUM BlackLists was $AVERAGEPARSETIME Seconds."
else
  AVERAGELISTPARSINGTIMEMD="Error Setting Average Parse Time."
fi
if [[ -f $MAINREPOREADMEMD ]]
then
  sed -i "s/AVERAGELISTPARSINGTIME/$AVERAGELISTPARSINGTIMEMD/g" $MAINREPOREADMEMD
fi

## TLD's
if [[ -n $HOWMANYTLDTOTAL && -n $HOWMANYTLDNEW ]]
then
  THEAMOUNTOFVALIDTLDSMD="$HOWMANYTLDTOTAL Valid Top Level Domains. $HOWMANYTLDNEW New TLD's."
else
  THEAMOUNTOFVALIDTLDSMD="Error Setting The Amount Of Valid TLD's."
fi
if [[ -f $MAINREPOREADMEMD ]]
then
  sed -i "s/THEAMOUNTOFVALIDTLDS/$THEAMOUNTOFVALIDTLDSMD/g" $MAINREPOREADMEMD
fi

## https
if [[ -n $RECENTRUNWITHOUTHTTPSMD && -n $HOWMANYLISTSWITHOUTHTTPS ]]
then
  LISTSWITHOUTHTTPSLOGA="$HOWMANYLISTSWITHOUTHTTPS Lists That Do NOT Use https"
else
  LISTSWITHOUTHTTPSLOGA="Error Setting https-less Link"
fi
if [[ -f $MAINREPOREADMEMD ]]
then
  sed -i "s/LISTSWITHOUTHTTPSLINKA/$LISTSWITHOUTHTTPSLOGA/g" $MAINREPOREADMEMD
  sed -i "s,LISTSWITHOUTHTTPSLINKB,$RECENTRUNWITHOUTHTTPSMD,g" $MAINREPOREADMEMD
fi

if [[ -n $COMBINEDBLACKLISTSGITRAW ]]
then
  BIGAPLMD="$COMBINEDBLACKLISTSGITRAW"
else
  BIGAPLMD="Error Setting Original List Link."
fi
if [[ -f $MAINREPOREADMEMD ]]
then
  sed -i "s,BIGAPLRAWLINK,$BIGAPLMD,g" $MAINREPOREADMEMD
fi

if [[ -n $COMBINEDBLACKLISTSDBBGITRAW ]]
then
  BIGAPLEMD="$COMBINEDBLACKLISTSDBBGITRAW"
else
  BIGAPLEMD="Error Setting Edited List Link."
fi
if [[ -f $MAINREPOREADMEMD ]]
then
  sed -i "s,BIGAPLERAWLINK,$BIGAPLEMD,g" $MAINREPOREADMEMD
fi

if [[ -n $INSTALLERSCRIPTRAW ]]
then
  INSTALLERMD="$INSTALLERSCRIPTRAW"
else
  INSTALLERMD="Error Setting Installer Link."
fi
if [[ -f $MAINREPOREADMEMD ]]
then
  sed -i "s,INSTALLERLINKRAW,$INSTALLERMD,g" $MAINREPOREADMEMD
fi
