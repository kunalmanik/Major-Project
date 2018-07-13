import pymysql
import pandas as pd
import matplotlib.pyplot as plt
#import notify2 # won't work in windows. 'dbus' is gnome library

db = pymysql.connect(host="localhost",    # your host, usually localhost
                     user="root",         # your username
                     passwd="root",  # your password
                     db="ems")        # name of the data base

df = pd.read_sql('SELECT b.prod_id, p.product_name, p.category, p.sub_category, p.featured, p.gender, p.class FROM bookings b JOIN products p ON b.prod_id = p.id;', con=db)

# print(df.head())

path = "C://Users//kunal//Documents//NetBeansProjects//EMS_School//web//admin//graphs//"

temp_df = df.product_name.value_counts();

temp_df.plot(kind='barh')
plt.title('Top Products')
#plt.show();
plt.savefig(path + 'top_prod.png')

temp_df = df.gender.value_counts()

temp_df.plot(kind='barh')
plt.title('Top Products based on Gender')
#plt.show();
plt.savefig(path + 'top_prodGen.png')

temp_df = df["class"].value_counts()

temp_df.plot(kind='barh')
plt.title('Top Products based on Clasess')
#plt.show();
plt.savefig(path + 'top_prodClass.png')

temp_df = df.category.value_counts()

temp_df.plot(kind='barh')
plt.title('Most booked Category')
#plt.show();
plt.savefig(path + 'top_prodCat.png')

temp_df = df.sub_category.value_counts()

temp_df.plot(kind='barh')
plt.title('Most booked Sub-Category')
#plt.show();
plt.savefig(path + 'top_prodSubCat.png')

# from plyer import notification

# notification.notify(
#     title='Here is the title',
#     message='Here is the message',    
# )
try:
	from win10toast import ToastNotifier
	toaster = ToastNotifier()
	toaster.show_toast("Refresh Update",
	"Your Update is Successful!",
	duration=10)
except:
	print("Not Windows 10")