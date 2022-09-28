from msaFilesystem.msafs import MSAFilesystem
from fs.walk import Walker

# FS URLs are formatted in the following way:
# <protocol>://<username>:<password>@<resource>

myFS = MSAFilesystem(fs_url='osfs://~/projects')

walker = Walker(filter=['*.py'])
for path in walker.files(myFS.fs):
    print(path)
