#==============================================================================
#  Date       Vers  Who  Description
# -----------------------------------------------------------------------------
# 23-Mar-25  1.0.0  DWW  Initial Creation
#==============================================================================
RDMX_NIC_API_VERSION=1.0.0


#==============================================================================
# AXI register definitions
#==============================================================================
BASE_ADDR=0x1000
REG_PACKET_COUNT_H=$((BASE_ADDR +  0 * 4))
REG_PACKET_COUNT_L=$((BASE_ADDR +  1 * 4))
     REG_HWMARK_0H=$((BASE_ADDR +  2 * 4))
     REG_HWMARK_0L=$((BASE_ADDR +  3 * 4))
     REG_HWMARK_1H=$((BASE_ADDR +  4 * 4))
     REG_HWMARK_1L=$((BASE_ADDR +  5 * 4))
     REG_PCI_MIN_H=$((BASE_ADDR +  6 * 4))
     REG_PCI_MIN_L=$((BASE_ADDR +  7 * 4))
     REG_PCI_MAX_H=$((BASE_ADDR +  8 * 4))
     REG_PCI_MAX_L=$((BASE_ADDR +  9 * 4))
      REG_LOOPBACK=$((BASE_ADDR + 10 * 4))
        REG_ERRORS=$((BASE_ADDR + 11 * 4))
         REG_RESET=$((BASE_ADDR + 12 * 4))
REG_GOOD_PACKETS_H=$((BASE_ADDR + 13 * 4))
REG_GOOD_PACKETS_L=$((BASE_ADDR + 14 * 4))
 REG_BAD_PACKETS_H=$((BASE_ADDR + 15 * 4))
 REG_BAD_PACKETS_L=$((BASE_ADDR + 16 * 4))
        REG_STATUS=$((BASE_ADDR + 17 * 4))
     REG_PAUSE_PCI=$((BASE_ADDR + 18 * 4))
#==============================================================================

#==============================================================================
# This strips underscores from a string and converts it to decimal
#==============================================================================
strip_underscores()
{
    local stripped=$(echo $1 | sed 's/_//g')
    echo $((stripped))
}
#==============================================================================


#==============================================================================
# Displays the version of the RTL bitstream
#==============================================================================
get_rtl_version()
{
    local major=$(pcireg -dec 0)
    local minor=$(pcireg -dec 4)
    local revis=$(pcireg -dec 8)
    echo ${major}.${minor}.${revis}
}
#==============================================================================


#==============================================================================
# This resets all counters, interfaces, and modules
#==============================================================================
reset()
{
    pcireg $REG_RESET 1
    while [ $(pcireg -dec $REG_RESET) -ne 0 ]; do
        sleep .01
    done

    # Ensure everything has had time to come out of reset
    sleep .01
}
#==============================================================================


#==============================================================================
# This resets all counters, interfaces, and modules
#==============================================================================
generate()
{
   local value=$1

    # Does the user just want to display the generating status?
    if [ "$value" == "" ]; then
        pcireg -wide -dec $REG_PACKET_COUNT_H
        return
    fi

    # Ensure the value provided by the user is between 0 and 31
    if [ $((value)) -lt 1 ];  then
        echo "Invalid value [$value] on generate" 1>&2
        return
    fi

    # Tell the FPGA to start generating packets
    pcireg -wide $REG_PACKET_COUNT_H $value

}
#==============================================================================


#==============================================================================
# Displays the number of properly formed packets that have been received
#==============================================================================
good_packets()
{
    pcireg -wide -dec $REG_GOOD_PACKETS_H
}
#==============================================================================



#==============================================================================
# Displays the number of improperly formed packets that have been received
#==============================================================================
bad_packets()
{
    pcireg -wide -dec $REG_BAD_PACKETS_H
}
#==============================================================================



#==============================================================================
# Displays the DDR RAM usage "high-water mark"
#==============================================================================
high_water()
{
    local channel=$1

    local hwm0=$(pcireg -dec -wide $REG_HWMARK_0H)
    local hwm1=$(pcireg -dec -wide $REG_HWMARK_1H)

    if [ "$channel" == "" ]; then
        echo $hwm0 $hwm1 
        return
    fi

    if [ $channel -eq 0 ]; then
        echo $hwm0 
        return
    fi

    if [ $channel -eq 1 ]; then
        echo $hwm1 
        return
    fi

    echo "Invalid parameter [$1] on high-water" 1>&2
}
#==============================================================================



#==============================================================================
# Sets or displays the loopback mode.
#
#   0 = Packets will not be looped back to QSFP
#   1 = Packets will be looped back to QSFP
#==============================================================================
loopback()
{
    local state=$1

    if [ "$state" == "" ]; then
        pcireg -dec $REG_LOOPBACK
        return
    fi

    if [ "$state" == "1" ] || [ "$state" == "on" ]; then
        pcireg -dec $REG_LOOPBACK 1
        return
    fi

    if [ "$state" == "0" ] || [ "$state" == "off" ]; then
        pcireg -dec $REG_LOOPBACK 0
        return
    fi

    echo "Invalid parameter [$1] on loopback" 1>&2
}
#==============================================================================


#==============================================================================
# Sets or displays the valid range of PCI address where RDMX packets can 
# be written
#==============================================================================
pci_range()
{
    local min_addr=$1
    local max_addr=$2

    if [ -z $min_addr ] || [ -z $max_addr ]; then
        min_addr=$(pcireg -dec -wide $REG_PCI_MIN_H)
        max_addr=$(pcireg -dec -wide $REG_PCI_MAX_H)
        printf "0x%lX 0x%lX\n" $min_addr $max_addr
        return
    fi

    min_addr=$(strip_underscores $min_addr)
    max_addr=$(strip_underscores $max_addr)

    if [ $min_addr -ge $max_addr ]; then
        echo "Min and max are reversed on pci_range" 1>&2
        return
    fi

    pcireg -wide $REG_PCI_MIN_H $min_addr
    pcireg -wide $REG_PCI_MAX_H $max_addr

}
#==============================================================================


#==============================================================================
# Displays the error bits
#==============================================================================
errors()
{
    pcireg -dec $REG_ERRORS
}
#==============================================================================


#==============================================================================
# Displays the status bits
#==============================================================================
status()
{
    pcireg -dec $REG_STATUS
}
#==============================================================================


#==============================================================================
# Pauses PCI output for a specified number of microseconds
#==============================================================================
pause_pci()
{
    local usec=$1

    if [ -z $usec ]; then
        pcireg -dec $REG_PAUSE_PCI
        return
    fi

    pcireg $REG_PAUSE_PCI $((usec * 250))
}
#==============================================================================