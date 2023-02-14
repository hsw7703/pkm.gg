from selenium import webdriver
import time
import pymysql
import chromedriver_autoinstaller
import ssl

ssl._create_default_https_context = ssl._create_unverified_context

options = webdriver.ChromeOptions()
options.add_argument('headless')
options.add_argument('ignore-certificate-errors')
try:
    driver = webdriver.Chrome("/Users/hanseung-wan/Downloads/chromedriver", options=options)
except:
    path = chromedriver_autoinstaller.install()
    driver = webdriver.Chrome(path, options=options)
#driver = webdriver.Chrome("/Users/hanseung-wan/Downloads/chromedriver", options=options)

driver.implicitly_wait(10)
driver.get(url='https://www.pokemonkorea.co.kr/pokemon-unite/menu127')
li_list = driver.find_elements_by_css_selector('#gamelist1 > li')
urls = []
imgs = []
for news in li_list :
    urls.append(str(news.find_element_by_css_selector('a').get_attribute('href')))
    imgs.append(str(news.find_element_by_css_selector('img.tumb').get_attribute('src')))
for index in range(1, len(urls) + 1):
    urls_idx = len(urls) - index
    url  = urls[urls_idx]
    img = imgs[urls_idx]
    driver.get(url=urls[urls_idx])
    title = driver.find_element_by_css_selector('div.micro-list-title > h3').get_attribute("innerHTML")
    date = driver.find_element_by_css_selector('div.micro-list-title > p').get_attribute("innerHTML")
    print("제목: " + title)
    print("날짜: " + date)
    print("대표이미지: " + img)
    print("내용: " + url)

    db = pymysql.connect(host="pkm.gg", port=3306, user='root', passwd='42Yamyam1!', db='pokemon')
    cursor = db.cursor()
    sql = f"insert into pokemon_news(title, img, date, type, url) value('{title}', '{img}', '{date}', '', '{url}');"
    cursor.execute(sql)
    db.commit()
