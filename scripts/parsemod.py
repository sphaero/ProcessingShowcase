# alleen getest met deze mod maar zour redelijk universeel moeten zijn
# ref: http://www.aes.id.au/modformat.html
import sys

modfile = '/home/arnaud/Documents/HKU/skillslab/mods/anarchy_nef.mod'
if len(sys.argv) == 1:
    print("A python script that outputs every position and corresponding patternnumber of the provided mod file")
    sys.exit(0)
else:
    modfile = str(sys.argv[1])

f = open(modfile, 'rb')
b = f.read()
f.close()

p_songlength = 20 + 31*(22+2+1+1+2+2)
p_to_mk = p_songlength+1+129
p_pat_table = p_songlength + 2
# make sure we have the right format!
assert( b[p_to_mk:p_to_mk+4] == b'M.K.' )
### Print samplenames as they often contain messages
print("----sample-names-----")
for x in range(31):
    start_offset = 20+x*(22+2+1+1+2+2)
    samplename = b[start_offset:start_offset+22]
    try:
        print(samplename.decode())
    except Exception as e:
        print("ERR?: {}".format(samplename.decode('cp437')))

print("---------------------")

### Print song:pattern table
print("song positions {}".format(b[p_songlength]))
for x in range( int(b[p_songlength]) ):
	print("{}:{}".format(x, b[p_pat_table+x]))

sys.exit(0)

# this is some code that can create a modfile for every pattern
ln = 1
ba = bytearray(b)
# write songlen = 1
ba[p_songlength] = ln  #.to_bytes(1, 'big')
# create new file with pattern on position zero
for x in range(64):
	print("writing /tmp/pat{}.mod".format(x) )
	f = open('/tmp/pat{}.mod'.format(x), "wb")
	ba[p_pat_table] = x  #.to_bytes(1, 'big')
	f.write(bytes(ba))
	f.close()
