from selenium import webdriver
from selenium.webdriver.common.by import By

driver = webdriver.Chrome()
driver.get("https://www.w3schools.com/html/html_forms.asp")

textbox = driver.find_element(By.ID, "fname")
textbox.send_keys("Risk")

submit_btn = driver.find_element(By.XPATH, "//input[@type='submit']")
submit_btn.click()

driver.quit()
