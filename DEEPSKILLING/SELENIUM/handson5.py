from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

driver = webdriver.Chrome()
driver.get("https://www.google.com")

driver.implicitly_wait(5)  # implicit wait

search_box = driver.find_element(By.NAME, "q")
search_box.send_keys("Selenium waits")
search_box.submit()

# explicit wait
WebDriverWait(driver, 10).until(EC.title_contains("Selenium"))
print("Page title:", driver.title)

driver.quit()
