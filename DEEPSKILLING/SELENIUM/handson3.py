from selenium import webdriver
from selenium.webdriver.common.by import By

driver = webdriver.Chrome()
driver.get("https://www.wikipedia.org")

english_link = driver.find_element(By.ID, "js-link-box-en")
english_link.click()

print("Navigated to:", driver.title)
driver.quit()
