from bs4 import BeautifulSoup
import urllib.request
import re

path = "C://Users//kunal//Documents//NetBeansProjects//EMS_School//web//"
url = "https://www.buzzfeed.com/jarrylee/what-to-read-when-youre-expecting?utm_term=.gr5o3EMw5V#.qjkKwJLDAl"
page = urllib.request.urlopen(url).read()
soup = BeautifulSoup(page, "lxml")

book_names = list()
book_images = list()

tags_title = soup('span')
tags_image = soup('img')

for tag_title in tags_title:
	href_class = tag_title.get('class', None)
	if href_class == [u'js-subbuzz__title-text']:
		book_names.append(tag_title.get_text())

book_names = book_names[1:len(book_names)-1]

#for i in book_names:
	#print(i)		

for tag_image in tags_image:
	href_class = tag_image.get('class', None)
	#print(href_class)
	if href_class == [u'subbuzz__media-image', u'js-subbuzz__media', u'js-progressive-image', u'js-pinnable', u'xs-col-12', u'xs-block']:
		img = re.search('url\((.+?)\?', tag_image['style']).group(1)
		book_images.append(img)

#for i in book_images:
	#print(i)		

#print(len(book_images) == len(book_names))

book_dict = {}

for i in range(len(book_images)):
	book_dict[book_names[i]] = book_images[i]

import json
with open(path + 'data.json', 'w', encoding='utf-8') as f:
	json.dump(book_dict, f, ensure_ascii=False)	

try:
	from win10toast import ToastNotifier
	toaster = ToastNotifier()
	toaster.show_toast("Book Update",
	"Your Update is Successful!",
	duration=10)
except:
	print("Not Windows 10")	