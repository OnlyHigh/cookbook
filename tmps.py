import os

walk_dir = './TMP'
print('walk_dir (absolute) = ' + os.path.abspath(walk_dir))
walk_dir = os.path.abspath(walk_dir)
reads = os.path.join(walk_dir, 'reads')

try:
	os.makedirs(reads)
except OSError:
	if not os.path.isdir(reads):
		raise

for root, subfolders, files in os.walk(walk_dir):
	print('--\nroot = ' + root)
	for file in files:
		if file.endswith(".fast5.tmp"):
		print(file)
		os.rename(os.path.join(root, file),os.path.join(reads, file[:-4]))
	if root != reads:
		try:
		os.rmdir(root)
		except OSError:
		print('No se puede borrar')
