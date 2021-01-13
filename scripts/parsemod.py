# alleen getest met deze mod maar zour redelijk universeel moeten zijn
# ref: http://www.aes.id.au/modformat.html
f = open('/home/arnaud/Documents/HKU/skillslab/mods/95house-mix-edit.mod', 'rb')
b = f.read()
f.close()

p_songlength = 20 + 31*(22+2+1+1+2+2)
p_to_mk = p_songlength+1+129
p_pat_table = p_songlength + 2
assert( b[p_to_mk:p_to_mk+4] == b'M.K.' )

print("song positions {}".format(b[p_songlength]))
for x in range(128):
	print("{}:{}".format(x, b[p_pat_table+x]))

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