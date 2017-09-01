from sys import argv

''' have this open up check_these_ips and store them into ips for further checking '''
''' clear the check_these after storing and block_these as well '''
''' need to add ipchains to the block_these '''
''' maybe report check_these with whois '''

def getFileHandle(filename):

    print "Filename type: %s" % type(filename)
    return open(filename, "r")


def parseFile(fileHandle):

    contents = []

    codes = ['400', '401', '402', '403', '404', '405', '406'
            '407', '408', '409', '410', '411', '412', '413',
            '414', '415', '416', '417']


    for row in fileHandle:
        for code in codes:
            if code in row:
                print row
                contents.append(row.split(' ')[0])
                break # just one code

    return contents

def removeKnown(knownIP, logFile):

    knownIP = set(knownIP)
    possibleThreats = []
    print "Known IPS: %s" % knownIP

    for row in logFile:
        if row[0] not in knownIP:
            print "POTENTIAL THREAT"
            print "%s %s %s" % (row[0], row[7], row[8])
            possibleThreats.append(row[0])

    return possibleThreats

def storeIPs(ip_addresses):

    # remove duplicates
    print "RECEIVED THESE IPS"
    print ip_addresses

    check_these = [] # possible malicious ips
    block_these = [] # def malicious ips

    check_file = open("check_these_ips.log", "w+")
    block_file = open("block_these_ips.log", "w+")

    ips = []

    for ip in ip_addresses:
        if ip in ips:
            # do not want duplicates, but also prevent else statement
            if ip not in block_these:
                block_these.append(ip)
        else:
            check_these.append(ip)
            ips.append(ip)

    for ip in block_these:
        if ip in check_these:
            check_these.remove(ip)

    print "CHECK THESE IPS"
    print check_these
    print "BLOCK THESE IPS"
    print block_these

    for ip in check_these:
        check_file.write(ip)
        check_file.write('\n')
    for ip in block_these:
        block_file.write(ip)
        block_file.write('\n')



    check_file.close()
    block_file.close()



def startParse(filename, knownIPs):

    fileH = getFileHandle(filename)
    parsedFile = parseFile(fileH)
    print "parsedFile type: %s" % type(parsedFile)
    storeIPs(parsedFile)
    fileH.close()

if __name__ == '__main__':
    print "Args given (expecting filename, and known ips): %s" % argv
    if len(argv) < 2:
        print "Incorrect args"
        exit(1)
    elif len(argv) is 2:
        ips = ["73.66.168.46"]
        startParse(argv[1], ips)
    else:
        startParse(argv[1], argv[2:])

