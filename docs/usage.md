# msaFilesystem

Agnostic Abstract Filesystem API which allows to use S3, GCS, Azure Datalake, your local FS, Youtube etc.

The interface simplifies most aspects of working with files and directories in different storage and file systems.

The abstraction offered by msaFilesystem objects means that you can write code that is agnostic to where your files are physically located. 
For instance, if you wrote a function that searches a directory for duplicates files, it will work unaltered with a directory on your hard-drive, or in a zip file, on an FTP server, on Amazon S3, etc.

As long as an msaFilesystem object exists for your chosen filesystem (or any data store that resembles a filesystem), you can use the same API. 
This means that you can defer the decision regarding where you store data to later. 
If you decide to store configuration in the cloud, it could be a single line change and not a major refactor.

PyFilesystem can also be beneficial for unit-testing; by swapping the OS filesystem with an in-memory filesystem, you can write tests without having to manage (or mock) file IO. And you can be sure that your code will work on Linux, MacOS, and Windows.



## Usage

Once you have an instance of msaFilesystem, just use it the following way:

```python
from msaFilesystem.msafs import MSAFilesystem
from fs.walk import Walker

# FS URLs are formatted in the following way:
# <protocol>://<username>:<password>@<resource>

myFS = MSAFilesystem(fs_url='osfs://~/projects')

walker = Walker(filter=['*.py'])
for path in walker.files(myFS.fs):
    print(path)
```

