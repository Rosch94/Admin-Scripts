from bs4 import BeautifulSoup
import chromedriver_binary

webdriver = chromedriver_binary

# Using chrome driver
driver = webdriver.Chrome()

# Web page url request
driver.get('https://www.dekra.de/de/fahrerlaubnis-und-fahreignung/')
driver.maximize_window()
#time.sleep(10)

# Webscraping with BeautifulSoup
soup = BeautifulSoup(driver.page_source, 'html.parser') 

ads_list = []
for tag in soup.find_all('p'):
    if 'Informationsveranstaltungen' in str(tag):
        ads_list.append(tag)
    else:
        None

print(ads_list[0])