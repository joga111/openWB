#!/bin/bash
. openwb.conf


ladeleistung=$(<ramdisk/llaktuell)
llkwh=$(<ramdisk/llkwh)
if (( ladeleistung > 500 )); then
	if [ -e ramdisk/ladeustart ]; then
		ladelstart=$(<ramdisk/ladelstart)
		bishergeladen=$(echo "scale=3;($llkwh - $ladelstart)/1" |bc | sed 's/^\./0./')
		echo $bishergeladen > ramdisk/aktgeladen
		gelrlp1=$(echo "scale=3;$bishergeladen / $durchslp1 * 100" |bc)
		LANG=C printf "%.1f\n" $gelrlp1 > ramdisk/gelrlp1
	else
		touch ramdisk/ladeustart
		echo -e $(date +%d.%m.%y-%H:%M) > ramdisk/ladeustart
		echo -e $(date +%s) > ramdisk/ladeustarts
		echo $llkwh > ramdisk/ladelstart
	fi
else
	if [ -e ramdisk/ladeustart ]; then
		ladelstart=$(<ramdisk/ladelstart)
		ladeustarts=$(<ramdisk/ladeustarts)
		bishergeladen=$(echo "scale=3;($llkwh - $ladelstart)/1" |bc | sed 's/^\./0./')
		start=$(<ramdisk/ladeustart)
		jetzt=$(date +%d.%m.%y-%H:%M)
		jetzts=$(date +%s)
		ladedauer=$(((jetzts - ladeustarts) / 60 ))
		ladedauers=$((jetzts - ladeustarts))
		ladegeschw=$(echo "scale=3;$bishergeladen * 60 * 60 / $ladedauers" |bc)
		gelrlp1=$(echo "scale=3;$bishergeladen / $durchslp1 * 100" |bc)
		gelrlp1=$(LANG=C printf "%.1f\n" $gelrlp1)
#		if (( ladedauer > 60 )); then
#			ladedauer=$((ladedauer / 60))
#			laderest=$((ladedauer % 60))
#			sed -i '1i'$start,$jetzt,$gelrlp1,$bishergeladen,$ladegeschw,$ladedauer' H '$laderest' Min,1' web/ladelog
#		else
			sed -i '1i'$start,$jetzt,$gelrlp1,$bishergeladen,$ladegeschw,$ladedauer' Min,1 ' web/ladelog
#		fi
		rm ramdisk/ladeustart
	fi
fi

if (( lastmanagement == 1 )); then
ladeleistungs1=$(<ramdisk/llaktuells1)
llkwhs1=$(<ramdisk/llkwhs1)
if (( ladeleistungs1 > 500 )); then
	if [ -e ramdisk/ladeustarts1 ]; then
		ladelstarts1=$(<ramdisk/ladelstarts1)
		bishergeladens1=$(echo "scale=3;($llkwhs1 - $ladelstarts1)/1" |bc | sed 's/^\./0./')
		echo $bishergeladens1 > ramdisk/aktgeladens1
		gelrlp2=$(echo "scale=3;$bishergeladens1 / $durchslp2 * 100" |bc)
		LANG=C printf "%.1f\n" $gelrlp2 > ramdisk/gelrlp2
	else
		touch ramdisk/ladeustarts1
		echo -e $(date +%d.%m.%y-%H:%M) > ramdisk/ladeustarts1
		echo -e $(date +%s) > ramdisk/ladeustartss1
		echo $llkwhs1 > ramdisk/ladelstarts1
	fi
else
	if [ -e ramdisk/ladeustarts1 ]; then
		ladelstarts1=$(<ramdisk/ladelstarts1)
		ladeustartss1=$(<ramdisk/ladeustartss1)
		bishergeladens1=$(echo "scale=3;($llkwhs1 - $ladelstarts1)/1" |bc | sed 's/^\./0./')
		starts1=$(<ramdisk/ladeustarts1)
		jetzts1=$(date +%d.%m.%y-%H:%M)
		jetztss1=$(date +%s)
		ladedauers1=$(((jetztss1 - ladeustartss1) / 60 ))
		ladedauerss1=$((jetztss1 - ladeustartss1))
		ladegeschws1=$(echo "scale=3;$bishergeladens1 * 60 * 60 / $ladedauerss1" |bc)
		gelrlp2=$(echo "scale=3;$bishergeladens1 / $durchslp2 * 100" |bc)
		gelrlp2=$(LANG=C printf "%.1f\n" $gelrlp2)
		if (( ladedauers1 > 60 )); then
			ladedauers1=$((ladedauers1 / 60))
			laderests1=$((ladedauers1 % 60))
			sed -i '1i'$starts1,$jetzts1,$gelrlp2,$bishergeladens1,$ladegeschws1,$ladedauers1' H '$laderests1' Min,2' web/ladelog
		else
			sed -i '1i'$starts1,$jetzts1,$gelrlp2,$bishergeladens1,$ladegeschws1,$ladedauers1' Min,2 ' web/ladelog
		fi
		rm ramdisk/ladeustarts1
	fi
fi
fi

if (( lastmanagements2 == 1 )); then
ladeleistungs2=$(<ramdisk/llaktuells2)
llkwhs2=$(<ramdisk/llkwhs2)
if (( ladeleistungs2 > 500 )); then
	if [ -e ramdisk/ladeustarts2 ]; then
		ladelstarts2=$(<ramdisk/ladelstarts2)
		bishergeladens2=$(echo "scale=3;($llkwhs2 - $ladelstarts2)/1" |bc | sed 's/^\./0./')
		echo $bishergeladens2 > ramdisk/aktgeladens2
		gelrlp3=$(echo "scale=3;$bishergeladens2 / $durchslp3 * 100" |bc)
		LANG=C printf "%.1f\n" $gelrlp3 > ramdisk/gelrlp3

	else
		touch ramdisk/ladeustarts2
		echo -e $(date +%d.%m.%y-%H:%M) > ramdisk/ladeustarts2
		echo -e $(date +%s) > ramdisk/ladeustartss2
		echo $llkwhs2 > ramdisk/ladelstarts2
	fi
else
	if [ -e ramdisk/ladeustarts2 ]; then
		ladelstarts2=$(<ramdisk/ladelstarts2)
		ladeustartss2=$(<ramdisk/ladeustartss2)
		bishergeladens2=$(echo "scale=3;($llkwhs2 - $ladelstarts2)/1" |bc | sed 's/^\./0./')
		starts2=$(<ramdisk/ladeustarts2)
		jetzts2=$(date +%d.%m.%y-%H:%M)
		jetztss2=$(date +%s)
		ladedauers2=$(((jetztss2 - ladeustartss2) / 60 ))
		ladedauerss2=$((jetztss2 - ladeustartss2))
		ladegeschws2=$(echo "scale=3;$bishergeladens2 * 60 * 60 / $ladedauerss2" |bc)
		gelrlp3=$(echo "scale=3;$bishergeladens2 / $durchslp3 * 100" |bc)
		gelrlp3=$(LANG=C printf "%.1f\n" $gelrlp3)

		if (( ladedauers2 > 60 )); then
			ladedauers2=$((ladedauers2 / 60))
			laderests2=$((ladedauers2 % 60))
			sed -i '1i'$starts2,$jetzts2,$gelrlp3,$bishergeladens2,$ladegeschws2,$ladedauers2' H '$laderests2' Min,3' web/ladelog
		else
			sed -i '1i'$starts2,$jetzts2,$gelrlp3,$bishergeladens2,$ladegeschws2,$ladedauers2' Min,3 ' web/ladelog
		fi
		rm ramdisk/ladeustarts2
	fi
fi
fi

