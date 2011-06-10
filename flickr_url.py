#!/usr/bin/python

import appscript
import re
import sys
from urllib import urlopen

# The basic URL format for photos.
baseURL = 'http://www.flickr.com/photos/%s/%s/'

# The regex for extracting user and photo info.
infoRE = r'flickr\.com/photos/(.*)/(\d+)/?'

# The various image URL suffixes.
suffixes = {'master': '_m.jpg',
            'original':    '_o_d.jpg',
            'large':   '_b_d.jpg',
            'medium640':   '_z_d.jpg',
            'medium500':   '_d.jpg',
            'small': '_m_d.jpg',
            'thumbnail':   '_t_d.jpg',
            'square':  '_s_d.jpg'}

# Get the URL of the frontmost Safari tab and extract the photo info.
thisURL = appscript.app('Safari').documents[0].URL.get()
info = re.findall(infoRE, thisURL)

# Download the main page for that photo and get its "master URL."
# Use the master to generate the URL for the medium500 image
# and print it.
try:
	user = info[0][0]
	photo_id = info[0][1]
	pageURL = baseURL % (user, photo_id)
	html = urlopen(pageURL).read()
	imageURL = re.search(r'<link\s+rel="image_src"\s+href="([^"]+)"', html).group(1)
	imageURL = imageURL.replace(suffixes['master'], suffixes['medium500'])
	sys.stdout.write(imageURL)

#Print an error message if there's any problem.
except:
  sys.stdout.write("wrongpagewrongpage")
